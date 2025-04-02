CREATE DEFINER=`plank`@`%` PROCEDURE `plank_sii_rcu_calcolareport_ee`(IN var_idmassiveimport INT, IN var_periodo VARCHAR(6), IN var_particellaazienda VARCHAR(10))
BEGIN

DECLARE var_perc_consumo_rcu DOUBLE;

#CALL plank_allineapc(var_particellaazienda, null);


UPDATE plank_sii_rcu_dettagli_ee SET idcontratto=NULL, periodo=var_periodo WHERE idmassiveimport=var_idmassiveimport;

UPDATE plank_sii_rcu_testate_ee SET periodo=var_periodo WHERE idmassiveimport=var_idmassiveimport;


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
	SELECT C.idcontratto,C.particellaazienda,F.pod, C.decorrenza, C.scadenza, C.tipopratica, C.statolavorazione,
    Concat(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto, Coalesce(W.fatturabile, 0) as fatturabile
    FROM plank_contratti C
    LEFT JOIN temp_pc_wf W on W.particellaazienda=C.particellaazienda and C.utility=W.utility and W.stato=C.statolavorazione
    INNER JOIN plank_forniture_ee F on F.idcontratto=C.idcontratto
    WHERE C.particellaazienda=var_particellaazienda
    AND var_periodo between DATE_FORMAT(C.decorrenza, "%Y%m") and DATE_FORMAT(coalesce(C.datacessazione, C.scadenza), "%Y%m");
  
DROP TEMPORARY TABLE IF EXISTS _tmp_ct2;
CREATE TEMPORARY TABLE _tmp_ct2
SELECT * from _tmp_ct;

#TABELLA UTILIZZATA PER TUTTI I CHECK IN MODO DA AVERE GIA' A DISPOSIZIONE I CONTRATTI INFRAMESE
DROP TEMPORARY TABLE IF EXISTS _sii_rcu_dettagli_ee;
CREATE TEMPORARY TABLE _sii_rcu_dettagli_ee
SELECT 
id, C.idcontratto, COD_POD, AREA_RIF, RAGIONE_SOCIALE_DISTR, PIVA_DISTR, DP, RAGIONE_SOCIALE_UDD, PIVA_UDD, RAGIONE_SOCIALE_CC, PIVA_CC, TIPO_POD, FINE_TIPO_POD, DATA_INIZIO_FORNITURA, DATA_FINE_FORNITURA, DATA_INIZIO_DISPACCIAMENTO, CF, PIVA, CF_STRANIERO, NOME, COGNOME, RAGIONE_SOCIALE_DENOMINAZIONE, EMAIL_REFERENTE, RESIDENZA, SERVIZIO_TUTELA, SETT_MERCEOLOGICO, CODICE_UFFICIO, PAGAMENTO_IVA, IVA, IMPOSTE, TENSIONE, DISALIMENTABILITA, TARIFFA_DISTRIBUZIONE, TIPO_MISURATORE, POTCONTRIMP, POTDISP, CONSUMO_TOT, TRATTAMENTO, TRATTAMENTO_SUCC, REGIME_COMPENSAZIONE, BF_DATA_INIZIO, BF_DATA_FINE, BF_DATA_RINNOVO, BE_DATA_INIZIO, BE_DATA_FINE, BE_DATA_RINNOVO, COMUNIC_BONUS, NUM_CIFRE_EA, NUM_CIFRE_ER, K_TRASFOR_ATT, K_TRASFOR_REA, K_TRASFOR_POT, MAT_MISURATORE_ATT, MAT_MISURATORE_REA, MAT_MISURATORE_POT, INST_MISURATOR_ATT, INST_MISURATOR_REA, INST_MISURATOR_POT, NUM_CIFRE_ATT, NUM_CIFRE_REA, NUM_CIFRE_POT, PRESENZA_MIS, GEST_FORFAIT, 
PMA, idmassiveimport, RCU.particellaazienda, periodo, COD_OFFERTA
FROM comm.plank_sii_rcu_dettagli_ee RCU
LEFT JOIN _tmp_ct C on C.pod=RCU.COD_POD and C.fatturabile = 1
WHERE RCU.idmassiveimport=var_idmassiveimport;

#ASSOCIAZIONE IDCONTRATTO CON GROUP CONCAT PER LE VOLTURE O CAMBI INFRAMESE
UPDATE comm.plank_sii_rcu_dettagli_ee RCU
INNER JOIN
(
	SELECT id, GROUP_CONCAT(idcontratto) as idcontratto,cod_pod
    FROM _sii_rcu_dettagli_ee
    GROUP BY id, cod_pod
) C on C.id=RCU.id
	SET RCU.idcontratto=C.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and IFNULL(RCU.idcontratto,"")<>C.idcontratto;

DELETE FROM plank_sii_rcu_report_ee WHERE idmassiveimport=var_idmassiveimport;

#CONTRATTI MANCANTI IN PLANK
#SE NON C'E' UN CONTRATTO FATTURABILE NE CERCA UNO NON FATTURABILE - SE LA DECORRENZA SI ACCAVALLA CON
#UN ALTRO CONTRATTO VIENE LASCIATA LA DECORRENZA ATTUALE
#L'UPDATE E' IN BASE AD UN PARAMETRO PER POTER IMPOSTARE SOTTOSTATI O ALTRO SUL CONTRATTO
#SE NON PRESENTE IL PARAMETRO METTE SOLO STATO ATTIVO
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idrcu,idcontratto,pod,casistica,oldvalue, newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione, infocontratto)
SELECT RCU.idmassiveimport, RCU.id, CT.idcontratto, RCU.COD_POD as pod, "MISSING PLANK" as casistica, DATE_FORMAT(CT.decorrenza, "%d/%m/%Y"), IF(F.idcontratto is null, RCU.DATA_INIZIO_FORNITURA, DATE_FORMAT(CT.decorrenza, "%d/%m/%Y")), 
	0 as processed, RCU.particellaazienda, 
    Concat(IFNULL(NULLIF(P.valore, ""), "statolavorazione='ATTIVO'"), ", decorrenza='", IF(F.idcontratto is null, STR_TO_DATE(RCU.DATA_INIZIO_FORNITURA, '%d/%m/%Y'), CT.decorrenza), "'"),"plank_contratti","0", 
    CT.infocontratto
