CREATE DEFINER=`plank`@`%` PROCEDURE `plank_sii_rcu_calcolareport_gas_udd`(IN var_idmassiveimport INT, IN var_periodo VARCHAR(6), IN var_particellaazienda VARCHAR(10))
BEGIN

DECLARE var_perc_consumo_rcu DOUBLE;

UPDATE plank_sii_rcu_dettagli_gas_udd SET idcontratto = NULL, periodo=var_periodo WHERE idmassiveimport=var_idmassiveimport;

 #WORKFLOW AZIENDA
drop table IF EXISTS temp_pc_wf;
CREATE TEMPORARY TABLE temp_pc_wf as (
	select *
	from plank_contratti_workflow_azienda
    WHERE particellaazienda=var_particellaazienda
);
CREATE INDEX temp_pc_wf_ix ON temp_pc_wf (particellaazienda, utility, stato);
DROP TEMPORARY TABLE IF EXISTS _tmp_ct;
CREATE TEMPORARY TABLE _tmp_ct
	SELECT C.idcontratto,C.particellaazienda,F.pdr, C.decorrenza, C.scadenza, C.tipopratica, C.statolavorazione,
    Concat(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto, Coalesce(W.fatturabile, 0) as fatturabile
    FROM plank_contratti C
    LEFT JOIN temp_pc_wf W on W.particellaazienda=C.particellaazienda and C.utility=W.utility and W.stato=C.statolavorazione
    INNER JOIN plank_forniture_gas F on F.idcontratto=C.idcontratto
    WHERE C.particellaazienda=var_particellaazienda
    AND var_periodo between DATE_FORMAT(C.decorrenza, "%Y%m") and DATE_FORMAT(coalesce(C.datacessazione, C.scadenza), "%Y%m");
  
DROP TEMPORARY TABLE IF EXISTS _tmp_ct2;
CREATE TEMPORARY TABLE _tmp_ct2
SELECT * from _tmp_ct;

#TABELLA UTILIZZATA PER TUTTI I CHECK IN MODO DA AVERE GIA' A DISPOSIZIONE I CONTRATTI INFRAMESE
DROP TEMPORARY TABLE IF EXISTS _sii_rcu_dettagli_gas_udd;
CREATE TEMPORARY TABLE _sii_rcu_dettagli_gas_udd
SELECT 
id, C.idcontratto, COD_PDR, COD_REMI, CAPACITA_TRASPORTO, PRELIEVO_CONVENZIONALE_MAX, TIPO_PDR, DISALIMENTABILITA, ID_REG_CLIM, REG_CLIM, PIVA_UDB, DATA_ABB_UDB, DEFAULT_TRAS, STATO_PDR, TIPO_SOSP, DATA_INIZIO_SOSP, DATA_FINE_SOSP, DATA_INIZIO_FOR, DATA_DECORRENZA_RET, DATA_FINE_FOR, DATA_INIZIO_MAND, DATA_FINE_MAND, PIVA_CC, 
RAGIONE_SOCIALE_CC, PIVA_DD, RAGIONE_SOCIALE_DD, CF, PIVA, CF_STRANIERO, NOME, COGNOME, RAGIONE_SOCIALE_DENOMINAZIONE, EMAIL, TELEFONO, REFERENTE, REF_NOME, REF_COGNOME, REF_EMAIL, REF_TELEFONO, RESIDENZA, DATA_VAL_RES, AF_CF, AF_PIVA, AF_CF_STRANIERO, AF_NOME, AF_COGNOME, AF_RAGIONE_SOCIALE_DENOMINAZIONE, ALIQUOTA_IVA, ALIQUOTA_ACCISE, ADDIZ_REGIONALE, ALTRE_INFORMAZIONI, ACCESSO_UI, TIPO_FORNITURA, CODICE_CONTRATTO, CODICE_UFFICIO, PAGAMENTO_IVA, SETT_MERCEOLOGICO, TRATTAMENTO, PREL_ANNUO_PREV, 
COD_PROF_PREL_STD, CAT_USO, ZONA_CLIMATICA, CLASSE_PRELIEVO, PRESENZA_DS, ANNO_TERMICO, MATR_MIS, CLASSE_GRUPPO_MIS, TIPO_MIS, TELEGESTIONE, PRE_CONV, MATR_CONV, N_CIFRE_CONV, ANNO_FABB_CONV, DATA_INST_CONV, COEFF_CORR, PRESS_MISURA, ACC_MIS, N_CIFRE_MIS, ANNO_FABB_MIS, DATA_INST_MIS, GRUPPO_MIS_INT, POT_MAX_RIC, POT_TOT_INST, MAX_PRELIEVO_ORA, BONUS, 
BS_DATA_INIZIO, BS_DATA_FINE, BS_DATA_CESSAZIONE_BONUS, BS_ANNO_VALIDITA, BS_REGIME_COMPENSAZIONE, EROG_SERVIZIO_ENERG, SE_PIVA, SE_CF, SE_RAGIONE_SOCIALE_DENOMINAZIONE, SE_TELEFONO, SE_EMAIL, idmassiveimport, RCU.particellaazienda, periodo
FROM comm.plank_sii_rcu_dettagli_gas_udd RCU
LEFT JOIN _tmp_ct C on C.pdr=RCU.COD_PDR and C.fatturabile = 1
WHERE RCU.idmassiveimport=var_idmassiveimport;


#ASSOCIAZIONE IDCONTRATTO
UPDATE comm.plank_sii_rcu_dettagli_gas_udd RCU
INNER JOIN
(
	SELECT id, GROUP_CONCAT(idcontratto) as idcontratto,cod_pdr
    FROM _sii_rcu_dettagli_gas_udd
    GROUP BY id, cod_pdr
) C on C.id=RCU.id
	SET RCU.idcontratto=C.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and IFNULL(RCU.idcontratto,"")<>C.idcontratto;

DELETE FROM plank_sii_rcu_report_gas WHERE idmassiveimport=var_idmassiveimport;

#CONTRATTI MANCANTI IN PLANK
#SE NON C'E' UN CONTRATTO FATTURABILE NE CERCA UNO NON FATTURABILE - SE LA DECORRENZA SI ACCAVALLA CON
#UN ALTRO CONTRATTO VIENE LASCIATA LA DECORRENZA ATTUALE
#L'UPDATE E' IN BASE AD UN PARAMETRO PER POTER IMPOSTARE SOTTOSTATI O ALTRO SUL CONTRATTO
#SE NON PRESENTE IL PARAMETRO METTE SOLO STATO ATTIVO
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idrcu,idcontratto,pdr,casistica,oldvalue, newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione, decorrenza,infocontratto)
SELECT RCU.idmassiveimport, RCU.id, CT.idcontratto, RCU.COD_PDR, "MISSING PLANK", DATE_FORMAT(CT.decorrenza, "%d/%m/%Y"), IF(F.idcontratto is null, RCU.DATA_INIZIO_FOR, DATE_FORMAT(CT.decorrenza, "%d/%m/%Y")), 
0 as processed, RCU.particellaazienda,
Concat(IFNULL(NULLIF(P.valore, ""), "statolavorazione='ATTIVO'"), ", decorrenza='", IF(F.idcontratto is null, STR_TO_DATE(RCU.DATA_INIZIO_FOR, '%d/%m/%Y'), CT.decorrenza), "'"),"plank_contratti","0",  IF(F.idcontratto is null, STR_TO_DATE(RCU.DATA_INIZIO_FOR, '%d/%m/%Y'), CT.decorrenza),
CT.infocontratto
FROM _sii_rcu_dettagli_gas_udd RCU
LEFT JOIN _tmp_ct2 CT on CT.pdr = RCU.COD_PDR AND fatturabile = 0
LEFT JOIN plank_contratti_forniture_gas F on F.particellaazienda = var_particellaazienda and CT.idcontratto <> F.idcontratto AND F.pdr = RCU.COD_PDR
	and STR_TO_DATE(RCU.DATA_INIZIO_FOR, '%d/%m/%Y') between F.decorrenza AND Coalesce(F.datacessazione, F.scadenza) AND F.statolavorazione NOT IN ("ANNULLAMENTO", "SWITCH KO", "VOLTURA KO", "KO")
