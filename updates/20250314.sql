REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `tiposogg`, `annodich`, `tagname`, `namespace`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2374', '1', 'EnergiaElettrica', 'A', '2024', 'EnergiaElettrica', 'http://energiaelettrica.jaxb.types.controlliEEGN.accise.adm.finanze.it', 'Root', '1', '{\n    \"Dich\": [],\n    \"Anno\": \"\",\n    \"I\": [],\n    \"J\": [],\n    \"L\": [],\n    \"M\": [],\n    \"K\": [],\n    \"P\": [],\n    \"Q\": [],\n    \"EC\": [],\n    \"EF\": []\n}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2375', '4', 'A', '2024', 'A', 'EnergiaElettrica', '1', '{\"Contatore\":[],\"Totale\":\"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2376', '5', 'A', '2024', 'Contatore', 'A', '1000000000', '{ \"Matr\": \"\",\"Kwh\":\"\",\"LettA\": \"\", \"LettP\": \"\",\"DiffLett\": \"\",\"CostLett\": \"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2377', '7', 'B', '2024', 'B', 'EnergiaElettrica', '1', '{\"Contatore\":[],\"Totale\":\"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2378', '8', 'B', '2024', 'Contatore', 'B', '1000000000', '{ \"Matr\": \"\",\"Kwh\":\"\",\"LettA\": \"\", \"LettP\": \"\",\"DiffLett\": \"\",\"CostLett\": \"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2379', '10', 'C', '2024', 'C', 'EnergiaElettrica', '1', '{\"Contatore\":[],\"Totale\":\"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2380', '11', 'C', '2024', 'Contatore', 'C', '1000000000', '{ \"Matr\": \"\",\"Kwh\":\"\",\"LettA\": \"\", \"LettP\": \"\",\"DiffLett\": \"\",\"CostLett\": \"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2381', '13', 'E', '2024', 'E', 'EnergiaElettrica', '1', '{\"Contatore\":[],\"Totale\":\"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2382', '14', 'E', '2024', 'Contatore', 'E', '1000000000', '{ \"Matr\": \"\",\"Kwh\":\"\",\"LettA\": \"\", \"LettP\": \"\",\"DiffLett\": \"\",\"CostLett\": \"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2383', '16', 'G', '2024', 'G', 'EnergiaElettrica', '1', '{\"Contatore\":[],\"Totale\":\"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2384', '17', 'G', '2024', 'Contatore', 'G', '1000000000', '{Matr\": \"\",\"Tipo\": \"\",\"Id\": \"\",\"Kwh\": \"\",\"LettA\": \"\",\"LettP\": \"\",\"DiffLett\": \"\",\"CostLett\": \"\",\"CodCat\": \"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2385', '19', 'H', '2024', 'H', 'EnergiaElettrica', '1', '{\"Contatore\":[],\"Totale\":\"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2386', '20', 'H', '2024', 'Contatore', 'H', '1000000000', '{Matr\": \"\",\"Tipo\": \"\",\"Id\": \"\",\"Kwh\": \"\",\"LettA\": \"\",\"LettP\": \"\",\"DiffLett\": \"\",\"CostLett\": \"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2387', '22', 'I', '2024', 'I', 'EnergiaElettrica', '1', '{\"Query\":\"select tipologia_fornitura_utf as Tipo, codicefiscale as Id, sum(consumoaccise) as Kwh, CodCat from plank_dogane_reportannuale_dettaglioquadri where Quadro = \'I\' and particellaazienda = \'.$particellaazienda.\' and utility = \'EE\' and tokenreport=\'.$tokenreport.\' group by tipologia_fornitura_utf, codicefiscale, CodCat order by CodCat\"}', '{\"Contatore\":[],\"Totale\":\"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2388', '23', 'I', '2024', 'Contatore', 'I', '1000000000', '{\"Tipo\": \"\",\"Id\": \"\",\"Kwh\": \"\",\"CodCat\": \"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2389', '25', 'Perdite', '2024', 'Perdite', 'EnergiaElettrica', '1', '{\"Kwh\":\"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2390', '2', 'Dich', '2024', 'Dich', 'EnergiaElettrica', '1', '{\n    \"Query\": \"SELECT JSON_UNQUOTE(IFNULL(NULLIF(JSON_EXTRACT(CAST(a.codiceditta_adm AS JSON), \'$.EE\'),\'\'),\'AAA00000A\')) as CodDitta, \'A\' as TipoSogg, \'\' AS CodAtt, a.sedelegale_localita as ComUffAmm, a.sedelegale_prov As ProvUffAmm, a.sedelegale_indirizzo as IndUffAmm FROM comm.plank_dogane_reportannuale AS d INNER JOIN comm.plank_aziende a on a.particellaazienda = d.particellaazienda where d.particellaazienda=\'.$particellaazienda.\' and d.tokenreport=\'.$tokenreport.\' LIMIT 1\"\n}', '{\"CodDitta\": \"\",\"TipoSogg\": \"\", \"CodAtt\": \"\",\"ComUffAmm\": \"\",\"ProvUffAmm\": \"\",\"IndUffAmm\": \"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2391', '26', 'J', '2024', 'J', 'EnergiaElettrica', '1000000000', '{\"Query\":\"select provincia as Prov, CodCat, 0 as Mese, Rigo as Progr, 0 as QtaUP, Count(distinct pdp) as NumUt, SUM(consumoaccise) as QtaUC from plank_dogane_reportannuale_dettaglioquadri where Quadro = \'J\'and particellaazienda = \'.$particellaazienda.\' and utility = \'EE\' and tokenreport=\'.$tokenreport.\' group by  provincia, CodCat, Rigo ORDER BY Prov, CodCat, Progr\",\"GroupBy\":\"Prov,CodCat,Mese\"}', '{\"Prov\":\"\",\"CodCat\":\"\",\"Mese\":\"\",\"Consumi\":[]}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2392', '27', 'J', '2024', 'Consumi', 'J', '5', '{\"Progr\":\"\",\"QtaUP\":\"\",\"NumUt\":\"\",\"QtaUC\":\"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2393', '28', 'L', '2024', 'L', 'EnergiaElettrica', '1000000000', '{\"Query\":\"select provincia as Prov, CodCat, 0 as Mese, Rigo as Progr, \'0\' as QtaUP, Count(distinct pdp) as NumUt, SUM(consumoaccise) as QtaUC from plank_dogane_reportannuale_dettaglioquadri where Quadro = \'L\' and particellaazienda = \'.$particellaazienda.\' and utility = \'EE\' and tokenreport=\'.$tokenreport.\' group by  provincia, CodCat, Rigo order by  Prov, CodCat, Progr\",\"GroupBy\":\"Prov,CodCat,Mese\"}', '{\"Prov\":\"\",\"CodCat\":\"\",\"Mese\":\"\",\"Consumi\":[]}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2394', '29', 'L', '2024', 'Consumi', 'L', '11', '{\"Progr\":\"\",\"QtaUP\":\"\",\"NumUt\":\"\",\"QtaUC\":\"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2395', '30', 'M', '2024', 'M', 'EnergiaElettrica', '1000000000', '{\"Query\":\"select provincia as Prov, CodCat, 0 as Mese, Rigo as Progr, 0 as QtaUP, Count(distinct pdp) as NumUt, SUM(consumoaccise) as QtaUC from plank_dogane_reportannuale_dettaglioquadri where Quadro = \'M\' and particellaazienda = \'.$particellaazienda.\' and utility = \'EE\' and tokenreport=\'.$tokenreport.\' group by  provincia, CodCat, Rigo order by  Prov, CodCat, Progr\",\"GroupBy\":\"Prov,CodCat,Mese\"}', '{\"Prov\":\"\",\"CodCat\":\"\",\"Mese\":\"0\",\"Consumi\":[]}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2396', '31', 'M', '2024', 'Consumi', 'M', '11', '{\"Progr\":\"\",\"QtaUP\":\"\",\"NumUt\":\"\",\"QtaUC\":\"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2397', '32', 'K', '2024', 'K', 'EnergiaElettrica', '1000000000', '{\"Query\":\"select Q.provincia as Prov, Q.CodCat, Q.Rigo as Progr, REPLACE(FORMAT(SUM(Q.consumoaccise), 0), \',\', \'\') as Qta, REPLACE(FORMAT(corrispettivoaccise, 7), \',\', \'\') as Aliq, REPLACE(FORMAT(Round(SUM(Q.corrispettivoaccise * Q.consumoaccise), 2), 2), \',\', \'\') as Imp,  REPLACE(FORMAT(T.totale, 2), \',\', \'\') as Totale from plank_dogane_reportannuale_dettaglioquadri Q INNER JOIN (select provincia, CodCat, Rigo, Round(SUM(corrispettivoaccise * consumoaccise), 2) as Totale from plank_dogane_reportannuale_dettaglioquadri Q where Quadro = \'K\' and Rigo between 1 and 8 and particellaazienda = \'.$particellaazienda.\' and utility = \'EE\' and tokenreport=\'.$tokenreport.\' group by  provincia, CodCat, Rigo) T ON T.provincia = Q.provincia and T.CodCat = Q.CodCat and T.Rigo = Q.Rigo where Q.Quadro = \'K\' and Q.Rigo between 1 and 8 and particellaazienda = \'.$particellaazienda.\' and utility = \'EE\' and tokenreport=\'.$tokenreport.\' group by  Q.provincia, Q.CodCat, Q.Rigo, Q.corrispettivoaccise HAVING ABS(SUM(Q.consumoaccise)) > 0 order by Prov, CodCat, Progr;\",\"GroupBy\":\"Prov,CodCat\"}', '{\"Prov\":\"\",\"CodCat\":\"\",\"Rettifica\":[]}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2398', '33', 'K', '2024', 'Rettifica', 'K', '22', '{\"GroupBy\":\"Prov,CodCat,Progr,Totale\"}', '{\"Progr\":\"\",\"Dettaglio\":[],\"Totale\":\"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2399', '34', 'K', '2024', 'Dettaglio', 'Rettifica', '1000000000', '{\"GroupBy\":\"Prov,CodCat,Progr,Totale,Aliq\"}', '{\"Qta\":\"\",\"Aliq\":\"\",\"Imp\":\"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2400', '36', 'P', '2024', 'P', 'EnergiaElettrica', '1000000000', '{\n    \"Query\": \"select Q.provincia as Prov, 0 AS Mese, \'1411\' as Cap, \'01\' as Art, CASE WHEN Q.Rigo between 1 and 5 or Q.Rigo between 7 and 9 THEN \'0\' WHEN Q.Rigo IN (6, 10, 11, 13) THEN \'1\' ELSE \'9\' END AS TipoR, Q.Rigo as Progr, CASE WHEN Q.Rigo IN (6, 10, 11, 13, 14) THEN \'\' ELSE REPLACE(FORMAT(SUM(Q.consumoaccise), 0), \',\', \'\') END as Qta, CASE WHEN Q.Rigo IN (6, 10, 11, 13, 14) THEN \'\' ELSE REPLACE(FORMAT(Q.corrispettivoaccise, 7), \',\', \'\') END AS Aliq, REPLACE(FORMAT(T.totale, 2), \',\', \'\') AS Totale from plank_dogane_reportannuale_dettaglioquadri Q INNER JOIN (select provincia, Rigo, IF(Rigo IN (13, 14), SUM(corrispettivoaccise), Round(SUM(corrispettivoaccise * consumoaccise), 2)) as Totale from plank_dogane_reportannuale_dettaglioquadri Q where Quadro = \'P\' and particellaazienda = \'.$particellaazienda.\' and utility = \'EE\' and tokenreport=\'.$tokenreport.\' group by provincia, Rigo) T ON T.provincia = Q.provincia and T.Rigo = Q.Rigo where Q.Quadro = \'P\' and particellaazienda = \'.$particellaazienda.\' and utility = \'EE\' and tokenreport=\'.$tokenreport.\' group by  Q.provincia, Q.Rigo, CASE WHEN Q.rigo IN (6, 10, 11, 13, 14) THEN \'\' ELSE REPLACE(FORMAT(Q.corrispettivoaccise, 7), \',\', \'\') END order by  Prov, Mese,  Cap, Art, Progr, Aliq;\",\n    \"GroupBy\": \"Prov,Mese,Cap,Art\"\n}', '{\"Prov\":\"\",\"Mese\":\"\",\"Cap\":\"\",\"Art\":\"\",\"Liquid\":[]}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2401', '37', 'P', '2024', 'Liquid', 'P', '13', '{\"GroupBy\":\"Prov,Mese,Cap,Art,Progr,TipoR,Totale\"}', '{\"Progr\":\"\",\"TipoR\":\"\",\"Dettaglio\":[],\"Totale\":\"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2402', '38', 'P', '2024', 'Dettaglio', 'Liquid', '1000000000', '{\"GroupBy\":\"Prov,Mese,Cap,Art,Progr,TipoR,Totale,Aliq\"}', '{\"Qta\":\"\",\"Aliq\":\"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2403', '40', 'Q', '2024', 'Q', 'EnergiaElettrica', '1000000000', '{\n    \"Query\": \"select Q.ambito as Ambito, \'1411\' as Cap, \'01\' as Art, Q.Rigo as Progr, CAST(ROUND(SUM(corrispettivoaccise), 2) AS DECIMAL(12,2)) as Imp from plank_dogane_reportannuale_dettaglioquadri Q where Q.Quadro = \'Q\' and particellaazienda = \'.$particellaazienda.\' and utility = \'EE\' and tokenreport=\'.$tokenreport.\' group by  Q.ambito, Q.Rigo order by  Ambito,  Cap, Art, Progr;\",\n    \"GroupBy\": \"Ambito,Cap,Art\"\n}', '{\"Ambito\":\"\",\"Cap\":\"\",\"Art\":\"\",\"RiepSaldo\":[]}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2404', '41', 'Q', '2024', 'RiepSaldo', 'Q', '15', '{\"GroupBy\":\"Ambito,Cap,Art,Progr\"}', '{\"Progr\":\"\",\"Imp\":\"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2405', '42', 'R', '2024', 'R', 'EnergiaElettrica', '1000000000', '{\"GroupBy\":\"Prov,Cap,Art\"}', '{\"Prov\":\"\",\"Cap\":\"\",\"Art\":\"\",\"Liquid\":[]}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2406', '43', 'R', '2024', 'Liquid', 'R', '12', '{\"GroupBy\":\"Prov,Cap,Art,Progr\"}', '{\"Progr\":\"\",\"Imp\":\"\",\"Totale\":\"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2407', '44', 'S', '2024', 'S', 'EnergiaElettrica', '1000000000', '{\"GroupBy\":\"Prov,Cap,Art\"}', '{\"Prov\":\"\",\"Cap\":\"\",\"Art\":\"\",\"RiepSaldo\":[]}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2408', '45', 'S', '2024', 'RiepSaldo', 'S', '3', '{\"GroupBy\":\"Prov,Cap,Art,Progr\"}', '{\"Progr\":\"\",\"Imp\":\"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2409', '46', 'EC', '2024', 'EC', 'EnergiaElettrica', '1000000000', '{\"Query\":\"select Q.provincia as Prov, Q.codicefiscale as Id, Q.Quadro as TipoUsoQ, IF(Q.Quadro = \'I\',\'Q\', Q.Rigo) as TipoUsoR,IF(Q.percesclusioneaccise <> 0, 2, 1) AS ModApp, IF(Q.percesclusioneaccise <> 0, Q.percesclusioneaccise, \'\') as Perc,pdp as POD, SUM(consumoaccise) as Qta, indirizzo as Ind, CodCat, REPLACE(FORMAT(SUM(corrispettivoaccise * consumoaccise), 2), \',\', \'\') as Accisa,DATE_FORMAT(decorrenza, \'%Y-%m-%d\') as DataI, DATE_FORMAT(scadenza, \'%Y-%m-%d\') AS DataF from plank_dogane_reportannuale_dettaglioquadri Q where (Q.Quadro = \'J\' OR (Q.Quadro = \'M\' AND Rigo = 12) OR (Q.Quadro = \'L\' and Rigo <> \'9\') OR (Q.Quadro = \'I\' and tipologia_fornitura_utf = \'Q\')) and particellaazienda = \'.$particellaazienda.\' and utility = \'EE\' and tokenreport=\'.$tokenreport.\' group by  Q.provincia, Q.codicefiscale, Quadro, IF(Q.Quadro = \'I\',\'Q\', Q.Rigo), CodCat order by Prov, Id, POD;\",\"GroupBy\":\"Prov\"}', '{\"Prov\":\"\",\"Cliente\":[]}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2410', '47', 'EC', '2024', 'Cliente', 'EC', '1000000000', '{\"Id\":\"\",\"TipoUsoQ\":\"\",\"TipoUsoR\":\"\",\"ModApp\":\"\",\"Perc\":\"\",\"POD\":\"\",\"Qta\":\"\",\"Ind\":\"\",\"CodCat\":\"\",\"Accisa\":\"\",\"DataI\":\"\",\"DataF\":\"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2411', '48', 'EF', '2024', 'EF', 'EnergiaElettrica', '1000000000', '{\n    \"Query\": \"Select \'A\' as Proven, \'00000000000\' as Id, \'0\' as Qta\"\n}', '{\"Fornitore\":[]}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2412', '49', 'EF', '2024', 'Fornitore', 'EF', '1000000000', '{\"Proven\":\"\",\"Id\":\"\",\"Qta\":\"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2413', '50', 'PROGRESSIVI', '2024', 'PROGRESSIVI', 'EnergiaElettrica', '1', '{ \"Query\" : \"SELECT 1 as ProgrInvio, 1 as TotProgr;\"}', '{\"ProgrInvio\":\"\",\"TotProgr\":\"\"}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `tiposogg`, `annodich`, `tagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2414', '1', 'EnergiaElettrica', 'A', '2024', 'EnergiaElettrica', '1', '{\n    \"A\": [],\n    \"B\": [],\n    \"C\": [],\n    \"E\": [],\n    \"G\": [],\n    \"H\": [],\n    \"I\": [],\n    \"J\": [],\n    \"L\": [],\n    \"M\": [],\n    \"K\": [],\n    \"P\": [],\n    \"Q\": [],\n    \"EC\": [],\n    \"EF\": []\n}', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2415', '52', 'I', '2024', 'Totale', 'I', '1', '{\"Query\":\"select sum(consumoaccise) as Totale from plank_dogane_reportannuale_dettaglioquadri where Quadro = \'I\' and particellaazienda = \'.$particellaazienda.\' and utility = \'EE\' and tokenreport=\'.$tokenreport.\';\"}', '\"\"', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `tiposogg`, `annodich`, `tagname`, `namespace`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2416', '54', 'GasNaturale', 'S', '2024', 'GasNaturale', 'http://gasnaturale.jaxb.types.controlliEEGN.accise.adm.finanze.it', 'Root', '1', '{\n    \"Dich\": [],\n    \"Anno\": \"\",\n    \"D\": [],\n    \"E\": [],\n    \"F\": [],\n    \"G\": [],\n    \"H\": [],\n    \"I\": [],\n    \"L\": [],\n    \"M\": [],\n    \"N\": [],\n    \"EC\": [],\n    \"EF\": []\n}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2417', '55', 'D', '2024', 'D', 'GasNaturale', '1', '{\"Query\":\"select tipologia_fornitura_utf as Tipo, codicefiscale as Id, REPLACE(FORMAT(sum(consumoaccise),0), \',\',\'\') as Mc, CodCat from plank_dogane_reportannuale_dettaglioquadri where  quadro = \'D\' and tokenreport = \'.$tokenreport.\' and particellaazienda = \'.$particellaazienda.\' and utility = \'GAS\' GROUP by tipologia_fornitura_utf, codicefiscale, CodCat;\"}', '{\"Venduto\":[],\"Totale\":\"\"}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2418', '56', 'D', '2024', 'Venduto', 'D', '1', '{\"Tipo\":\"\",\"Id\":\"\",\"Mc\":\"\",\"CodCat\":\"\"}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2419', '57', 'E', '2024', 'E', 'GasNaturale', '1', '{\"Query\":\"select provincia as Prov, CodCat, Rigo as Progr, Count(distinct pdp) as NumUt, ROUND(sum(consumoaccise),0) as Qta from plank_dogane_reportannuale_dettaglioquadri where  quadro = \'E\' and tokenreport = \'.$tokenreport.\' and particellaazienda = \'.$particellaazienda.\'  GROUP by provincia, CodCat, Rigo having abs(ROUND(sum(consumoaccise),0)) <> 0 order by Prov,CodCat,Progr; \",\"GroupBy\":\"Prov,CodCat\"}', '{\"Prov\":\"\",\"CodCat\":\"\",\"FatturatoImpiegato\":[]}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2420', '58', 'E', '2024', 'FatturatoImpiegato', 'E', '1000000000', '{\"Progr\":\"\",\"NumUt\":\"\",\"Qta\":\"\"}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2421', '59', 'F', '2024', 'D', 'GasNaturale', '1000000000', '{\"Query\":\"select provincia as Prov, CodCat, \'\' AS FascClim, Rigo as Progr, Count(distinct pdp) as NumUt, ROUND(sum(consumoaccise),0) as Qta from plank_dogane_reportannuale_dettaglioquadri where  quadro = \'F\' and tokenreport = \'.$tokenreport.\' and particellaazienda = \'.$particellaazienda.\'  and utility = \'GAS\' GROUP by provincia, CodCat, Rigo order by Prov,CodCat,FascClim,Progr;\",\"GroupBy\":\"Prov,CodCat,FascClim\"}', '{\"Prov\":\"\",\"CodCat\":\"\",\"FascClim\":\"\",\"FatturatoImpiegato\":[]}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2422', '60', 'F', '2024', 'FatturatoImpiegato', 'F', '1000000000', '{\"Progr\":\"\",\"NumUt\":\"\",\"Qta\":\"\"}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2423', '61', 'G', '2024', 'G', 'GasNaturale', '1000000000', '{\"Query\":\"select provincia as Prov, CodCat, Rigo as Progr, Count(distinct pdp) as NumUt, ROUND(sum(consumoaccise),0) as Qta from plank_dogane_reportannuale_dettaglioquadri where  quadro = \'G\' and tokenreport = \'.$tokenreport.\' and particellaazienda = \'.$particellaazienda.\'  and utility = \'GAS\' GROUP by provincia, CodCat, Rigo ORDER BY Prov,CodCat,Progr;\",\"GroupBy\":\"Prov,CodCat\"}', '{\"Prov\":\"\",\"CodCat\":\"\",\"FatturatoImpiegato\":[]}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2424', '62', 'G', '2024', 'FatturatoImpiegato', 'G', '1000000000', '{\"Progr\":\"\",\"NumUt\":\"\",\"Qta\":\"\"}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2425', '63', 'H', '2024', 'H', 'GasNaturale', '1000000000', '{\"Query\":\"select Q.provincia as Prov, Q.CodCat, Q.Rigo as Progr,  IF(Q.Rigo between 3 and 9, IF(macrozona = \'Nord\', \'C\', \'M\'), \'\') AS Localiz,  IF(Q.Rigo IN (14,16,17), \'\', ROUND(sum(Q.consumoaccise),0)) as Qta, IF(Q.Rigo IN (14,16,17), \'\', REPLACE(FORMAT(Q.corrispettivoaccise, 7),\',\',\'\')) as Aliq, REPLACE(FORMAT(sum(IF(Q.Rigo IN (14,16,17),1, Q.consumoaccise) * Q.corrispettivoaccise), 2),\',\',\'\') AS Imp, Q1.Totale from plank_dogane_reportannuale_dettaglioquadri Q INNER JOIN ( SELECT provincia, CodCat, Rigo,REPLACE(FORMAT(sum(IF(Rigo IN (14,16,17),1, consumoaccise) * corrispettivoaccise), 2),\',\',\'\') as Totale     from plank_dogane_reportannuale_dettaglioquadri      where  quadro = \'H\' and tokenreport = \'.$tokenreport.\' and particellaazienda = \'.$particellaazienda.\'     and utility = \'GAS\'     GROUP BY provincia, CodCat, Rigo ) Q1 ON Q.provincia = Q1.provincia and Q.CodCat = Q1.CodCat and Q.Rigo = Q1.RIgo where  quadro = \'H\' and tokenreport = \'.$tokenreport.\' and particellaazienda = \'.$particellaazienda.\'  and utility = \'GAS\' GROUP by Q.provincia, Q.CodCat, Q.Rigo, IF(Q.Rigo between 3 and 9, IF(macrozona = \'Nord\', \'C\', \'M\'), \'\'), IF(Q.Rigo IN (14,16,17), \'\', REPLACE(FORMAT(Q.corrispettivoaccise, 7),\',\',\'\')) order by prov,codcat,progr,localiz\",\"GroupBy\":\"Prov,CodCat\"}', '{\"Prov\":\"\",\"CodCat\":\"\",\"Rettifica\":[]}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2426', '64', 'H', '2024', 'Rettifica', 'H', '17', '{\"GroupBy\":\"Prov,CodCat,Progr,Totale,Localiz\"}', '{\"Progr\":\"\",\"Dettaglio\":[],\"Totale\":\"\"}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2427', '65', 'H', '2024', 'Dettaglio', 'Rettifica', '1000000000', '{\"GroupBy\":\"Prov,CodCat,Progr,Totale,Localiz,Aliq\"}', '{\"Localiz\":\"\",\"Qta\":\"\",\"Aliq\":\"\",\"Imp\":\"\"}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2428', '66', 'I', '2024', 'I', 'GasNaturale', '1000000000', '{\"Query\":\"select Q.provincia as Prov, Coalesce(Month(inizioattivita), 0) AS Mese, Q.Rigo as Progr,  IF(Q.Rigo between 1 and 4, \'1412\', \'1421\') AS Cap,  \'00\' AS Art, CASE WHEN Q.Rigo = 1 OR Q.Rigo between 5 and 18 THEN \'0\' WHEN Q.Rigo in (2,3,19,20) THEN 1 ELSE 9 END AS TipoR, IF(Q.Rigo IN (2,3,4,19,20,21), \'\', ROUND(sum(Q.consumoaccise),0)) as Qta, IF(Q.Rigo IN (2,3,4,19,20,21), \'\', REPLACE(FORMAT(Q.corrispettivoaccise, 7),\',\',\'\')) as Aliq, REPLACE(FORMAT(sum(IF(Q.Rigo IN (2,3,4,19,20,21),1, Q.consumoaccise) * Q.corrispettivoaccise), 2),\',\',\'\') AS Imp, Q1.Totale from plank_dogane_reportannuale_dettaglioquadri Q INNER JOIN ( SELECT provincia, Rigo,REPLACE(FORMAT(sum(IF(Rigo IN (12,3,4,19,20,21),1, consumoaccise) * corrispettivoaccise), 2),\',\',\'\') as Totale     from plank_dogane_reportannuale_dettaglioquadri      where  quadro = \'I\' and tokenreport = \'.$tokenreport.\' and particellaazienda = \'.$particellaazienda.\'     and utility = \'GAS\'     GROUP BY provincia, Rigo ) Q1 ON Q.provincia = Q1.provincia and Q.Rigo = Q1.RIgo where  quadro = \'I\' and tokenreport = \'.$tokenreport.\' and particellaazienda = \'.$particellaazienda.\'  and utility = \'GAS\' GROUP by Q.provincia, Q.Rigo, IF(Q.Rigo IN (2,3,4,19,20,21), \'\', REPLACE(FORMAT(Q.corrispettivoaccise, 7),\',\',\'\')) ORDER BY Prov,Mese,Cap,Art\",\"GroupBy\":\"Prov,Mese,Cap,Art\"}', '{\"Prov\":\"\",\"Mese\":\"\",\"Cap\":\"\",\"Art\":\"\",\"Liquid\":[]}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2429', '67', 'I', '2024', 'Liquid', 'I', '1000000000', '{\"GroupBy\":\"Prov,Mese,Cap,Art,Progr,Totale\"}', '{\"Progr\":\"\",\"TipoR\":\"\",\"Dettaglio\":[],\"Totale\":\"\"}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2430', '68', 'I', '2024', 'Dettaglio', 'Liquid', '1000000000', '{\"GroupBy\":\"Prov,Mese,Cap,Art,Progr,Totale,Aliq\"}', '{\"Qta\":\"\",\"Aliq\":\"\"}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2431', '69', 'I', '2024', 'Totale', 'Liquid', '1', '\"\"', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2432', '70', 'L', '2024', 'L', 'GasNaturale', '1000000000', '{\"Query\":\"select Ambito, IF (Rigo =11 OR Rigo between 1 and 5, \'1412\', \'1421\') as Cap, \'00\' As Art, Rigo as Progr,  REPLACE(FORMAT(Sum(corrispettivoaccise), 2), \',\',\'\') as Imp from plank_dogane_reportannuale_dettaglioquadri where  quadro = \'L\' and tokenreport = \'.$tokenreport.\' and particellaazienda = \'.$particellaazienda.\'  and utility = \'GAS\' GROUP by Ambito, Rigo ORDER BY Ambito,Cap,Art;\",\"GroupBy\":\"Ambito,Cap,Art\"}', '{\"Ambito\":\"\",\"Cap\":\"\",\"Art\":\"\",\"RiepSaldo\":[]}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2433', '71', 'L', '2024', 'RiepSaldo', 'L', '15', '{\"GroupBy\":\"Ambito,Cap,Art,Progr\"}', '{\"Progr\":\"\",\"Imp\":\"\"}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2434', '72', 'M', '2024', 'M', 'GasNaturale', '1000000000', '{\n    \"Query\": \" select Q.provincia as Prov, Q.zonaipex AS FascClim, Q.Rigo as Progr, \'\' as TipoR, ROUND(sum(Q.consumoaccise),0) as Qta, REPLACE(FORMAT(Q.corrispettivoaccise, 7),\',\',\'\') as Aliq, Q1.Totale, \'\' as Imp from plank_dogane_reportannuale_dettaglioquadri Q INNER JOIN ( SELECT provincia, Rigo, REPLACE(FORMAT(sum(consumoaccise * corrispettivoaccise), 2),\',\',\'\') as Totale     from plank_dogane_reportannuale_dettaglioquadri      where  quadro = \'M\' and tokenreport = \'.$tokenreport.\' and particellaazienda = \'.$particellaazienda.\'     and utility = \'GAS\'     and Rigo between 1 and 6     GROUP BY provincia, Rigo ) Q1 ON Q.provincia = Q1.provincia and Q.Rigo = Q1.RIgo where  Q.quadro = \'M\' and Q.tokenreport = \'.$tokenreport.\' and Q.particellaazienda = \'.$particellaazienda.\'  and Q.utility = \'GAS\' and Q.Rigo between 1 and 6 GROUP by Q.provincia, Q.Rigo, REPLACE(FORMAT(Q.corrispettivoaccise, 7),\',\',\'\') UNION ALL select Q.provincia as Prov, Q.zonaipex AS FascClim, Q.Rigo as Progr, IF(Q.Rigo = 9, 9, 1) AS TipoR, \'\' as Qta, \'\' as Aliq, \'\' as Totale, REPLACE(FORMAT(sum(IF(Rigo=7, Q.consumoaccise,  1) * Q.corrispettivoaccise), 2),\',\',\'\') as Imp from plank_dogane_reportannuale_dettaglioquadri Q where  quadro = \'M\' and tokenreport = \'.$tokenreport.\' and particellaazienda = \'.$particellaazienda.\'  and utility = \'GAS\' and Rigo between 7 and 9 GROUP by Q.provincia, Q.Rigo ORDER BY Prov, FascClim, TipoR;\",\n    \"GroupBy\": \"Prov\"\n}', '{\"Prov\":\"\",\"Liquid\":[],\"Totali\":[]}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2435', '73', 'M', '2024', 'Liquid', 'M', '1000000000', '{\n    \"GroupBy\": \"Prov,FascClim,Progr,Aliq\",\n    \"FilterBy\": [\n        {\n            \"Progr\": \"1\"\n        },\n        {\n            \"Progr\": \"2\"\n        },\n        {\n            \"Progr\": \"3\"\n        },\n        {\n            \"Progr\": \"4\"\n        },\n        {\n            \"Progr\": \"5\"\n        },\n        {\n            \"Progr\": \"6\"\n        }\n    ]\n}', '{\"FascClim\":\"\",\"Progr\":\"\",\"Dettaglio\":[],\"Totale\":\"\"}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2436', '74', 'M', '2024', 'Dettaglio', 'Liquid', '1000000000', '{\"GroupBy\":\"Prov,FascClim,Progr,Aliq\"}', '{\"Qta\":\"\",\"Aliq\":\"\"}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2437', '75', 'M', '2024', 'Totale', 'Liquid', '1', '\"\"', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2438', '76', 'N', '2024', 'N', 'GasNaturale', '1000000000', '{\"Query\":\" select Q.provincia as Prov, Q.Rigo as Progr, REPLACE(FORMAT(sum(Q.corrispettivoaccise), 2),\',\',\'\') as Imp from plank_dogane_reportannuale_dettaglioquadri Q where  quadro = \'N\' and tokenreport = \'.$tokenreport.\' and particellaazienda = \'.$particellaazienda.\'  and utility = \'GAS\' GROUP by Q.provincia, Q.Rigo ORDER BY Prov,Progr;\",\"GroupBy\":\"Prov\"}', '{\"Prov\":\"\",\"RiepSaldo\":[]}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2439', '77', 'N', '2024', 'RiepSaldo', 'N', '7', '{\"GroupBy\":\"Prov,Progr\"}', '{\"Progr\":\"\",\"Imp\":\"\"}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2440', '78', 'O', '2024', 'O', 'GasNaturale', '1000000000', '{\"GroupBy\":\"Prov\"}', '{\"Prov\":\"\",\"Liquid\":[]}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2441', '79', 'O', '2024', 'Liquid', 'O', '7', '{\"GroupBy\":\"Prov,Progr\"}', '{\"Progr\":\"\",\"TipoR\":\"\",\"Dettaglio\":[],\"Totale\":\"\"}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2442', '80', 'O', '2024', 'Dettaglio', 'Liquid', '100000000', '{\"GroupBy\":\"Prov,Progr,Aliq\"}', '{\"Qta\":\"\",\"Aliq\":\"\"}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2443', '81', 'O', '2024', 'Totale', 'Liquid', '1', '\"\"', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2444', '82', 'P', '2024', 'P', 'GasNaturale', '100000000', '{\"GroupBy\":\"Prov\"}', '{\"Prov\":\"\",\"RiepSaldo\":[]}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2445', '83', 'P', '2024', 'RiepSaldo', 'P', '7', '{\"GroupBy\":\"Prov,Progr\"}', '{\"Progr\":\"\",\"Imp\":\"\"}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2446', '84', 'EC', '2024', 'EC', 'GasNaturale', '1000000000', '{\"Query\":\"select Q.provincia as Prov, Q.codicefiscale as Id, Q.Quadro as TipoUsoQ, Q.Rigo as TipoUsoR,  CASE WHEN percesclusioneaccise <> 0 THEN 2 WHEN tipologia_fornitura_utf = \'C\' THEN 3 ELSE 1 END AS ModApp,     CASE WHEN percesclusioneaccise <> 0 THEN percesclusioneaccise END  AS Perc,     pdp as PDR, REPLACE(FORMAT(SUM(consumoaccise),0),\',\',\'\') as Qta, indirizzo as Ind, REPLACE(FORMAT(SUM(consumoaccise * corrispettivoaccise),2),\',\',\'\') AS Accisa, CodCat, decorrenza as DataI, scadenza as DataF  from plank_dogane_reportannuale_dettaglioquadri Q where  ((quadro = \'E\' and rigo between 1 and 14) or (quadro = \'G\' and (rigo in (1,2) or rigo between 11 and 15))) and particellaazienda = \'.$particellaazienda.\'  and tokenreport = \'.$tokenreport.\' and utility = \'GAS\' and tipologiacliente <> \'RESELLER\' GROUP BY Q.provincia, Q.Quadro, Q.Rigo, Q.pdp ORDER BY Prov,Id,TipoUsoR;\",\"GroupBy\":\"Prov\"}', '{\"Prov\":\"\",\"Cliente\":[]}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2447', '85', 'EC', '2024', 'Cliente', 'EC', '1000000000', '{\"Id\":\"\",\"TipoUsoQ\":\"\",\"TipoUsoR\":\"\",\"ModApp\":\"\",\"Perc\":\"\",\"PDR\":\"\",\"Qta\":\"\",\"Ind\":\"\",\"CodCat\":\"\",\"Accisa\":\"\",\"DataI\":\"\",\"DataF\":\"\"}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2448', '86', 'EF', '2024', 'EF', 'GasNaturale', '1000000000', '{\n    \"Query\": \"Select \'A\' as Proven, \'00000000000\' as Id, \'0\' as Qta\"\n}', '{\"Fornitore\":[]}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2449', '87', 'EF', '2024', 'Fornitore', 'EF', '1000000000', '{\"Proven\":\"\",\"Id\":\"\",\"Qta\":\"\"}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `configurazione`, `utility`) VALUES ('2450', '88', 'PROGRESSIVI', '2024', 'PROGRESSIVI', 'GasNaturale', '1', '{\"ProgrInvio\":\"\",\"TotProgr\":\"\"}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2451', '89', 'Dich', '2024', 'Dich', 'GasNaturale', '1', '{\"Query\":\"SELECT JSON_UNQUOTE(IFNULL(NULLIF(JSON_EXTRACT(CAST(a.codiceditta_adm AS JSON), \'$.GAS\'),\'\'),\'AAA00000A\')) as CodDitta, \'S\' as TipoSogg, \'01\' AS CodAtt, a.sedelegale_localita as ComUffAmm, a.sedelegale_prov As ProvUffAmm, a.sedelegale_indirizzo as IndUffAmm FROM comm.plank_dogane_reportannuale AS d INNER JOIN comm.plank_aziende a on a.particellaazienda = d.particellaazienda where d.particellaazienda=\'.$particellaazienda.\' and d.tokenreport=\'.$tokenreport.\' LIMIT 1\"}', '{\"CodDitta\": \"\",\"TipoSogg\": \"\", \"CodAtt\": \"\",\"ComUffAmm\": \"\",\"ProvUffAmm\": \"\",\"IndUffAmm\": \"\"}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2452', '73', 'M', '2024', 'Totali', 'M', '1000000000', '{\"GroupBy\":\"Prov,Progr\",\"FilterBy\":[{\"Progr\":\"7\"},{\"Progr\":\"8\"},{\"Progr\":\"9\"}]}', '{\"Progr\":\"\",\"TipoR\":\"\",\"Imp\":\"\"}', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2453', '52', 'D', '2024', 'Totale', 'D', '1', '{\"Query\":\"select sum(consumoaccise) as Totale from plank_dogane_reportannuale_dettaglioquadri where Quadro = \'D\' and particellaazienda = \'.$particellaazienda.\' and utility = \'GAS\' and tokenreport=\'.$tokenreport.\';\"}', '\"\"', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2454', '102', 'D', '2024', 'Totale', 'D', '1', '{\"Query\":\"select REPLACE(FORMAT(sum(consumoaccise),0), \',\',\'\') as Totale from plank_dogane_reportannuale_dettaglioquadri where  quadro = \'D\' and tokenreport = \'.$tokenreport.\' and particellaazienda = \'.$particellaazienda.\' and utility = \'GAS\';\"}', '\"\"', 'GAS');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2455', '10', 'Anno', '2024', 'Anno', 'EnergiaElettrica', '1', '{\"Query\":\"SELECT annodich as Anno FROM comm.plank_dogane_reportannuale d where  d.particellaazienda=\'.$particellaazienda.\' and d.tokenreport=\'.$tokenreport.\' LIMIT 1\"}', '\"\"', 'EE');
REPLACE INTO `comm`.`plank_dogane_configurazionequadri` (`id`, `ord`, `quadro`, `annodich`, `tagname`, `parenttagname`, `occorrenze`, `estrazione`, `configurazione`, `utility`) VALUES ('2456', '103', 'Anno', '2024', 'Anno', 'GasNaturale', '1', '{\"Query\":\"SELECT annodich as Anno FROM comm.plank_dogane_reportannuale d where  d.particellaazienda=\'.$particellaazienda.\' and d.tokenreport=\'.$tokenreport.\' LIMIT 1\"}', '\"\"', 'GAS');