FROM _sii_rcu_dettagli_ee RCU
LEFT JOIN _tmp_ct2 CT on CT.pod = RCU.COD_POD AND fatturabile = 0
LEFT JOIN plank_contratti_forniture_ee F on F.particellaazienda = var_particellaazienda and CT.idcontratto <> F.idcontratto AND F.pod = RCU.COD_POD
	and STR_TO_DATE(RCU.DATA_INIZIO_FORNITURA, '%d/%m/%Y') between F.decorrenza AND Coalesce(F.datacessazione, F.scadenza) AND F.statolavorazione NOT IN ("ANNULLAMENTO", "SWITCH KO", "VOLTURA KO", "KO")
LEFT JOIN plank_parametri P ON P.particellaazienda = var_particellaazienda and P.modulo = 'rcu' and P.parametro = 'update_missing_plank'
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.idcontratto IS NULL;

#POD NON PRESENTI IN RCU
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,pod,casistica,oldvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza, infocontratto)
SELECT var_idmassiveimport, C.idcontratto, C.pod, "MISSING RCU" as casistica, C.decorrenza, 0 as processed, C.particellaazienda,"","","0",C.decorrenza, C.infocontratto
FROM 
(
	SELECT C.idcontratto,C.pod,C.particellaazienda,C.decorrenza, C.infocontratto
    FROM _tmp_ct C
    LEFT JOIN plank_parametri P on P.particellaazienda = C.particellaazienda and P.modulo = 'rcu' and parametro = 'esclude_missing_plank'
		AND DATE_FORMAT(C.decorrenza, '%Y%m') = var_periodo
    WHERE C.particellaazienda=var_particellaazienda 
		AND C.fatturabile = 1
        AND FIND_IN_SET(C.tipopratica,IFNULL(NULLIF(P.valore,""), "")) = 0 #include in missing only contracts that have incoming type different from esclude_missing_plank
) C
LEFT JOIN
(
	SELECT id, idcontratto, particellaazienda
    FROM _sii_rcu_dettagli_ee 
    WHERE idmassiveimport=var_idmassiveimport
) RCU on RCU.particellaazienda=C.particellaazienda and C.idcontratto=RCU.idcontratto
WHERE RCU.id IS NULL;

