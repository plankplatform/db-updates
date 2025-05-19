CREATE TABLE plank_stats_graphs (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  stat_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  config JSON NOT NULL,
  filters JSON DEFAULT NULL,
  sorting JSON DEFAULT NULL,
  is_starred BOOLEAN NOT NULL DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  CONSTRAINT fk_plank_stats_graphs_stat_id FOREIGN KEY (stat_id)
    REFERENCES plank_stats_queries(id)
);

UPDATE `comm`.`plank_pianirientro_template` SET `structure` = '{\n    \"firma\": true,\n    \"testi\": [\n        \"e Le offre la possibilità di saldare il Suo debito attraverso il seguente piano di rientro:\",\n        \"Il pagamento delle rate, il cui singolo importo sarà imputato ai sensi degli artt. 1193 e 1194 c.c., e in specie a saldo, via via, delle fatture insolute, da quella di più antica emissione alla più recente, dovrà avvenire mediante \",\n        \"Il piano di rientro sarà da noi accettato con l’invio della presente notifica debitamente firmata e timbrata (nel caso di società) all’indirizzo mail [[servizioclienti_email_replyto]] entro e non oltre 2 giorni dalla data di ricevimento della stessa, con l’avviso che, in difetto, il soprastante piano di rientro sarà privo di efficacia e i versamenti eventualmente effettuati saranno come sopra imputati in acconto di quanto complessivamente dovuto.\",\n        \"Vorrà inoltre prendere atto che la sottoscrizione della presente ha valore di Ricognizione di Debito ex art. 1988 cc, anche ai fini dellart. 642, comma 2, cpc ed ai fini dell\'applicabilità di interessi ex art. 5 D. Lgs. n. 231/2002, dalla data di scadenza di pagamento di ciascuna fattura al relativo soddisfo, che saranno computati all\'estinzione del presente piano di rientro con emissione di apposita fattura, e che, al mancato pagamento anche di una sola delle sopra elencate rate alle scadenze indicate, decadrà dal beneficio del termine, conseguendone che la Società Italy Green Power S.p.A. sarà libera di agire per ogni e qualsiasi importo di propria spettanza e si vedrà costretta ad inoltrare richiesta di disalimentazione della rete elettrica/gas di Suo riferimento.\",\n        \"Per qualsiasi delucidazione la invitiamo a contattare il nostro Servizio Clienti all’indirizzo email [[servizioclienti_email_replyto]] o al numero [[backoffice_tel]].\"\n    ],\n    \"saluti\": \"Distinti Saluti.\",\n    \"oggetto\": \"Piano di rientro n. [[protocollo]]/[[annocomunicazione]] del [[data]] per debito di € [[debito]]\",\n    \"BONIFICO\": \"bonifico bancario utilizzando le seguenti coordinate:\",\n    \"testo_firma\": [\n        \"PER ESPRESSA ACCETTAZIONE Il Cliente\",\n        \"(Timbro e firma del titolare e/o legale rappresentante)\",\n        \"&nbsp;\",\n        \"[[line]]\"\n    ],\n    \"intestazione\": \"Gent.mo Cliente, in persona del legale rappresentante p.t., la presente per comunicarLe che la Società [[nomeazienda]] ha accolto la Sua richiesta di rateizzazione delle seguenti spettanze\",\n    \"new_line_before_saluti\": false\n}' WHERE `particellaazienda` = 'IGP';