CREATE DEFINER=`plank`@`%` PROCEDURE `plank_dogane_reportannuale_dettaglio_ee`(IN var_azienda varchar(45), IN var_anno INT, var_token varchar(45))
BEGIN
    
DROP TEMPORARY TABLE IF EXISTS tmp_dettagli;
CREATE TEMPORARY TABLE tmp_dettagli
SELECT F.tipologiacliente, D.*
FROM comm.plank_fatture_dettaglio D
INNER JOIN comm.plank_fatture F on D.particellaazienda = D.particellaazienda and D.codicefattura = F.codicefattura
WHERE D.particellaazienda=var_azienda AND D.utility="EE" AND year(D.dataemissione)=var_anno 
	AND (D.cod like "erariale\_%" or (D.cod like "energia%" AND D.voce not like 'Perdite%')) 
	AND D.importo <> 0;

   
DROP TEMPORARY TABLE IF EXISTS tmp_primafattura;
CREATE TEMPORARY TABLE tmp_primafattura
SELECT idcontratto, periodoriferimento, CONCAT(particellaazienda,"_",minfattura,"_",annoemissione,"_",seriale) AS codicefattura
FROM
(
SELECT D.idcontratto, D.periodoriferimento, D.particellaazienda, D.minfattura, annoemissione, seriale, row_number() OVER (partition by  D.idcontratto, D.periodoriferimento order by annoemissione) rn
FROM
(
	SELECT D.idcontratto, D.periodoriferimento,D.particellaazienda, MIN(D.numerofattura) as minfattura,  YEAR(dataemissione) as annoemissione, D.seriale
	from comm.plank_fatture_dettaglio D 
	where D.particellaazienda = var_azienda 
	AND (D.cod like "erariale\_%" or (D.cod like "energia%" AND D.voce not like 'Perdite%'))
    AND YEAR(dataemissione) <= var_anno
	GROUP BY D.idcontratto, D.periodoriferimento,  YEAR(dataemissione), D.seriale
	) D
) A WHERE rn = 1; 