LEFT JOIN plank_parametri P ON P.particellaazienda = var_particellaazienda and P.modulo = 'rcu' and P.parametro = 'update_missing_plank'
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.idcontratto IS NULL;

#PDR NON PRESENTI IN RCU
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idcontratto,pdr,casistica,oldvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione, decorrenza, infocontratto)
SELECT var_idmassiveimport, C.idcontratto, C.pdr, "MISSING RCU", C.decorrenza, 0 as processed, C.particellaazienda,"","","0",C.decorrenza,C.infocontratto
FROM (
	SELECT C.idcontratto,C.pdr,C.particellaazienda,C.decorrenza,C.infocontratto
    FROM _tmp_ct C
    LEFT JOIN plank_parametri P on P.particellaazienda = C.particellaazienda and P.modulo = 'rcu' and parametro = 'esclude_missing_plank'
		AND DATE_FORMAT(C.decorrenza, '%Y%m') = var_periodo
    WHERE C.particellaazienda=var_particellaazienda 
		AND C.fatturabile = 1
        AND FIND_IN_SET(C.tipopratica,IFNULL(NULLIF(P.valore,""), "")) = 0 #exclude from missing plank some types of contracts if starting in the period
) C
LEFT JOIN
(
	SELECT id, idcontratto, particellaazienda
    FROM _sii_rcu_dettagli_gas_udd 
    WHERE idmassiveimport=var_idmassiveimport
) RCU on RCU.particellaazienda=C.particellaazienda and C.idcontratto=RCU.idcontratto
WHERE RCU.id IS NULL;

