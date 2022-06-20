-- SQL SCRIPT
-- Any sql script after production 2022-04-26 here:

ALTER TABLE user_salary ADD user_create VARCHAR(32) NULL AFTER amount;
ALTER TABLE user_salary ADD user_update VARCHAR(32) NULL AFTER user_create;
ALTER TABLE user_salary ADD time_update timestamp NULL AFTER time_create;

UPDATE `user_payment_config` SET `config_flag`='1' WHERE user_id = 'sirung.t';

ALTER TABLE payment_type CHANGE Payment_type_name payment_type_name VARCHAR(64);
ALTER TABLE employee_type MODIFY COLUMN employee_type_id bigint(20) AUTO_INCREMENT;