#exclude from check some types of contracts if starting in the period
DROP TEMPORARY TABLE IF EXISTS _tmpdelcheck;
CREATE TEMPORARY TABLE _tmpdelcheck
SELECT E.id, E.idcontratto FROM _sii_rcu_dettagli_ee E
INNER JOIN _tmp_ct C ON E.idcontratto = C.idcontratto
INNER JOIN plank_parametri P on P.particellaazienda = C.particellaazienda and P.modulo = 'rcu' and parametro = 'esclude_missing_plank'
WHERE  C.fatturabile = 1 AND FIND_IN_SET(C.tipopratica,IFNULL(NULLIF(P.valore,""), C.tipopratica)) > 0 
AND DATE_FORMAT(C.decorrenza, '%Y%m') = var_periodo;

DELETE E FROM _sii_rcu_dettagli_ee E
INNER JOIN _tmpdelcheck D ON E.id = D.id and D.idcontratto = E.idcontratto;

#DATA CESSAZIONE
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza, infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "DATA CESSAZIONE", coalesce(C.datacessazione,"2050-01-01"), CAL.data, 
	0 as processed, RCU.particellaazienda,"datacessazione","plank_contratti","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_ee RCU
inner join plank_calendario CAL on CAL.data_it=RCU.DATA_FINE_FORNITURA
inner join plank_contratti C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and CAL.data<>coalesce(C.datacessazione,"2050-01-01");

#CODICE FISCALE
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza, infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "CODICE FISCALE", C.codfiscale, RCU.cf, 0 as processed, RCU.particellaazienda,"codfiscale","plank_contratti","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_ee RCU
inner join plank_contratti C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and IFNULL(RCU.cf,"")<>"" and RCU.cf<>IFNULL(C.codfiscale,"") and coalesce(C.tipologiacliente,"")<>"RESELLER";

#CODICE FISCALE FORNITURA
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza, infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "CF CLIENTE FINALE", C.fornitura_codfiscale, RCU.cf, 0 as processed, RCU.particellaazienda,
	"fornitura_codfiscale","plank_contratti","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_ee RCU
inner join plank_contratti C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and IFNULL(RCU.cf,"")<>"" and RCU.cf<>IFNULL(C.fornitura_codfiscale,"") and C.tipologiacliente="RESELLER";

#CODICE FISCALE STRANIERO
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza, infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "CODICE FISCALE STRANIERO", C.cf_straniero, RCU.cf_straniero, 0 as processed, RCU.particellaazienda,
	"cf_straniero","plank_contratti","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_ee RCU
inner join plank_contratti C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.cf_straniero<>coalesce(C.cf_straniero,"") and coalesce(C.tipologiacliente,"")<>"RESELLER";

#PARTITA IVA
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "PARTITA IVA", C.piva, RCU.piva, 0 as processed, RCU.particellaazienda, "","","0",C.decorrenza, CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_ee RCU
inner join plank_contratti C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and IFNULL(RCU.piva,"")<>"" and RCU.piva<>IFNULL(C.piva,"") and coalesce(C.tipologiacliente,"")NOT IN("RESELLER", "CONDOMINIO");

#PARTITA IVA FORNITURA
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "PIVA CLIENTE FINALE", C.fornitura_piva, RCU.piva, 0 as processed, RCU.particellaazienda, 
	"fornitura_piva","plank_contratti","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_ee RCU