#exclude from check some types of contracts if starting in the period
DROP TEMPORARY TABLE IF EXISTS _tmpdelcheck;
CREATE TEMPORARY TABLE _tmpdelcheck
SELECT E.id, E.idcontratto FROM _sii_rcu_dettagli_gas_udd E
INNER JOIN _tmp_ct C ON E.idcontratto = C.idcontratto
INNER JOIN plank_parametri P on P.particellaazienda = C.particellaazienda and P.modulo = 'rcu' and parametro = 'esclude_missing_plank'
WHERE  C.fatturabile = 1 AND FIND_IN_SET(C.tipopratica,IFNULL(NULLIF(P.valore,""), C.tipopratica)) > 0 
AND DATE_FORMAT(C.decorrenza, '%Y%m') = var_periodo;

DELETE E FROM _sii_rcu_dettagli_gas_udd E
INNER JOIN _tmpdelcheck D ON E.id = D.id and D.idcontratto = E.idcontratto;


#DATA CESSAZIONE
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idcontratto,idrcu,pdr,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_PDR, "DATA CESSAZIONE", coalesce(C.datacessazione,"2050-01-01"), CAL.data, 
                0 as processed, RCU.particellaazienda,"datacessazione","plank_contratti","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_gas_udd RCU
inner join plank_calendario CAL on CAL.data_it=RCU.DATA_FINE_FOR
inner join plank_contratti C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and CAL.data<>coalesce(C.datacessazione,"2050-01-01");

#CODICE FISCALE
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idcontratto,idrcu,pdr,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_PDR, "CODICE FISCALE", C.codfiscale, RCU.cf, 0 as processed, RCU.particellaazienda,"","","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_gas_udd RCU
inner join plank_contratti C on C.idcontratto=RCU.idcontratto
inner join plank_aziende A on A.particellaazienda = var_particellaazienda
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.cf<>coalesce(C.codfiscale,"")
AND RCU.PIVA_CC = A.piva;