DROP TEMPORARY TABLE IF EXISTS tmp_storico_fornitura;
CREATE TEMPORARY TABLE tmp_storico_fornitura
SELECT *
FROM
(
	SELECT f.codicefattura, f.dataemissione, f.idcontratto, e.destinazioneuso_accise, e.potenzaimpegnata, IF(e.residente<>"1", 0, 1) AS residente, e.codicetensione, e.percesclusioneaccise,
    e.coddogane, e.impiantofotovoltaicopresente, e.zonaipex, NULLIF(e.distributore, "") as distributore, row_number() over (partition by f.codicefattura, f.dataemissione, f.idcontratto order by e.datastoricizzazione desc) as rn
	
    from 
	(
		SELECT codicefattura, dataemissione, idcontratto 
		FROM tmp_dettagli D
		group by codicefattura, dataemissione, idcontratto 
	) f
	left join  plank_forniture_ee_storico e on f.idcontratto = e.idcontratto and e.datastoricizzazione >= f.dataemissione
) e where rn = 1;



DROP TEMPORARY TABLE IF EXISTS tmp_storico_contratto;
CREATE TEMPORARY TABLE tmp_storico_contratto
SELECT *
FROM
(
	SELECT f.codicefattura, f.dataemissione, f.idcontratto,  
    NULLIF(e.codfiscale, "") AS codfiscale, NULLIF(e.piva, "") as piva,
    Coalesce(NULLIF(e.fornitura_codfiscale, ""), NULLIF(e.codfiscale, "")) AS fornitura_codfiscale, 
    Coalesce(NULLIF(e.fornitura_piva, ""), NULLIF(e.piva, ""))  AS fornitura_piva, 
    e.densociale, e.tipologiacliente, e.fornitura_indirizzo, e.fornitura_localita_id, e.fornitura_prov, e.fornitura_paese, e.decorrenza, e.scadenza, e.datadistipula,
    row_number() over (partition by f.codicefattura, f.dataemissione, f.idcontratto order by e.datastoricizzazione desc) as rn
	from 
	(
		SELECT codicefattura, dataemissione, idcontratto 
		FROM tmp_dettagli D
		group by codicefattura, dataemissione, idcontratto 
	) f
	left join  plank_contratti_storico e on f.idcontratto = e.idcontratto and e.datastoricizzazione >= f.dataemissione
) e where rn = 1;