inner join plank_contratti C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and IFNULL(RCU.piva,"")<>"" and RCU.piva<>IFNULL(C.fornitura_piva,"") and C.tipologiacliente="RESELLER";

#NOME
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "NOME", C.nome, RCU.nome, 0 as processed, RCU.particellaazienda,
	"nome","plank_contratti","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_ee RCU
inner join plank_contratti C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.nome<>coalesce(C.nome,"") and RCU.nome<>"" and coalesce(C.tipologiacliente,"")<>"RESELLER";

#COGNOME
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "COGNOME", C.cognome, RCU.cognome, 0 as processed, RCU.particellaazienda,
	"cognome","plank_contratti","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_ee RCU
inner join plank_contratti C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.cognome<>coalesce(C.cognome,"") and RCU.cognome<>"" and coalesce(C.tipologiacliente,"")<>"RESELLER";

#RAGIONE SOCIALE
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "DEN SOCIALE", C.densociale, RCU.RAGIONE_SOCIALE_DENOMINAZIONE, 0 as processed, RCU.particellaazienda,
	"densociale","plank_contratti","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_ee RCU
inner join plank_contratti C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.RAGIONE_SOCIALE_DENOMINAZIONE<>coalesce(C.densociale,"") 
	and RCU.RAGIONE_SOCIALE_DENOMINAZIONE<>"" and RCU.RAGIONE_SOCIALE_DENOMINAZIONE<>coalesce(concat(RCU.cognome," ",RCU.nome),"")
	and coalesce(C.tipologiacliente,"")<>"RESELLER";

DROP TEMPORARY TABLE IF EXISTS _anadist;
CREATE TEMPORARY TABLE _anadist
SELECT * FROM plank_anadistributori
WHERE utility = 'EE';

#DISTRIBUTORE
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "ANAGRAFICA DISTRIBUTORE", "", RCU.piva_distr, 0 as processed, RCU.particellaazienda,
	"","","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_ee RCU
inner join plank_contratti_forniture_ee C on C.idcontratto=RCU.idcontratto
LEFT JOIN _anadist RCU_distr on RIGHT(CONCAT("000",RCU.piva_distr),11) = RCU_distr.pivadistr and RCU_distr.utility = 'EE'
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU_distr.coddistr IS NULL;

INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "DISTRIBUTORE", IFNULL(C.distributore,""), RCU_distr.coddistr, 0 as processed, RCU.particellaazienda,
	"distributore","plank_forniture_ee","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_ee RCU
inner join plank_contratti_forniture_ee C on C.idcontratto=RCU.idcontratto
INNER JOIN _anadist RCU_distr on RIGHT(CONCAT("000",RCU.piva_distr),11) = RCU_distr.pivadistr and ifnull(RCU_distr.iniziopod,'') = substring(C.pod,1,5) and RCU_distr.utility = 'EE'
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU_distr.coddistr <> coalesce(C.distributore,"");


#RESIDENTE
DROP TEMPORARY TABLE IF EXISTS _temp_rcu_ee_residente;
CREATE TEMPORARY TABLE _temp_rcu_ee_residente AS 
(
	SELECT pkriga,valoredouble FROM plank_storicocampi 
    WHERE nometabella="plank_forniture_ee" and nomecampo="residente" and str_to_date(concat(var_periodo,"01"),"%Y%m%d") between da and a
);
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "RESIDENTE",IFNULL(S.valoredouble,C.residente), IF(RCU.RESIDENZA not like 'N%',1,0), 
	0 as processed, RCU.particellaazienda, "residente","plank_forniture_ee","1",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_ee RCU
inner join plank_contratti_forniture_ee C on C.idcontratto=RCU.idcontratto
left join _temp_rcu_ee_residente S on S.pkriga=C.id
WHERE RCU.idmassiveimport=var_idmassiveimport and IF(RCU.RESIDENZA not like 'N%',1,0)<>IF(IFNULL(S.valoredouble,C.residente)=1,1,0) and RCU.RESIDENZA<>"";
DROP TEMPORARY TABLE IF EXISTS _temp_rcu_ee_residente;

