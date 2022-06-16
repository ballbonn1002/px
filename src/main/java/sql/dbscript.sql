-- SQL SCRIPT
-- Any sql script after production 2022-04-26 here:

ALTER TABLE user_salary ADD user_create VARCHAR(32) NULL AFTER amount;
ALTER TABLE user_salary ADD user_update VARCHAR(32) NULL AFTER user_create;
ALTER TABLE user_salary ADD time_update timestamp NULL AFTER time_create;