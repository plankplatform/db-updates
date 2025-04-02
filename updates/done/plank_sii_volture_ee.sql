CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `plank`@`%` 
    SQL SECURITY DEFINER
VIEW `plank_sii_volture_ee` AS
    SELECT 
        `CN`.`idcontratto` AS `id`,
        'VT1' AS `COD_SERVIZIO`,
        '0050' AS `COD_FLUSSO`,
        IF((`CN`.`tipopratica` = 'SWITCH CON VOLTURA'),
            `AG`.`piva`,
            `AZ`.`piva`) AS `PIVA_UTENTE`,
        '05877611003' AS `PIVA_GESTORE`,
        LEFT(CONCAT(`CN`.`idcontratto`,
                    '_',
                    CONVERT( UUID() USING UTF8MB4)),
            15) AS `CP_UTENTE`,
        `CN`.`pod` AS `COD_POD`,
        `CN`.`codfiscale` AS `CF`,
        `CN`.`piva` AS `PIVA`,
        COALESCE(`CN`.`cf_straniero`, '0') AS `CF_STRANIERO`,
        TRIM(COALESCE(UPPER(`CN`.`nome`), '')) AS `NOME`,
        TRIM(COALESCE(UPPER(`CN`.`cognome`), '')) AS `COGNOME`,
        TRIM((CASE
                WHEN
                    ((TRIM(COALESCE(UPPER(`CN`.`nome`), '')) <> '')
                        AND (TRIM(COALESCE(UPPER(`CN`.`cognome`), '')) <> ''))
                THEN
                    ''
                ELSE UPPER(`CN`.`densociale`)
            END)) AS `RAGIONE_SOCIALE_DENOMINAZIONE`,
        COALESCE(`CN`.`referenteamm_cell`,
                `CN`.`referenteamm_tel`,
                '') AS `TELEFONO`,
        `CN`.`referenteamm_email` AS `EMAIL`,
        COALESCE(`CN`.`sedefatt_toponimo`, '') AS `TOPONIMO`,
        COALESCE(`CN`.`sedefatt_via`, '') AS `VIA`,
        COALESCE(`CN`.`sedefatt_civico`, '') AS `CIV`,
        COALESCE(`CN`.`sedefatt_cap`, '') AS `CAP`,
        COALESCE(`GC`.`istat`, '') AS `ISTAT`,
        COALESCE(`CN`.`sedefatt_localita`, '') AS `LOCALITA`,
        COALESCE(`CN`.`sedefatt_prov`, '') AS `PROV`,
        'ITALIA' AS `NAZIONE`,
        '' AS `ALTRO`,
        COALESCE(`CN`.`fornitura_toponimo`, '') AS `TOPONIMO_FATTURAZIONE`,
        COALESCE(`CN`.`fornitura_via`, '') AS `VIA_FATTURAZIONE`,
        COALESCE(`CN`.`fornitura_civico`, '') AS `CIV_FATTURAZIONE`,
        COALESCE(`CN`.`fornitura_cap`, '') AS `CAP_FATTURAZIONE`,
        RIGHT(CONCAT('000000',
                    COALESCE(`CN`.`fornitura_localita_id`, '')),
            6) AS `ISTAT_FATTURAZIONE`,
        COALESCE(`CN`.`fornitura_localita`, '') AS `LOCALITA_FATTURAZIONE`,
        COALESCE(`CN`.`fornitura_prov`, '') AS `PROV_FATTURAZIONE`,
        'ITALIA' AS `NAZIONE_FATTURAZIONE`,
        '' AS `ALTRO_FATTURAZIONE`,
        (CASE `CN`.`tipovoltura`
            WHEN 'VOLTURA ORDINARIA' THEN '01'
            WHEN 'VOLTURA MORTIS CAUSA' THEN '02'
            WHEN 'INCORPORAZIONE SOCIETARIA' THEN '03'
            ELSE '01'
        END) AS `TIPOLOGIA_VOLTURA`,
        (CASE
            WHEN
                ((`CN`.`codicetensione` LIKE 'TD%')
                    AND (`CN`.`residente` = 1))
            THEN
                '01'
            WHEN (`CN`.`codicetensione` LIKE 'TD%') THEN '02'
            WHEN (`CN`.`codicetensione` LIKE '%IP%') THEN '04'
            ELSE '03'
        END) AS `TIPO_CONTRATTO`,
        '' AS `CATEGORIA_CLIENTE`,
        DATE_FORMAT(CURDATE(), '%d/%m/%Y') AS `DATA_RICHIESTA`,
        DATE_FORMAT(`CN`.`decorrenza`, '%d/%m/%Y') AS `DATA_DECORRENZA`,
        '' AS `DATA_DECORRENZA_RET`,
        COALESCE(`AG`.`coddispacciamento`, '') AS `COD_CONTR_DISP`,
        `AZ`.`piva` AS `PIVA_CONTROPARTE_COMMERCIALE`,
        `CN`.`aliva` AS `ALIQUOTA_IVA`,
        IF((`CN`.`codicetensione` LIKE 'TD%'),
            '2.27',
            '1.25') AS `ALIQUOTA_ACCISE`,
        '0' AS `ADDIZ_PROVINCIALE`,
        '0' AS `ADDIZ_COMUNALE`,
        '' AS `ALTRE_INFORMAZIONI`,
        '' AS `NOME_FATTURAZIONE`,
        '' AS `COGNOME_FATTURAZIONE`,
        '' AS `EMAIL_FATTURAZIONE`,
        '' AS `TELEFONO_FATTURAZIONE`,
        IF((`CN`.`dirittoalternativo` = 'SALVAGUARDIA'),
            'S',
            'MT') AS `SERVIZIO_TUTELA`,
        '' AS `CODICE_UFFICIO`,
        '' AS `PAGAMENTO_IVA`,
        CONCAT(COALESCE(`CN`.`codiceateco`, ''),
                CONVERT( IF(((COALESCE(`CN`.`codiceateco`, '') <> '')
                        AND (LENGTH(`CN`.`codiceateco`) > 1)),
                    CONCAT(SUBSTR('00.00.00',
                                (LENGTH(`CN`.`codiceateco`) + 1))),
                    '') USING UTF8MB3)) AS `SETT_MERCEOLOGICO`,
        `L`.`codiceofferta_sii` AS `COD_OFFERTA`,
        'NO' AS `AUTOCERTIFICAZIONE`,
        `CN`.`tipopratica` AS `tipopratica`,
        `CN`.`statolavorazione` AS `statolavorazione`,
        `AG`.`densociale` AS `grossista`,
        `CN`.`particellaazienda` AS `particellaazienda`
    FROM
        ((((((`plank_contratti_forniture_ee` `CN`
        LEFT JOIN `plank_volture` `V` ON ((`CN`.`idcontratto` = `V`.`idcontratto_new`)))
        LEFT JOIN `plank_listini_ee` `L` ON ((`L`.`id` = `CN`.`idlistino`)))
        LEFT JOIN `plank_assegnazionefornitori_ee` `AF` ON (((`AF`.`idcontratto` = `CN`.`idcontratto`)
            AND (`AF`.`decorrenza` <= `CN`.`decorrenza`)
            AND (`AF`.`scadenza` > `CN`.`decorrenza`))))
        LEFT JOIN `plank_anagraficagrossisti` `AG` ON (((`CN`.`particellaazienda` = `AG`.`particellaazienda`)
            AND (`AG`.`codicegrossista` = `AF`.`codicegrossista`))))
        LEFT JOIN `plank_aziende` `AZ` ON ((`AZ`.`particellaazienda` = `CN`.`particellaazienda`)))
        LEFT JOIN (SELECT 
            RIGHT(CONCAT('000000', `plank_geo_cities`.`id_citta`), 6) AS `istat`,
                `plank_geo_cities`.`comune` AS `comune`,
                `plank_geo_cities`.`provincia` AS `provincia`
        FROM
            `plank_geo_cities`
        WHERE
            ((`plank_geo_cities`.`id_citta` IS NOT NULL)
                AND (`plank_geo_cities`.`inactive` = 0)
                AND (`plank_geo_cities`.`particellaazienda` IS NULL)
                AND (`plank_geo_cities`.`country` = 'Italy'))) `GC` ON (((`GC`.`comune` = `CN`.`sedefatt_localita`)
            AND (`GC`.`provincia` = `CN`.`sedefatt_prov`))))
    WHERE
        (((`CN`.`tipopratica` = 'SWITCH CON VOLTURA')
            AND (`CN`.`statolavorazione` = 'ATTESA VOLTURA'))
            OR ((`CN`.`tipopratica` = 'VOLTURA')
            AND (`CN`.`statolavorazione` = 'ATTESA VOLTURA')
            AND (`V`.`idvoltura` IS NOT NULL)))