#TENSIONE
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "TENSIONE", C.tensione, cast(RCU.TENSIONE as double), 0 as processed, RCU.particellaazienda,
	"tensione","plank_forniture_ee","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_ee RCU
inner join plank_contratti_forniture_ee C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.TENSIONE REGEXP '^[0-9]+\\.?[0-9]*$' and cast(RCU.TENSIONE as double)<>IFNULL(C.tensione,0);

#TARIFFA DISTR
DROP TEMPORARY TABLE IF EXISTS _temp_rcu_ee_codtensione;
CREATE TEMPORARY TABLE _temp_rcu_ee_codtensione AS 
(
	SELECT pkriga,valoretesto FROM plank_storicocampi 
    WHERE nometabella="plank_forniture_ee" and nomecampo="codicetensione" and str_to_date(concat(var_periodo,"01"),"%Y%m%d") between da and a
);
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "TARIFFA DISTR", REPLACE(REPLACE(IFNULL(S.valoretesto,C.codicetensione),"TDR","TD"),"TDNR","TD"), 
	REPLACE(REPLACE(REPLACE(REPLACE(RCU.TARIFFA_DISTRIBUZIONE,"TA",""),"TI",""),"TDR","TD"),"TDNR","TD"), 
    0 as processed, RCU.particellaazienda, "codicetensione","plank_forniture_ee","1",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_ee RCU
inner join plank_contratti_forniture_ee C on C.idcontratto=RCU.idcontratto
left join _temp_rcu_ee_codtensione S on S.pkriga=C.id
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.TARIFFA_DISTRIBUZIONE<>"" and 
	REPLACE(REPLACE(REPLACE(REPLACE(RCU.TARIFFA_DISTRIBUZIONE,"TA",""),"TI",""),"TDR","TD"),"TDNR","TD")<>REPLACE(REPLACE(coalesce(S.valoretesto,C.codicetensione,""),"TDR","TD"),"TDNR","TD");
DROP TEMPORARY TABLE IF EXISTS _temp_rcu_ee_codtensione;

#POTENZA IMPEGNATA
DROP TEMPORARY TABLE IF EXISTS _temp_rcu_ee_potimp;
CREATE TEMPORARY TABLE _temp_rcu_ee_potimp AS 
(
	SELECT pkriga,valoredouble FROM plank_storicocampi 
    WHERE nometabella="plank_forniture_ee" and nomecampo="potenzaimpegnata" and str_to_date(concat(var_periodo,"01"),"%Y%m%d") between da and a
);
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "POTENZA IMPEGNATA", cast(IFNULL(S.valoredouble,C.potenzaimpegnata) as double), 
	cast(REPLACE(RCU.POTCONTRIMP,",",".") as double), 0 as processed, RCU.particellaazienda,"potenzaimpegnata","plank_forniture_ee","1",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_ee RCU
inner join plank_contratti_forniture_ee C on C.idcontratto=RCU.idcontratto
left join _temp_rcu_ee_potimp S on S.pkriga=C.id
WHERE RCU.idmassiveimport=var_idmassiveimport and REPLACE(RCU.POTCONTRIMP,",",".") REGEXP '^[0-9]+\\.?[0-9]*$' 
	and ROUND(cast(REPLACE(RCU.POTCONTRIMP,",",".") as double)-cast(coalesce(S.valoredouble,C.potenzaimpegnata,0) as double),2)<>0;
DROP TEMPORARY TABLE IF EXISTS _temp_rcu_ee_potimp;