DROP TEMPORARY TABLE IF EXISTS tmp_storico_campi;
CREATE TEMPORARY TABLE tmp_storico_campi
SELECT *
FROM
(
	SELECT D.idcontratto, D.periodoriferimento,  D.codicefattura, SUM(CASE WHEN S.nomecampo = 'potenzaimpegnata' THEN S.valoredouble ELSE NULL END) AS potenzaimpegnata, 
	SUM(CASE WHEN S.nomecampo = 'residente' THEN S.valoredouble ELSE NULL END) as residente, GROUP_CONCAT(CASE WHEN S.nomecampo = 'codicetensione' THEN S.valoretesto ELSE NULL END SEPARATOR ',') AS codicetensione
	FROM
	(
		SELECT distinct D.idcontratto, D.codicefattura, D.periodoriferimento, coalesce(SC.decorrenza, C.decorrenza) as decorrenza,
        coalesce(SC.scadenza, C.scadenza) as scadenza
		FROM tmp_dettagli D
        LEFT JOIN tmp_storico_contratto SC ON D.idcontratto = SC.idcontratto and SC.codicefattura = D.codicefattura
        LEFT JOIN plank_contratti C on D.idcontratto = C.idcontratto
	) D
	INNER JOIN plank_forniture_ee E on D.idcontratto = E.idcontratto
	INNER JOIN plank_storicocampi S on E.id = S.pkriga and LEAST(D.decorrenza, CONCAT(D.periodoriferimento,'01')) between S.da and S.a
	GROUP BY D.idcontratto, D.periodoriferimento
) s
where potenzaimpegnata IS NOT NULL and residente IS NOT NULL and codicetensione IS NOT NULL;
 
