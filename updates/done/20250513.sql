ALTER TABLE `comm`.`plank_anagraficabanche_mollie` 
ADD COLUMN `access_code_expire_time` DATETIME NULL DEFAULT NULL AFTER `last_edit`;
ALTER TABLE `comm`.`plank_anagraficabanche_mollie` 
ADD COLUMN `profile_id` VARCHAR(45) NULL DEFAULT NULL AFTER `access_code_expire_time`;