#POTENZA DISPONIBILE
DROP TEMPORARY TABLE IF EXISTS _temp_rcu_ee_potdisp;
CREATE TEMPORARY TABLE _temp_rcu_ee_potdisp AS 
(
	SELECT pkriga,valoredouble FROM plank_storicocampi 
    WHERE nometabella="plank_forniture_ee" and nomecampo="potenzadisponibile" and str_to_date(concat(var_periodo,"01"),"%Y%m%d") between da and a
);
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "POTENZA DISPONIBILE", ROUND(cast(IFNULL(S.valoredouble,C.potenzadisponibile) as double),2), 
	ROUND(cast(REPLACE(RCU.POTDISP,",",".") as double), 2), 0 as processed, RCU.particellaazienda,"potenzadisponibile","plank_forniture_ee","1",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_ee RCU
inner join plank_contratti_forniture_ee C on C.idcontratto=RCU.idcontratto
left join _temp_rcu_ee_potdisp S on S.pkriga=C.id
WHERE RCU.idmassiveimport=var_idmassiveimport and REPLACE(RCU.POTDISP,",",".") REGEXP '^[0-9]+\\.?[0-9]*$' 
	and ROUND(cast(REPLACE(RCU.POTDISP,",",".") as double)-cast(coalesce(S.valoredouble,C.potenzadisponibile,0) as double),2)<>0;
DROP TEMPORARY TABLE IF EXISTS _temp_rcu_ee_potdisp;

#CONSUMO TOT
SET var_perc_consumo_rcu = (SELECT IFNULL(MAX(valore),0) FROM plank_parametri WHERE particellaazienda=var_particellaazienda and modulo="rcu" and parametro="rapporto_consumo");
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "CONSUMO TOT", C.consumiprev, cast(REPLACE(RCU.CONSUMO_TOT,",",".") as double), 
	0 as processed, RCU.particellaazienda,"consumiprev","plank_forniture_ee","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_ee RCU
inner join plank_contratti_forniture_ee C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and var_perc_consumo_rcu>0 and REPLACE(RCU.CONSUMO_TOT,",",".") REGEXP '^[0-9]+\\.?[0-9]*$' and RCU.CONSUMO_TOT NOT LIKE ',%' and 
	((IFNULL(C.consumiprev,0)=0 and IFNULL(C.consumiprev,0)<>cast(REPLACE(RCU.CONSUMO_TOT,",",".") as double)) or
    (var_perc_consumo_rcu>0 and ABS(cast(REPLACE(RCU.CONSUMO_TOT,",",".") as double)-C.consumiprev)/cast(REPLACE(RCU.CONSUMO_TOT,",",".") as double)>=var_perc_consumo_rcu));

#CODICE ATECO
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "CODICE ATECO", C.codiceateco, RCU.SETT_MERCEOLOGICO, 
	0 as processed, RCU.particellaazienda,"codiceateco","plank_contratti","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_ee RCU
inner join plank_contratti C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and COALESCE(RCU.SETT_MERCEOLOGICO, '')<>'' and 
CONCAT(COALESCE(C.codiceateco, ''),if(COALESCE(C.codiceateco, '')<>'',CONCAT(SUBSTRING('00.00.00', LENGTH(COALESCE(C.codiceateco, ''))+1)),''))<>
CONCAT(COALESCE(RCU.SETT_MERCEOLOGICO, ''),if(COALESCE(RCU.SETT_MERCEOLOGICO, '')<>'',CONCAT(SUBSTRING('00.00.00', LENGTH(COALESCE(RCU.SETT_MERCEOLOGICO, ''))+1)),''));

#NON DISALIMENTABILE
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "NON DISALIMENTABILE",ifnull(C.nondisalimentabile,0), IF(RCU.DISALIMENTABILITA="Y",0,1), 
	0 as processed, RCU.particellaazienda,"nondisalimentabile","plank_forniture_ee","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_ee RCU
inner join plank_contratti_forniture_ee C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.DISALIMENTABILITA IN ("Y","N") and ifnull(C.nondisalimentabile,0)<>IF(RCU.DISALIMENTABILITA="Y",0,1) and C.tipologiacliente<>"RESELLER";