DROP TEMPORARY TABLE IF EXISTS tmp_fatturato;
CREATE TEMPORARY TABLE tmp_fatturato
SELECT D.codicefattura, D.dataemissione, D.idcontratto, D.periodoriferimento, D.pdp, sum(quantita) AS consumo
FROM tmp_dettagli D
WHERE D.cod like "energia%" AND D.voce not like 'Perdite%'
GROUP BY D.codicefattura, D.dataemissione, D.idcontratto, D.periodoriferimento;

 DROP TEMPORARY TABLE IF EXISTS tmp_erariale;
CREATE TEMPORARY TABLE tmp_erariale
SELECT D.codicefattura, D.dataemissione, D.idcontratto, D.periodoriferimento, D.pdp, 
sum(quantita) as consumoaccise, corrispettivounitario as corrispettivoaccisa
FROM tmp_dettagli D
WHERE D.cod like "erariale%"
GROUP BY D.codicefattura, D.dataemissione, D.idcontratto, D.periodoriferimento, corrispettivounitario;

DROP TEMPORARY TABLE IF EXISTS tmp_gc;
CREATE TEMPORARY TABLE tmp_gc
SELECT *
FROM
(
select provincia, id_citta, cod_fisco, country_code, ambitogas, zonaclimaticagas,macrozonagas, zonaipex,
row_number() over(partition by id_citta order by inactive) rn
    from comm.plank_geo_cities 
    where country = 'Italy'
) gc 
WHERE rn = 1;

DROP TEMPORARY TABLE IF EXISTS tmp_consumi;
CREATE TEMPORARY TABLE tmp_consumi
SELECT D.codicefattura, D.dataemissione, D.idcontratto, D.periodoriferimento, D.pdp, D.consumo, D.consumoaccise,
D.consumo - (D.esenti + IF((D.periodoriferimento < '202301' OR (Coalesce(sc.codicetensione, s.codicetensione, E.codicetensione) like 'TD%' 
	AND Coalesce(sc.residente, s.residente, E.residente, 0) =1 AND D.periodoriferimento >= '202301')) AND Coalesce(sc.potenzaimpegnata, s.potenzaimpegnata, E.potenzaimpegnata) > 1.5 AND 
	Coalesce(sc.potenzaimpegnata, s.potenzaimpegnata, E.potenzaimpegnata)<=3  AND D.esenti < 150 and D.consumo >220 , LEAST(150, D.consumo-220),0 )) AS consumotassato, 
D.esenti, Coalesce(D.rettifica, 0) as rettifica,
IF((D.periodoriferimento < '202301' OR (Coalesce(sc.codicetensione, s.codicetensione, E.codicetensione) like 'TD%' 
	AND Coalesce(sc.residente, s.residente, E.residente, 0) =1 AND D.periodoriferimento >= '202301')) AND Coalesce(sc.potenzaimpegnata, s.potenzaimpegnata, E.potenzaimpegnata)>1.5 AND Coalesce(sc.potenzaimpegnata, s.potenzaimpegnata, E.potenzaimpegnata)<=3 AND D.esenti < 150 and D.consumo >220, LEAST(150, D.consumo-220),0 ) as recuperataResidente,
Coalesce(c.tipologiacliente, E.tipologiacliente) as tipologiacliente, coalesce(s.destinazioneuso_accise, E.destinazioneuso_accise) as destinazioneuso_accise, Coalesce(sc.residente, s.residente, E.residente, 0) AS residente,
coalesce(s.percesclusioneaccise, E.percesclusioneaccise) as percesclusioneaccise,
coalesce(sc.potenzaimpegnata, s.potenzaimpegnata, E.potenzaimpegnata) as potenzaimpegnata, Coalesce(sc.codicetensione, s.codicetensione, E.codicetensione) as codicetensione,
Coalesce(NULLIF(Coalesce(c.codfiscale, NULLIF(E.codfiscale, "")), ""), Coalesce(c.piva, NULLIF(E.piva,""))) as fattura_codfiscale, 
Coalesce(NULLIF(Coalesce(c.fornitura_codfiscale, NULLIF(E.fornitura_codfiscale, ""), NULLIF(E.codfiscale,"")), ""), Coalesce(c.fornitura_piva, NULLIF(E.fornitura_piva,""), NULLIF(E.piva,""))) as fornitura_codfiscale, 
Coalesce(gc.cod_fisco, "") as codcat, REPLACE(Coalesce(c.fornitura_indirizzo, E.fornitura_indirizzo), TRIM(REGEXP_REPLACE(Coalesce(c.fornitura_indirizzo, E.fornitura_indirizzo), "[A-Za-z0-9àèéìòù .,\\-()'\/]{1,50}",""))," ") as fornitura_indirizzo,
Coalesce(c.fornitura_localita_id, E.fornitura_localita_id) as fornitura_localita_id, Coalesce(gc.provincia, c.fornitura_prov, E.fornitura_prov) as fornitura_prov, 
Coalesce(gc.country_code, c.fornitura_paese, E.fornitura_paese) as fornitura_paese, Coalesce(c.decorrenza, E.decorrenza) as decorrenza, Coalesce(c.scadenza, E.scadenza) as scadenza,
Coalesce(c.datadistipula, E.datadistipula) as datadistipula,
Coalesce(s.coddogane,E.coddogane) as coddogane, Coalesce(s.impiantofotovoltaicopresente,E.impiantofotovoltaicopresente, 0) as impiantofotovoltaicopresente, 
Coalesce(gc.zonaipex, s.zonaipex, E.zonaipex) as zonaipex, corrispettivoaccisa, D.scaglione,
-- Ambito: identificato dalle seguenti sigle province: Sigla Provincia della sede della Ditta, IT, AO, BZ, TN, TS, PA, CA escludendo il capoluogo dell’ambito dove ha sede la ditta, 
-- considerando la provincia fittizia IT il capoluogo di provincia dell'ambito ORDINARIO
CASE WHEN D.sedelegale_prov = Coalesce(gc.provincia, c.fornitura_prov, E.fornitura_prov) OR ambitoditta = 
	CASE WHEN Coalesce(gc.provincia, c.fornitura_prov, E.fornitura_prov) IN ("BZ", "TN") THEN Coalesce(gc.provincia, c.fornitura_prov, E.fornitura_prov)
	WHEN pr.id_regione = 19 THEN "AO" 
    WHEN pr.id_regione = 14 THEN "CA"
	WHEN pr.id_regione = 15 THEN "PA"
    WHEN pr.id_regione = 6 THEN "TS"
    ELSE "IT" END THEN ambitoditta ELSE
    CASE WHEN Coalesce(gc.provincia, c.fornitura_prov, E.fornitura_prov) IN ("BZ", "TN") THEN Coalesce(gc.provincia, c.fornitura_prov, E.fornitura_prov)
	WHEN pr.id_regione = 19 THEN "AO" 
    WHEN pr.id_regione = 14 THEN "CA"
	WHEN pr.id_regione = 15 THEN "PA"
    WHEN pr.id_regione = 6 THEN "TS"
    ELSE "IT" END END AS ambito, ad.pivadistr