#CODICE FISCALE STRANIERO
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idcontratto,idrcu,pdr,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_PDR, "CODICE FISCALE STRANIERO", C.cf_straniero, RCU.cf_straniero, 0 as processed, RCU.particellaazienda,
                "cf_straniero","plank_contratti","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_gas_udd RCU
inner join plank_contratti C on C.idcontratto=RCU.idcontratto
inner join plank_aziende A on A.particellaazienda = var_particellaazienda
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.cf_straniero<>coalesce(C.cf_straniero,"")
AND RCU.PIVA_CC = A.piva;

#PARTITA IVA SOLO SE PROPRI
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idcontratto,idrcu,pdr,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_PDR, "PARTITA IVA", C.piva, RCU.piva, 0 as processed, RCU.particellaazienda,"","","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_gas_udd RCU
inner join plank_contratti C on C.idcontratto=RCU.idcontratto
inner join plank_aziende A on A.particellaazienda = var_particellaazienda
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.piva<>coalesce(C.piva,"")
AND RCU.PIVA_CC = A.piva;

#PARTITA IVA RESELLER = CONTROPARTE COMMERCIALE
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idcontratto,idrcu,pdr,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_PDR, "CONTROPARTE COMMERCIALE", C.piva, RCU.piva_cc, 0 as processed, RCU.particellaazienda,"","","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_gas_udd RCU
inner join plank_contratti C on C.idcontratto=RCU.idcontratto
inner join plank_aziende A on A.particellaazienda = var_particellaazienda
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.piva_cc<>coalesce(C.piva,"")
AND RCU.PIVA_CC <> A.piva;

#NOME SOLO SE PROPRI
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idcontratto,idrcu,pdr,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_PDR, "NOME", C.nome, RCU.nome, 0 as processed, RCU.particellaazienda,
                "nome","plank_contratti","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_gas_udd RCU
inner join plank_contratti C on C.idcontratto=RCU.idcontratto
inner join plank_aziende A on A.particellaazienda = var_particellaazienda
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.nome<>"" and RCU.nome<>coalesce(C.nome,"")
	AND RCU.PIVA_CC = A.piva; 

#COGNOME SOLO SE PROPRI
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idcontratto,idrcu,pdr,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_PDR, "COGNOME", C.cognome, RCU.cognome, 0 as processed, RCU.particellaazienda,
                "cognome","plank_contratti","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_gas_udd RCU
inner join plank_contratti C on C.idcontratto=RCU.idcontratto
inner join plank_aziende A on A.particellaazienda = var_particellaazienda
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.cognome<>"" and RCU.cognome<>coalesce(C.cognome,"")
AND RCU.PIVA_CC = A.piva; 

#RAGIONE SOLO SE PROPRI
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idcontratto,idrcu,pdr,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_PDR, "DEN SOCIALE", C.densociale, RCU.RAGIONE_SOCIALE_DENOMINAZIONE, 0 as processed, RCU.particellaazienda,
                "densociale","plank_contratti","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_gas_udd RCU
inner join plank_contratti C on C.idcontratto=RCU.idcontratto
inner join plank_aziende A on A.particellaazienda = var_particellaazienda
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.RAGIONE_SOCIALE_DENOMINAZIONE<>"" 
	and RCU.RAGIONE_SOCIALE_DENOMINAZIONE<>coalesce(C.densociale,"") and RCU.RAGIONE_SOCIALE_DENOMINAZIONE<>coalesce(concat(RCU.cognome," ",RCU.nome),"")
    AND RCU.PIVA_CC = A.piva; 

#REMI
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idcontratto,idrcu,pdr,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_PDR, "REMI", C.gas_remi, RCU.COD_REMI, 0 as processed, RCU.particellaazienda,
                "gas_remi","plank_forniture_gas","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_gas_udd RCU
inner join plank_contratti_forniture_gas C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.COD_REMI<>"" and RCU.COD_REMI<>coalesce(C.gas_remi,"");