#UDD
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
SELECT var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "UDD", CONCAT(A.densociale,CHAR(10), CHAR(13),A.piva), CONCAT(RCU.RAGIONE_SOCIALE_UDD,CHAR(10), CHAR(13),RIGHT(CONCAT("0000",RCU.PIVA_UDD),11)), 
	0 as processed, RCU.particellaazienda,"","","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
FROM _sii_rcu_dettagli_ee RCU
LEFT JOIN (
	SELECT A.idcontratto,DATE_FORMAT(A.decorrenza,"%Y%m") as decorrenza,DATE_FORMAT(A.scadenza,"%Y%m") as scadenza,G.piva,G.densociale
    FROM plank_assegnazionefornitori_ee A
    INNER JOIN plank_contrattigrossisti_ee C on C.idcontratto=A.contrattofornitura
    INNER JOIN plank_anagraficagrossisti G on G.codicegrossista=C.codicegrossista
    WHERE A.particellaazienda=var_particellaazienda
) A on A.idcontratto=RCU.idcontratto and RCU.periodo between A.decorrenza and A.scadenza 
inner join plank_contratti_forniture_ee C on C.idcontratto=RCU.idcontratto
WHERE RCU.idmassiveimport=var_idmassiveimport and RCU.PIVA_UDD<>"" and RIGHT(CONCAT("0000",RCU.PIVA_UDD),11)<>A.piva;

#CODICE OFFERTA SII # non metto viene inserito il nome della tabella per prevenire operazione come la storicizzazione o la sovrascrizione
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "CODICE OFFERTA",ifnull(L.codiceofferta_sii,''), RCU.COD_OFFERTA, 
	0 as processed, RCU.particellaazienda,"codiceofferta_sii","","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_ee RCU
inner join plank_contratti_forniture_ee C on C.idcontratto=RCU.idcontratto
inner join plank_listini_ee L on L.id=C.idlistino
WHERE RCU.idmassiveimport=var_idmassiveimport and coalesce(C.tipologiacliente,"")<>"RESELLER" and ifnull(RCU.COD_OFFERTA,'')<>'' and ifnull(L.codiceofferta_sii,'')<>RCU.COD_OFFERTA;

#SERVIZIO TUTELA # non metto viene inserito il nome della tabella per prevenire operazione come la storicizzazione o la sovrascrizione
INSERT INTO plank_sii_rcu_report_ee(idmassiveimport,idcontratto,idrcu,pod,casistica,oldvalue,newvalue,processed,particellaazienda,nomecampo,nometabella,storicizzazione,decorrenza,infocontratto)
select var_idmassiveimport, RCU.idcontratto, RCU.id, RCU.COD_POD, "SERVIZIO TUTELA",ifnull(SC.dirittoalternativo,''), SR.dirittoalternativo, 
	0 as processed, RCU.particellaazienda,"dirittoalternativo","plank_forniture_ee","0",C.decorrenza,CONCAT(C.tipopratica, CHAR(10), CHAR(13), C.statolavorazione) as infocontratto
from _sii_rcu_dettagli_ee RCU
inner join plank_servizio_tutela SR on SR.SERVIZIO_TUTELA=RCU.SERVIZIO_TUTELA and SR.utility='EE'
inner join plank_contratti_forniture_ee C on C.idcontratto=RCU.idcontratto
left join plank_servizio_tutela SC on SC.dirittoalternativo=C.dirittoalternativo and SC.utility='EE'
WHERE RCU.idmassiveimport=var_idmassiveimport and ifnull(RCU.SERVIZIO_TUTELA,'')<>'' and ifnull(SC.SERVIZIO_TUTELA,'')<>SR.SERVIZIO_TUTELA;


DROP TEMPORARY TABLE IF EXISTS temp_pc_wf;
DROP TEMPORARY TABLE IF EXISTS _tmp_ct;
DROP TEMPORARY TABLE IF EXISTS _tmp_ct2;
DROP TEMPORARY TABLE IF EXISTS _sii_rcu_dettagli_ee;
DROP TEMPORARY TABLE IF EXISTS _tmpdelcheck;
DROP TEMPORARY TABLE IF EXISTS _anadist;

END