FROM
(
	select D.*, Coalesce(F.consumo, 0) as consumo, Coalesce(E.consumoaccise, 0) as consumoaccise,
	Coalesce(F.consumo, 0) - Coalesce(E.consumoaccise, 0) as esenti, Coalesce(E.corrispettivoaccisa, 0) as corrispettivoaccisa,
    IF (Coalesce(E.consumoaccise, 0)<200000, 1, 2) AS scaglione
	from (
		SELECT  DISTINCT D.codicefattura, D.idcontratto, D.periodoriferimento, D.dataemissione, D.pdp,
        IF(D.codicefattura <> PF.codicefattura, 1, 0) AS rettifica, A.sedelegale_prov, pr.capoluogo,
        CASE WHEN pr.capoluogo = 1 THEN 
			CASE WHEN A.sedelegale_prov IN ("BZ", "TN") THEN A.sedelegale_prov
			WHEN pr.id_regione = 19 THEN "AO" 
			WHEN pr.id_regione = 14 THEN "CA"
			WHEN pr.id_regione = 15 THEN "PA"
			WHEN pr.id_regione = 6 THEN "TS"
			ELSE "IT" END ELSE A.sedelegale_prov END AS ambitoditta
		FROM tmp_dettagli D
        LEFT JOIN tmp_primafattura PF on D.idcontratto = PF.idcontratto and D.periodoriferimento = PF.periodoriferimento
        LEFT JOIN comm.plank_aziende A on D.particellaazienda = A.particellaazienda
        LEFT JOIN comm.plank_geo_provincies pr on A.sedelegale_prov = pr.sigla
	) D 
	LEFT JOIN tmp_fatturato F ON D.codicefattura = F.codicefattura and D.idcontratto = F.idcontratto and D.periodoriferimento = F.periodoriferimento
	LEFT JOIN tmp_erariale E ON D.codicefattura = E.codicefattura and D.idcontratto = E.idcontratto and D.periodoriferimento = E.periodoriferimento
) D
LEFT JOIN tmp_storico_campi sc on D.idcontratto = sc.idcontratto and D.periodoriferimento = sc.periodoriferimento and D.codicefattura = sc.codicefattura
LEFT JOIN tmp_storico_fornitura s on D.idcontratto = s.idcontratto and D.codicefattura = s.codicefattura
LEFT JOIN tmp_storico_contratto c on D.idcontratto = c.idcontratto and D.codicefattura = c.codicefattura
LEFT JOIN comm.plank_contratti_forniture_ee E ON D.idcontratto = E.idcontratto
LEFT JOIN (select distinct coddistr, pivadistr from comm.plank_anadistributori where utility = 'EE') ad on COALESCE(s.distributore,E.distributore) = ad.coddistr
LEFT JOIN tmp_gc gc on Coalesce(c.fornitura_localita_id, E.fornitura_localita_id) = gc.id_citta
LEFT JOIN comm.plank_geo_provincies pr on Coalesce(gc.provincia, c.fornitura_prov, E.fornitura_prov) = pr.sigla;


DROP TEMPORARY TABLE IF EXISTS tmp_dettaglioaccise;
CREATE TEMPORARY TABLE tmp_dettaglioaccise(idcontratto int, periodoriferimento varchar(45), utility varchar(10), accise varchar(45), tipologiacliente varchar(45),
pdp varchar(45), codicefiscale varchar(45), indirizzo varchar(500), codcat varchar(10), provincia varchar(45), paese varchar(45), ambito varchar(45), 
potenzaimpegnata double, percesclusioneaccise double, codicetensione varchar(45), residente int, rettifica int, corrispettivoaccise double, consumo double, consumoaccise double,
accisa varchar(45), tipologia_fornitura_utf varchar(45), decorrenza date, scadenza date, datadistipula date, zonaipex varchar(45), codicefattura varchar(45), dataemissione date, Quadro char(1), Rigo int);

-- QUADRO I
INSERT INTO tmp_dettaglioaccise
select cn.idcontratto, cn.periodoriferimento, 'EE' as utility, IF(cn.destinazioneuso_accise = "", "APPLICATA", cn.destinazioneuso_accise ) as accise, cn.tipologiacliente,
cn.pdp, CASE WHEN cn.tipologiacliente = 'RESELLER' THEN cn.fattura_codfiscale ELSE cn.pivadistr END, cn.fornitura_indirizzo, cn.codcat, cn.fornitura_prov, cn.fornitura_paese, cn.ambito, cn.potenzaimpegnata, cn.percesclusioneaccise,
cn.codicetensione, cn.residente, cn.rettifica, 0 as corrispettivoaccise, cn.consumo, cn.consumo as consumoaccise, NULL as accisa, 
CASE WHEN cn.tipologiacliente = 'RESELLER' THEN 'P' 
	WHEN coalesce(cn.percesclusioneaccise, 0) <> 0 THEN 'Q' ELSE 'M' END as tipologia_fornitura_utf,
cn.decorrenza, cn.scadenza, cn.datadistipula, cn.zonaipex, cn.codicefattura, cn.dataemissione, 'I' as Quadro, 1 as Rigo
from tmp_consumi cn;

-- QUADRO J
INSERT INTO tmp_dettaglioaccise
select cn.idcontratto, cn.periodoriferimento, 'EE' as utility, IF(cn.destinazioneuso_accise = "", "APPLICATA", cn.destinazioneuso_accise ) as accise, cn.tipologiacliente,
cn.pdp, IF(cn.tipologiacliente = 'RESELLER', cn.fattura_codfiscale, cn.fornitura_codfiscale), cn.fornitura_indirizzo, cn.codcat, cn.fornitura_prov, cn.fornitura_paese, cn.ambito, cn.potenzaimpegnata, cn.percesclusioneaccise,
cn.codicetensione, cn.residente, cn.rettifica, coalesce(cn.corrispettivoaccisa, 0) as corrispettivoaccisa, cn.consumo, cn.esenti as consumoaccise, 'ESCLUSI' as accisa, 
CASE WHEN cn.tipologiacliente = 'RESELLER' THEN 'P' 
	WHEN coalesce(cn.percesclusioneaccise, 0) <> 0 THEN 'Q' ELSE 'M' END as tipologia_fornitura_utf,
cn.decorrenza, cn.scadenza, cn.datadistipula, cn.zonaipex, cn.codicefattura, cn.dataemissione,
'J' as Quadro, CASE WHEN cn.tipologiacliente = 'RESELLER' THEN CASE WHEN cn.fornitura_paese IN ("IT", "Italy") THEN 4 ELSE 5 END ELSE 1 END as Rigo
from tmp_consumi cn
where (coalesce(cn.percesclusioneaccise, 0) <> 0  or  IF(cn.destinazioneuso_accise = "", "APPLICATA", cn.destinazioneuso_accise ) <> 'APPLICATA')
AND NOT(cn.tipologiacliente = 'RESELLER' and cn.fornitura_paese IN ("IT", "Italy"));

-- QUADRO L
INSERT INTO tmp_dettaglioaccise
select cn.idcontratto, cn.periodoriferimento, 'EE' as utility, IF(cn.destinazioneuso_accise = "", "APPLICATA", cn.destinazioneuso_accise ) as accise, cn.tipologiacliente,
cn.pdp, IF(cn.tipologiacliente = 'RESELLER', cn.fattura_codfiscale, cn.fornitura_codfiscale), cn.fornitura_indirizzo, cn.codcat, cn.fornitura_prov, cn.fornitura_paese, cn.ambito, cn.potenzaimpegnata, cn.percesclusioneaccise,
cn.codicetensione, cn.residente, cn.rettifica, 0 as corrispettivoaccisa, cn.consumo, cn.esenti as consumoaccise, 'ESENTI' as accisa, 
CASE WHEN cn.tipologiacliente = 'RESELLER' THEN 'P' 
	WHEN coalesce(cn.percesclusioneaccise, 0) <> 0 THEN 'Q' ELSE 'M' END as tipologia_fornitura_utf,
cn.decorrenza, cn.scadenza, cn.datadistipula, cn.zonaipex, cn.codicefattura, cn.dataemissione,
'L' as Quadro, CASE 
 -- WHEN cn.tipologiacliente IN ('ENTE', 'PUBBLICA AMMINISTRAZIONE') THEN 2 
	WHEN cn.tipologiacliente = 'FORZE ARMATE' THEN 3 
    WHEN cn.tipologiacliente <> 'DOMESTICO' and  cn.impiantofotovoltaicopresente = 1 THEN 6 ELSE 9 END as Rigo
from tmp_consumi cn
where  cn.esenti <> 0 and NOT(coalesce(cn.percesclusioneaccise, 0) <> 0  or  IF(cn.destinazioneuso_accise = "", "APPLICATA", cn.destinazioneuso_accise ) <> 'APPLICATA');

INSERT INTO tmp_dettaglioaccise
-- QUADRO M - abitazioni 
select cn.idcontratto, cn.periodoriferimento, 'EE' as utility, IF(cn.destinazioneuso_accise = "", "APPLICATA", cn.destinazioneuso_accise ) as accise, cn.tipologiacliente,
cn.pdp, IF(cn.tipologiacliente = 'RESELLER', cn.fattura_codfiscale, cn.fornitura_codfiscale), cn.fornitura_indirizzo, cn.codcat, cn.fornitura_prov, cn.fornitura_paese, cn.ambito, cn.potenzaimpegnata, cn.percesclusioneaccise,
cn.codicetensione, cn.residente, cn.rettifica, coalesce(cn.corrispettivoaccisa, 0) as corrispettivoaccisa, cn.consumo, cn.consumotassato as consumoaccise, 'TASSATI' as accisa, 
CASE WHEN cn.tipologiacliente = 'RESELLER' THEN 'P' 
	WHEN coalesce(cn.percesclusioneaccise, 0) <> 0 THEN 'Q' ELSE 'M' END as tipologia_fornitura_utf,