#MATRICOLA CONTATORE
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idcontratto,idrcu,pdr,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_PDR, "MATRICOLA CONTATORE", C.gas_matricola, RCU.MATR_MIS, 0 as processed, RCU.particellaazienda,
                "gas_matricola","plank_forniture_gas","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_gas_udd RCU
inner join plank_contratti_forniture_gas C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.MATR_MIS<>"" and RCU.MATR_MIS<>coalesce(C.gas_matricola,"");

#MATRICOLA CORRETTORE
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idcontratto,idrcu,pdr,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_PDR, "MATRICOLA CORRETTORE", C.gas_matricola_corr, RCU.MATR_CONV, 0 as processed, RCU.particellaazienda,
                "gas_matricola_corr","plank_forniture_gas","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_gas_udd RCU
inner join plank_contratti_forniture_gas C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.MATR_CONV<>"" and RCU.MATR_CONV<>coalesce(C.gas_matricola_corr,"");

#PRELIEVO ANNUO
SET var_perc_consumo_rcu = (SELECT IFNULL(MAX(valore),0) FROM plank_parametri WHERE particellaazienda=var_particellaazienda and modulo="rcu" and parametro="rapporto_consumo");
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idcontratto,idrcu,pdr,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_PDR, "CONSUMO TOT", C.gas_consumoprevisto, cast(REPLACE(RCU.PREL_ANNUO_PREV,",",".") as double), 
                0 as processed, RCU.particellaazienda,"gas_consumoprevisto","plank_forniture_gas","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_gas_udd RCU
inner join plank_contratti_forniture_gas C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and REPLACE(RCU.PREL_ANNUO_PREV,",",".") REGEXP '^[0-9]+\\.?[0-9]*$' and RCU.PREL_ANNUO_PREV NOT LIKE ',%' 
	and ((IFNULL(C.gas_consumoprevisto,0)=0 and C.gas_consumoprevisto<>REPLACE(RCU.PREL_ANNUO_PREV,",",".")) or
		(var_perc_consumo_rcu>0 and (REPLACE(RCU.PREL_ANNUO_PREV,",",".")-C.gas_consumoprevisto)/REPLACE(RCU.PREL_ANNUO_PREV,",",".")>=var_perc_consumo_rcu));

#DESTINAZIONE USO
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idcontratto,idrcu,pdr,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_PDR, "DESTINAZIONE USO", C.gas_destinazioneuso_classe, concat(RCU.CAT_USO,"_",RCU.CLASSE_PRELIEVO), 
                0 as processed, RCU.particellaazienda,"gas_destinazioneuso_classe","plank_forniture_gas","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_gas_udd RCU
inner join plank_contratti_forniture_gas C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.CAT_USO<>"" and RCU.CLASSE_PRELIEVO<>""
                and concat(RCU.CAT_USO,"_",RCU.CLASSE_PRELIEVO)<>IFNULL(C.gas_destinazioneuso_classe,"");

#COEFF C
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idcontratto,idrcu,pdr,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_PDR, "COEFF C", C.gas_coeffc, RCU.COEFF_CORR, 0 as processed, RCU.particellaazienda,
                "gas_coeffc","plank_forniture_gas","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_gas_udd RCU
inner join plank_contratti_forniture_gas C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and REPLACE(RCU.COEFF_CORR,",",".") REGEXP '^[0-9]+\\.?[0-9]*$' and REPLACE(RCU.COEFF_CORR,",",".")<>IFNULL(C.gas_coeffc,0);

#CLASSE MISURATORE
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idcontratto,idrcu,pdr,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_PDR, "CLASSE MISURATORE", C.gas_classemisuratore, 
                REPLACE(REPLACE(REPLACE(REPLACE(CLASSE_GRUPPO_MIS," ",""),"G.",""),"G",""),",","."), 0 as processed, RCU.particellaazienda,
                "gas_classemisuratore","plank_forniture_gas","1",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_gas_udd RCU
