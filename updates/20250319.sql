ALTER TABLE `comm`.`plank_contrattidigitali_tipoconnessione` 
ADD COLUMN `lang` VARCHAR(45) NULL AFTER `particellaazienda`;

ALTER TABLE `comm`.`plank_contrattidigitali_tipoconnessione` 
DROP INDEX `particella_tipo_unique` ,
ADD UNIQUE INDEX `particella_tipo_lang_unique` (`particellaazienda` ASC, `tipoconnessione` ASC, `lang` ASC) VISIBLE;

INSERT INTO `comm`.`plank_contrattidigitali_tipoconnessione` (`tipoconnessione`, `label`, `lang`) VALUES ('PT', 'Permanent', 'english');
INSERT INTO `comm`.`plank_contrattidigitali_tipoconnessione` (`tipoconnessione`, `label`, `lang`) VALUES ('TP', 'Temporary', 'english');
INSERT INTO `comm`.`plank_contrattidigitali_tipoconnessione` (`tipoconnessione`, `label`, `particellaazienda`, `lang`) VALUES ('PT', 'Masonry construction', 'igl', 'english');
INSERT INTO `comm`.`plank_contrattidigitali_tipoconnessione` (`tipoconnessione`, `label`, `particellaazienda`, `lang`) VALUES ('TP', 'Mobile or temporary construction', 'igl', 'english');
UPDATE `comm`.`plank_contrattidigitali_tipoconnessione` SET `lang` = 'italian' WHERE (`id` = '1');
UPDATE `comm`.`plank_contrattidigitali_tipoconnessione` SET `lang` = 'italian' WHERE (`id` = '2');
UPDATE `comm`.`plank_contrattidigitali_tipoconnessione` SET `lang` = 'italian' WHERE (`id` = '3');
UPDATE `comm`.`plank_contrattidigitali_tipoconnessione` SET `lang` = 'italian' WHERE (`id` = '4');

ALTER TABLE `comm`.`plank_contrattidigitali_usoenergia` 
ADD COLUMN `lang` VARCHAR(45) NULL AFTER `particellaazienda`;

INSERT INTO `comm`.`plank_contrattidigitali_usoenergia` (`uso_energia`, `label`, `particellaazienda`, `lang`) VALUES 
('001', 'Residence', 'IGL', 'english'),
('002', 'Commercial activity', 'IGL', 'english'),
('003', 'Other residential uses (e.g., garage; stairwell lighting)', 'IGL', 'english'),
('004', 'Other non-commercial uses (e.g., storage; electricity for non-commercial agricultural use; vineyard hoist)', 'IGL', 'english'),
('010', 'Temporary meter (e.g., construction site; temporary lighting)', 'IGL', 'english'),
('012', 'Event (e.g., festivals or fairs)', 'IGL', 'english'),
('014', 'Other', 'IGL', 'english');
INSERT INTO `comm`.`plank_contrattidigitali_usoenergia` (`uso_energia`, `sottotipo_uso`, `label_sottotipo_uso`, `particellaazienda`, `lang`) VALUES 
('014', '014_1', 'A building constructed after January 30, 1977', 'IGL', 'english'),
('014', '014_2', 'A building constructed before January 30, 1977', 'IGL', 'english'),
('014', '014_3', 'Modify the building to make it compliant with the registered municipal project', 'IGL', 'english'),
('014', '014_4', 'Modify a pre-existing building', 'IGL'),
('014', '014_5', 'Fair or Event for which you have authorization to occupy public land', 'IGL', 'english'),
('014', '014_6', 'Water pumps', 'IGL'),
('014', '014_7', 'Temporary installation for urban planning purposes', 'IGL', 'english'),
('014', '014_8', 'A place without buildings, facilities, or works', 'IGL', 'english');
INSERT INTO `comm`.`plank_contrattidigitali_usoenergia` (`uso_energia`, `label`, `lang`) VALUES 
('001', 'Ordinary [Permanent]'),('002', 'Piecework [Permanent]', 'english'),
('003', 'Installation not permanently manned, located outside inhabited areas [Particular Permanent]', 'english'),
('004', 'Luminous and advertising signs [Particular Permanent]', 'english'),
('005', 'Monument illumination system and similar [Particular Permanent]', 'english'),
('006', 'Lift system and similar [Particular Permanent]'),
('007', 'Mobile and precarious installations [Particular Permanent]', 'english'),
('008', 'Single construction not permanently inhabited or not the official residence of the owner (villas, hunting lodges, mountain shelters, etc.) located more than 2,000 meters from the reference medium/low voltage substation [Particular Permanent]', 'english'),
('009', 'Construction not accessible by motorable roads or separated from existing distribution networks by stretches of sea, lake, or lagoon [Particular Permanent]', 'english'),
('010', 'Construction site [Temporary]'),
('011', 'Traveling show and similar [Extraordinary Temporary]'),
('012', 'Installation made for events and patronal, political, religious, sports, theatrical festivities, and similar [Extraordinary Temporary]', 'english'),
('013', 'Installation for cinematographic, television, and similar recordings [Extraordinary Temporary]', 'english'),
('015', 'Temporary supply other than construction site with non-subsidized contribution [Extraordinary Temporary]', 'english');

UPDATE `comm`.`plank_contrattidigitali_usoenergia` SET `lang` = 'italian' WHERE (`id` IN ('1', '2'
'3', '4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22',
'23','24','25','26','27','28','29'));