cn.decorrenza, cn.scadenza, cn.datadistipula, cn.zonaipex, cn.codicefattura, cn.dataemissione,
'M' as Quadro, CASE WHEN residente = 1 THEN 1 ELSE 2 END as Rigo
from tmp_consumi cn
WHERE ((cn.codicetensione like 'TD%' and consumotassato <> 0) OR coalesce(cn.recuperataResidente, 0) <> 0) and rettifica = 0 
and IF(cn.destinazioneuso_accise = "", "APPLICATA", cn.destinazioneuso_accise ) <> 'NON APPLICATA';

-- QUADRO M - recupero 
INSERT INTO tmp_dettaglioaccise
select cn.idcontratto, cn.periodoriferimento, 'EE' as utility, IF(cn.destinazioneuso_accise = "", "APPLICATA", cn.destinazioneuso_accise ) as accise, cn.tipologiacliente,
cn.pdp, IF(cn.tipologiacliente = 'RESELLER', cn.fattura_codfiscale, cn.fornitura_codfiscale), cn.fornitura_indirizzo, cn.codcat, cn.fornitura_prov, cn.fornitura_paese, cn.ambito, cn.potenzaimpegnata, cn.percesclusioneaccise,
cn.codicetensione, cn.residente, cn.rettifica, coalesce(cn.corrispettivoaccisa, 0) as corrispettivoaccisa, cn.consumo, cn.recuperataResidente as consumoaccise, 'RECUPERATI A TASSAZIONE' as accisa, 
CASE WHEN cn.tipologiacliente = 'RESELLER' THEN 'P' 
	WHEN coalesce(cn.percesclusioneaccise, 0) <> 0 THEN 'Q' ELSE 'M' END as tipologia_fornitura_utf,
cn.decorrenza, cn.scadenza, cn.datadistipula, cn.zonaipex, cn.codicefattura, cn.dataemissione,
'M' as Quadro, 3 as Rigo
from tmp_consumi cn
WHERE coalesce(cn.recuperataResidente, 0) <> 0 and rettifica = 0
and IF(cn.destinazioneuso_accise = "", "APPLICATA", cn.destinazioneuso_accise ) <> 'NON APPLICATA';

-- QUADRO M - locali 
INSERT INTO tmp_dettaglioaccise
select cn.idcontratto, cn.periodoriferimento, 'EE' as utility, IF(cn.destinazioneuso_accise = "", "APPLICATA", cn.destinazioneuso_accise ) as accise, cn.tipologiacliente,
cn.pdp, IF(cn.tipologiacliente = 'RESELLER', cn.fattura_codfiscale, cn.fornitura_codfiscale), cn.fornitura_indirizzo, cn.codcat, cn.fornitura_prov, cn.fornitura_paese, cn.ambito, cn.potenzaimpegnata, cn.percesclusioneaccise,
cn.codicetensione, cn.residente, cn.rettifica, coalesce(cn.corrispettivoaccisa, 0) as corrispettivoaccisa, cn.consumo, cn.consumotassato as consumoaccise, 'TASSATI' as accisa, 
CASE WHEN cn.tipologiacliente = 'RESELLER' THEN 'P' 
	WHEN coalesce(cn.percesclusioneaccise, 0) <> 0 THEN 'Q' ELSE 'M' END as tipologia_fornitura_utf,
cn.decorrenza, cn.scadenza, cn.datadistipula, cn.zonaipex, cn.codicefattura, cn.dataemissione,
'M' as Quadro, CASE WHEN cn.consumo < 1200000 THEN IF(cn.scaglione = 1, 9, 10) ELSE IF(cn.scaglione = 1, 11, 12) END as Rigo
from tmp_consumi cn
WHERE codicetensione not like 'TD%' and coalesce(cn.recuperataResidente, 0) = 0 and rettifica = 0
and IF(cn.destinazioneuso_accise = "", "APPLICATA", cn.destinazioneuso_accise ) <> 'NON APPLICATA';

INSERT INTO tmp_dettaglioaccise
-- QUADRO K - abitazioni 
select cn.idcontratto, cn.periodoriferimento, 'EE' as utility, IF(cn.destinazioneuso_accise = "", "APPLICATA", cn.destinazioneuso_accise ) as accise, cn.tipologiacliente,
cn.pdp, IF(cn.tipologiacliente = 'RESELLER', cn.fattura_codfiscale, cn.fornitura_codfiscale), cn.fornitura_indirizzo, cn.codcat, cn.fornitura_prov, cn.fornitura_paese, cn.ambito, cn.potenzaimpegnata, cn.percesclusioneaccise,
cn.codicetensione, cn.residente, cn.rettifica, coalesce(cn.corrispettivoaccisa, 0) as corrispettivoaccisa, cn.consumo, cn.consumotassato as consumoaccise, 'TASSATI' as accisa, 
CASE WHEN cn.tipologiacliente = 'RESELLER' THEN 'P' 
	WHEN coalesce(cn.percesclusioneaccise, 0) <> 0 THEN 'Q' ELSE 'M' END as tipologia_fornitura_utf,
cn.decorrenza, cn.scadenza, cn.datadistipula, cn.zonaipex, cn.codicefattura, cn.dataemissione,
'K' as Quadro, CASE WHEN residente = 1 THEN 1 ELSE 2 END as Rigo
from tmp_consumi cn
WHERE ((cn.codicetensione like 'TD%' and consumotassato <> 0)  OR coalesce(cn.recuperataResidente, 0) <> 0) and rettifica=1
and IF(cn.destinazioneuso_accise = "", "APPLICATA", cn.destinazioneuso_accise ) <> 'NON APPLICATA';

-- QUADRO K - recupero 
INSERT INTO tmp_dettaglioaccise
select cn.idcontratto, cn.periodoriferimento, 'EE' as utility, IF(cn.destinazioneuso_accise = "", "APPLICATA", cn.destinazioneuso_accise ) as accise, cn.tipologiacliente,
cn.pdp, IF(cn.tipologiacliente = 'RESELLER', cn.fattura_codfiscale, cn.fornitura_codfiscale), cn.fornitura_indirizzo, cn.codcat, cn.fornitura_prov, cn.fornitura_paese, cn.ambito, cn.potenzaimpegnata, cn.percesclusioneaccise,
cn.codicetensione, cn.residente, cn.rettifica, coalesce(cn.corrispettivoaccisa, 0) as corrispettivoaccisa, cn.consumo, cn.recuperataResidente as consumoaccise, 'RECUPERATI A TASSAZIONE' as accisa, 
CASE WHEN cn.tipologiacliente = 'RESELLER' THEN 'P' 
	WHEN coalesce(cn.percesclusioneaccise, 0) <> 0 THEN 'Q' ELSE 'M' END as tipologia_fornitura_utf,
cn.decorrenza, cn.scadenza, cn.datadistipula, cn.zonaipex, cn.codicefattura, cn.dataemissione,
'K' as Quadro, 3 as Rigo
from tmp_consumi cn
WHERE coalesce(cn.recuperataResidente, 0) <> 0  and rettifica = 1
and IF(cn.destinazioneuso_accise = "", "APPLICATA", cn.destinazioneuso_accise ) <> 'NON APPLICATA';


-- QUADRO K - locali 
INSERT INTO tmp_dettaglioaccise
select cn.idcontratto, cn.periodoriferimento, 'EE' as utility, IF(cn.destinazioneuso_accise = "", "APPLICATA", cn.destinazioneuso_accise ) as accise, cn.tipologiacliente,
cn.pdp, IF(cn.tipologiacliente = 'RESELLER', cn.fattura_codfiscale, cn.fornitura_codfiscale), cn.fornitura_indirizzo, cn.codcat, cn.fornitura_prov, cn.fornitura_paese, cn.ambito, cn.potenzaimpegnata, cn.percesclusioneaccise,
cn.codicetensione, cn.residente, cn.rettifica, coalesce(cn.corrispettivoaccisa, 0) as corrispettivoaccisa, cn.consumo, cn.consumotassato as consumoaccise, 'TASSATI' as accisa, 
CASE WHEN cn.tipologiacliente = 'RESELLER' THEN 'P' 
	WHEN coalesce(cn.percesclusioneaccise, 0) <> 0 THEN 'Q' ELSE 'M' END as tipologia_fornitura_utf,
cn.decorrenza, cn.scadenza, cn.datadistipula, cn.zonaipex, cn.codicefattura, cn.dataemissione,
'K' as Quadro, 4 as Rigo
from tmp_consumi cn
WHERE codicetensione not like 'TD%' and coalesce(cn.recuperataResidente, 0) = 0 and rettifica = 1
and IF(cn.destinazioneuso_accise = "", "APPLICATA", cn.destinazioneuso_accise ) <> 'NON APPLICATA';

DROP TEMPORARY TABLE IF EXISTS tmp_righi;
CREATE TEMPORARY TABLE tmp_righi
SELECT * FROM tmp_dettaglioaccise;

INSERT INTO tmp_dettaglioaccise
Select cn.idcontratto, cn.periodoriferimento, 'EE' as utility, accise, cn.tipologiacliente,
cn.pdp, cn.codicefiscale, cn.indirizzo, cn.codcat, cn.provincia, cn.paese, cn.ambito, cn.potenzaimpegnata, cn.percesclusioneaccise,
cn.codicetensione, cn.residente, cn.rettifica, corrispettivoaccise, cn.consumo, consumoaccise, 'TASSATI' as accisa, tipologia_fornitura_utf,
cn.decorrenza, cn.scadenza, cn.datadistipula, cn.zonaipex, cn.codicefattura, cn.dataemissione, 'P' as Quadro, 1 as Rigo
FROM tmp_righi cn
WHERE Quadro = 'M' and Rigo in (1, 3);

INSERT INTO tmp_dettaglioaccise
Select cn.idcontratto, cn.periodoriferimento, 'EE' as utility, accise, cn.tipologiacliente,
cn.pdp, cn.codicefiscale, cn.indirizzo, cn.codcat, cn.provincia, cn.paese, cn.ambito, cn.potenzaimpegnata, cn.percesclusioneaccise,
cn.codicetensione, cn.residente, cn.rettifica, corrispettivoaccise, cn.consumo, consumoaccise, 'TASSATI' as accisa, tipologia_fornitura_utf,
cn.decorrenza, cn.scadenza, cn.datadistipula, cn.zonaipex, cn.codicefattura, cn.dataemissione, 'P' as Quadro, 2 as Rigo
FROM tmp_righi cn
WHERE Quadro = 'M' and Rigo = 2;