inner join plank_contratti_forniture_gas C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.CLASSE_GRUPPO_MIS like '%G%' and
                REPLACE(REPLACE(REPLACE(REPLACE(CLASSE_GRUPPO_MIS," ",""),"G.",""),"G",""),",",".")<>IFNULL(C.gas_classemisuratore ,"");

#CODICE ATECO
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idcontratto,idrcu,pdr,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_PDR, "CODICE ATECO", C.codiceateco, RCU.SETT_MERCEOLOGICO, 
	0 as processed, RCU.particellaazienda,"codiceateco","plank_contratti","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_gas_udd RCU
inner join plank_contratti C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and COALESCE(RCU.SETT_MERCEOLOGICO, '')<>'' and
CONCAT(COALESCE(C.codiceateco, ''),if(COALESCE(C.codiceateco, '')<>'',CONCAT(SUBSTRING('00.00.00', LENGTH(COALESCE(C.codiceateco, ''))+1)),''))<>
CONCAT(COALESCE(RCU.SETT_MERCEOLOGICO, ''),if(COALESCE(RCU.SETT_MERCEOLOGICO, '')<>'',CONCAT(SUBSTRING('00.00.00', LENGTH(COALESCE(RCU.SETT_MERCEOLOGICO, ''))+1)),''));

#NON DISALIMENTABILE
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idcontratto,idrcu,pdr,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_PDR, "NON DISALIMENTABILE",ifnull(C.nondisalimentabile,0), IF(RCU.DISALIMENTABILITA="SI",0,1), 
	0 as processed, RCU.particellaazienda,"nondisalimentabile","plank_forniture_gas","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_gas_udd RCU
inner join plank_contratti_forniture_gas C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.DISALIMENTABILITA IN ("SI","NO") and ifnull(C.nondisalimentabile,0)<>IF(RCU.DISALIMENTABILITA="SI",0,1);

DROP TEMPORARY TABLE IF EXISTS _anadist;
CREATE TEMPORARY TABLE _anadist
SELECT * FROM plank_anadistributori
where utility = 'GAS';

#DISTRIBUTORE
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idcontratto,idrcu,pdr,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_PDR, "DISTRIBUTORE",IFNULL(C.gas_distributore,""), AD.coddistr, 
	0 as processed, RCU.particellaazienda,"gas_distributore","plank_forniture_gas","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_gas_udd RCU
inner join _anadist AD on AD.utility="GAS" and AD.pivadistr=RIGHT(CONCAT("000",RCU.PIVA_DD),11)
inner join plank_contratti_forniture_gas C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and AD.coddistr<>IFNULL(C.gas_distributore,"");

#TIPO PDR
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idcontratto,idrcu,pdr,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_PDR, "TIPO PDR",IFNULL(C.gas_destinazioneuso_sottoclasse,""), RCU.TIPO_PDR, 
	0 as processed, RCU.particellaazienda,"gas_destinazioneuso_sottoclasse","plank_forniture_gas","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_gas_udd RCU
inner join plank_contratti_forniture_gas C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.TIPO_PDR<>IFNULL(C.gas_destinazioneuso_sottoclasse,"");

#PROFILO PRELIEVO
INSERT INTO plank_sii_rcu_report_gas(idmassiveimport,idcontratto,idrcu,pdr,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_PDR, "PROFILO PRELIEVO",IFNULL(comm.plank_gas_getclasseconsumo_rcu(C.idcontratto),""), RCU.COD_PROF_PREL_STD, 
	0 as processed, RCU.particellaazienda,"gas_destinazioneuso_classe","plank_forniture_gas","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_gas_udd RCU
inner join plank_contratti_forniture_gas C on C.idcontratto=RCU.idcontratto
left join plank_parametri PR on var_particellaazienda = PR.particellaazienda and PR.modulo="rcu" and PR.parametro="profilo" 
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.COD_PROF_PREL_STD<>IFNULL(comm.plank_gas_getclasseconsumo_rcu(C.idcontratto),"")
	and coalesce(PR.valore, 0) = 1;
END