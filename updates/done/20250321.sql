INSERT INTO `comm`.`plank_parametri` (`id_par`, `particellaazienda`, `valore`) VALUES ('140', 'eems', 'D:\\\\/xampp\\/htdocs\\/plank\\/producipdf_template\\/eems\\/A4_fattura_def.pdf');
INSERT INTO `comm`.`plank_parametri` (`id_par`, `particellaazienda`, `valore`) VALUES ('141', 'eems', 'D:\\\\/xampp\\/htdocs\\/plank\\/producipdf_template\\/eems\\/A4_fattura_def.pdf');

------ STORED PROCEDURE ESITI SII ------
USE `comm`;
DROP procedure IF EXISTS `plank_sii_esitialtrepratiche`;

USE `comm`;
DROP procedure IF EXISTS `comm`.`plank_sii_esitialtrepratiche`;
;

DELIMITER $$
USE `comm`$$
CREATE DEFINER=`plank`@`%` PROCEDURE `plank_sii_esitialtrepratiche`(in var_id INT)
BEGIN
	DECLARE var_cod_servizi VARCHAR(100);
    DECLARE var_cod_disattivazione VARCHAR(100);
    
    SELECT 'DS1,DS3' INTO var_cod_servizi;
    SELECT 'DS1,DS3' INTO var_cod_disattivazione;
    
    #Recupero idcontratto
    UPDATE plank_importesiti_rt_dettagli rtd
    JOIN plank_contratti c ON RIGHT(rtd.cod_prat_utente, 9) = RIGHT(concat('000000000', CAST(c.idcontratto as char)), 9)
    SET rtd.idcontratto = c.idcontratto
    WHERE rtd.idfile = var_id;
    
    #Elimino idcontratto per stessa pratica doppia che viene rifiutata
    UPDATE plank_importesiti_rt_dettagli D
	INNER JOIN (
		select id,idcontratto,cod_servizio,cod_flusso,ROW_NUMBER() over (partition by idcontratto,cod_servizio order by cod_flusso desc,data_richiesta desc) as rn
		from plank_importesiti_rt_dettagli
		where idfile=var_id and FIND_IN_SET(cod_servizio, var_cod_servizi) and idcontratto IS NOT NULL
	) R on R.id=D.id
	SET D.idcontratto=NULL
	WHERE R.rn>1;
    
    #Aggiorno contratto
	UPDATE plank_contratti C
    LEFT JOIN plank_ticket T ON T.idcontratto = C.idcontratto AND T.statolavorazione <> 'CLOSED'
	LEFT JOIN plank_ticket_categorie TC ON T.idsottocategoria = TC.idetichetta AND TC.cod_servizio = 'D01'
	LEFT JOIN plank_forms_executions F ON F.token = T.tokenform 
	INNER JOIN
	(
		SELECT T.particellaazienda, D.idcontratto, D.cod_flusso, D.verifica_amm, D.motivazione, STR_TO_DATE(D.data_esecuzione, '%d/%m/%Y') as data_esecuzione,
			D.cod_servizio, D.esito, ROW_NUMBER() over(partition by D.cod_servizio,D.idcontratto order by D.cod_flusso desc, data_richiesta desc) as rn
		FROM plank_importesiti_rt_dettagli D
		INNER JOIN plank_importesiti_rt T on T.id=D.idfile
		WHERE D.idfile=var_id and FIND_IN_SET(D.cod_servizio, var_cod_servizi) and D.idcontratto IS NOT NULL
	) E on C.particellaazienda=E.particellaazienda and C.idcontratto=E.idcontratto
	SET C.statolavorazione = 
			CASE WHEN FIND_IN_SET(E.cod_servizio, var_cod_disattivazione) AND cod_flusso like '%100' AND E.verifica_amm = 1 THEN 'ATTESA LAVORAZIONE DL'
				WHEN FIND_IN_SET(E.cod_servizio, var_cod_disattivazione) AND cod_flusso like '%150' AND E.esito = 1 THEN 'CESSATO'
                WHEN FIND_IN_SET(E.cod_servizio, var_cod_disattivazione) AND cod_flusso like '%150' AND E.esito = 0 THEN 'ATTIVO'
				ELSE C.statolavorazione 
			END,
		C.datacessazione = 
			CASE WHEN FIND_IN_SET(E.cod_servizio, var_cod_disattivazione) AND cod_flusso like '%150' AND E.esito = 1 
				THEN E.data_esecuzione
				ELSE C.datacessazione 
			END,
        T.statolavorazione = 
			CASE WHEN FIND_IN_SET(E.cod_servizio, var_cod_disattivazione) AND cod_flusso like '%100' AND E.verifica_amm = 1 THEN 'WAITING'
				WHEN FIND_IN_SET(E.cod_servizio, var_cod_disattivazione) AND cod_flusso like '%100' AND E.verifica_amm = 0 THEN 'REFUSED'
				WHEN FIND_IN_SET(E.cod_servizio, var_cod_disattivazione) AND cod_flusso LIKE '%150' AND E.esito = 1 THEN 'CLOSED' 
                WHEN FIND_IN_SET(E.cod_servizio, var_cod_disattivazione) AND cod_flusso LIKE '%150' AND E.esito = 0 THEN 'REFUSED' 
                ELSE T.statolavorazione 
			END
	WHERE C.datacessazione IS NULL and E.rn=1 AND FIND_IN_SET(E.cod_servizio, var_cod_servizi);
    
    #Segno come Processati
	UPDATE plank_importesiti_rt_dettagli D
    INNER JOIN plank_importesiti_rt T on T.id=D.idfile
	INNER JOIN plank_contratti C on C.particellaazienda=T.particellaazienda and C.idcontratto=D.idcontratto
		SET D.processed = 1
	WHERE D.idfile = var_id;
END$$

DELIMITER ;
;


------ STORED PROCEDURE ESITI SII ------