INSERT INTO tmp_dettaglioaccise
Select cn.idcontratto, cn.periodoriferimento, 'EE' as utility, accise, cn.tipologiacliente,
cn.pdp, cn.codicefiscale, cn.indirizzo, cn.codcat, cn.provincia, cn.paese, cn.ambito, cn.potenzaimpegnata, cn.percesclusioneaccise,
cn.codicetensione, cn.residente, cn.rettifica, corrispettivoaccise, cn.consumo, consumoaccise, 'TASSATI' as accisa, tipologia_fornitura_utf,
cn.decorrenza, cn.scadenza, cn.datadistipula, cn.zonaipex, cn.codicefattura, cn.dataemissione, 'P' as Quadro, 4 as Rigo
FROM tmp_righi cn
WHERE Quadro = 'M' and Rigo IN (9,11);

INSERT INTO tmp_dettaglioaccise
Select cn.idcontratto, cn.periodoriferimento, 'EE' as utility, accise, cn.tipologiacliente,
cn.pdp, cn.codicefiscale, cn.indirizzo, cn.codcat, cn.provincia, cn.paese, cn.ambito, cn.potenzaimpegnata, cn.percesclusioneaccise,
cn.codicetensione, cn.residente, cn.rettifica, corrispettivoaccise, cn.consumo, consumoaccise, 'TASSATI' as accisa, tipologia_fornitura_utf,
cn.decorrenza, cn.scadenza, cn.datadistipula, cn.zonaipex, cn.codicefattura, cn.dataemissione, 'P' as Quadro, 5 as Rigo
FROM tmp_righi cn
WHERE Quadro = 'M' and Rigo = 10;

INSERT INTO tmp_dettaglioaccise
Select cn.idcontratto, cn.periodoriferimento, 'EE' as utility, accise, cn.tipologiacliente,
cn.pdp, cn.codicefiscale, cn.indirizzo, cn.codcat, cn.provincia, cn.paese, cn.ambito, cn.potenzaimpegnata, cn.percesclusioneaccise,
cn.codicetensione, cn.residente, cn.rettifica, corrispettivoaccise, cn.consumo, consumoaccise, 'TASSATI' as accisa, tipologia_fornitura_utf,
cn.decorrenza, cn.scadenza, cn.datadistipula, cn.zonaipex, cn.codicefattura, cn.dataemissione, 'P' as Quadro, 
CASE WHEN Rigo IN (1, 2, 3, 4) THEN 10 WHEN Rigo in (5, 6, 7, 8) THEN 11 ELSE null END as Rigo
FROM tmp_righi cn
WHERE Quadro = 'K' and Rigo between 1 and 8;

DROP TEMPORARY TABLE IF EXISTS tmp_righi;
CREATE TEMPORARY TABLE tmp_righi
SELECT * FROM tmp_dettaglioaccise WHERE Quadro = 'P';

-- ARROTONDAMENTI 
INSERT INTO tmp_dettaglioaccise
select
0 AS idcontratto, '' AS periodoriferimento, 'EE' as utility, '' AS accise, '' AS tipologiacliente,
'' AS pdp, '' AS codicefiscale, '' AS indirizzo, '' AS codcat, cn.provincia, '' AS paese, cn.ambito, 0 AS potenzaimpegnata, 0 as percesclusioneaccise,
'' AS codicetensione, 0 AS residente, 0 as rettifica, Round(Round(SUM(corrispettivoaccise * consumoaccise), 2) - ROUND(SUM(ROUND(corrispettivoaccise * consumoaccise, 2)),2), 2)  as corrispettivoaccisa, 
0 as consumo, 0 as consumoaccise, 'TASSATI' as accisa, '' as tipologia_fornitura_utf,
'19990101' as decorrenza, '19990101' as scadenza, '19990101' as datadistipula, '' as zonaipex, '' as codicefattura, '19990101' as dataemissione, 'P' as Quadro, 13 as Rigo
from tmp_righi cn
where cn.Quadro = 'P'
group by  provincia
having  abs(Round(SUM(corrispettivoaccise * consumoaccise), 2) - ROUND(SUM(ROUND(corrispettivoaccise * consumoaccise, 2)),2)) > 0;

INSERT INTO tmp_righi
SELECT * FROM tmp_dettaglioaccise WHERE Quadro = 'P' and Rigo = 13;

-- Rigo P14
INSERT INTO tmp_dettaglioaccise
select
0 AS idcontratto, '' AS periodoriferimento, 'EE' as utility, '' AS accise, '' AS tipologiacliente,
'' AS pdp, '' AS codicefiscale, '' AS indirizzo, '' AS codcat, cn.provincia, '' AS paese, cn.ambito, 0 AS potenzaimpegnata, 0 as percesclusioneaccise,
'' AS codicetensione, 0 AS residente, 0 as rettifica, Round(SUM(corrispettivoaccise * IF(rigo = 13, 1, consumoaccise)), 2)  as corrispettivoaccisa, 
0 as consumo, 0 as consumoaccise, 'TASSATI' as accisa, '' as tipologia_fornitura_utf,
'19990101' as decorrenza, '19990101' as scadenza, '19990101' as datadistipula, '' as zonaipex, '' as codicefattura, '19990101' as dataemissione, 'P' as Quadro, 14 as Rigo
from tmp_righi cn
where cn.Quadro = 'P'
group by  provincia;

INSERT INTO tmp_righi
SELECT * FROM tmp_dettaglioaccise WHERE Quadro = 'P' and Rigo = 14;

INSERT INTO tmp_dettaglioaccise
Select 0 AS idcontratto, '' AS periodoriferimento, 'EE' as utility, '' AS accise, '' AS tipologiacliente,
'' AS pdp, '' AS codicefiscale, '' AS indirizzo, '' AS codcat, '' as provincia, '' AS paese, cn.ambito, 0 AS potenzaimpegnata, 0 as percesclusioneaccise,
'' AS codicetensione, 0 AS residente, 0 as rettifica,SUM(corrispettivoaccise)  as corrispettivoaccisa, 
0 as consumo, 0 as consumoaccise, 'TASSATI' as accisa, '' as tipologia_fornitura_utf,
'19990101' as decorrenza, '19990101' as scadenza, '19990101' as datadistipula, '' as zonaipex, '' as codicefattura, '19990101' as dataemissione, 'Q' as Quadro, 1 as Rigo
FROM tmp_righi cn
WHERE Quadro = 'P' and Rigo = 14
GROUP BY ambito;


DELETE FROM plank_dogane_reportannuale_dettaglioquadri
where tokenreport = var_token and utility = 'EE';

INSERT INTO plank_dogane_reportannuale_dettaglioquadri(
idcontratto, periodoriferimento, utility, accise, tipologiacliente, pdp, codicefiscale, indirizzo, codcat, provincia, paese, ambito, 
potenzaimpegnata, percesclusioneaccise, codicetensione, residente, rettifica, corrispettivoaccise, consumo, 
consumoaccise, accisa, tipologia_fornitura_utf, decorrenza, scadenza, datadistipula, zonaipex, codicefattura, dataemissione, Quadro, Rigo, tokenreport, particellaazienda)
select idcontratto, periodoriferimento, utility, accise, tipologiacliente, pdp, codicefiscale, indirizzo, codcat, provincia, paese, ambito, 
potenzaimpegnata, percesclusioneaccise, codicetensione, residente, rettifica, corrispettivoaccise, consumo, consumoaccise, accisa, tipologia_fornitura_utf, decorrenza, scadenza, 
datadistipula, zonaipex, codicefattura, dataemissione, Quadro, Rigo, var_token, var_azienda
FROM tmp_dettaglioaccise
ORDER BY Quadro, Rigo;

END

CREATE DEFINER=`plank`@`%` PROCEDURE `plank_dogane_reportannuale_dettaglio_crearighe`(IN var_idreport INT, IN var_tokentask VARCHAR(45))
BEGIN

DECLARE var_userid VARCHAR(45);
DECLARE var_token VARCHAR(45);
DECLARE var_azienda VARCHAR(45);
DECLARE var_anno INT;


SELECT particellaazienda,annodich,tokenreport
INTO var_azienda,var_anno,var_token
FROM comm.plank_dogane_reportannuale
WHERE idreport=var_idreport and runningreport=1;

    
SELECT userid 
INTO var_userid
FROM comm.plank_queue_tasks
WHERE particellaazienda=var_azienda and task=var_tokentask;

IF(var_azienda = 'bes' AND var_anno < 2023) THEN

INSERT INTO comm.plank_queue_tasks(userid,task,taskname,task_type,query_key,query_text,query_mandatory,query_priority,numretry_onfail,particellaazienda,active)
SELECT var_userid,var_tokentask,"CALCOLA DETTAGLIO DOGANE","QUERY","CALC_ANNO_DOGANE",CONCAT("CALL comm.plank_dogane_reportannuale_dettaglio_bes('",var_azienda,"','",var_anno,"','",var_token,"');"),"0","20","0",var_azienda,"1";

ELSE

INSERT INTO comm.plank_queue_tasks(userid,task,taskname,task_type,query_key,query_text,query_mandatory,query_priority,numretry_onfail,particellaazienda,active)
SELECT var_userid,var_tokentask,"CALCOLA DETTAGLIO DOGANE","QUERY","CALC_ANNO_DOGANE",CONCAT("CALL comm.plank_dogane_reportannuale_dettaglio_ee('",var_azienda,"','",var_anno,"','",var_token,"');"),"0","20","0",var_azienda,"1";

INSERT INTO comm.plank_queue_tasks(userid,task,taskname,task_type,query_key,query_text,query_mandatory,query_priority,numretry_onfail,particellaazienda,active)
SELECT var_userid,var_tokentask,"CALCOLA DETTAGLIO DOGANE","QUERY","CALC_ANNO_DOGANE",CONCAT("CALL comm.plank_dogane_reportannuale_dettaglio_gas('",var_azienda,"','",var_anno,"','",var_token,"');"),"0","20","0",var_azienda,"1";

END IF;

INSERT INTO comm.plank_queue_tasks(userid,task,taskname,task_type,query_key,query_text,query_mandatory,query_priority,numretry_onfail,particellaazienda,active)
VALUES(var_userid,var_tokentask,"REPORT ANNO DOGANE","CMD","REPORT_ANNO_DOGANE",CONCAT("php -f report/dogane_reportannuale_dettaglio_task.php ",var_idreport),"1","10","0",var_azienda,"1");

END