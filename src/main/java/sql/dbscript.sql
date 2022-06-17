-- SQL SCRIPT
-- Any sql script after production 2022-04-26 here:

ALTER TABLE user_salary ADD user_create VARCHAR(32) NULL AFTER amount;
ALTER TABLE user_salary ADD user_update VARCHAR(32) NULL AFTER user_create;
ALTER TABLE user_salary ADD time_update timestamp NULL AFTER time_create;

UPDATE `user_payment_config` SET `config_flag`='1' WHERE user_id = 'sirung.t';

ALTER TABLE `permission` CHANGE `time_update` `time_update` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT NULL;
ALTER TABLE `permission` CHANGE `name` `page_name` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL;
INSERT INTO `page` (`page_id`, `page_group_id`, `page_name`, `is_active`, `is_page`, `redirect`, `check_view`, `check_create_update`, `check_delete`, `check_approve`, `description`, `user_create`, `user_update`, `time_create`, `time_update`) VALUES ('P11', 'GP03', 'รายงานข้อมูลการทำงาน', '1', '1', '', '1', '1', '1', '0', '', '', '', NULL, NULL)
INSERT INTO `page` (`page_id`, `page_group_id`, `page_name`, `is_active`, `is_page`, `redirect`, `check_view`, `check_create_update`, `check_delete`, `check_approve`, `description`, `user_create`, `user_update`, `time_create`, `time_update`) VALUES ('P12', 'GP05', 'Page menu', '1', '1', '', '0', '0', '0', '0', '', '', '', NULL, NULL)
INSERT INTO `page` (`page_id`, `page_group_id`, `page_name`, `is_active`, `is_page`, `redirect`, `check_view`, `check_create_update`, `check_delete`, `check_approve`, `description`, `user_create`, `user_update`, `time_create`, `time_update`) VALUES ('P13', 'GP05', 'User', '1', '1', '', '0', '0', '0', '0', '', '', '', NULL, NULL)
INSERT INTO `page` (`page_id`, `page_group_id`, `page_name`, `is_active`, `is_page`, `redirect`, `check_view`, `check_create_update`, `check_delete`, `check_approve`, `description`, `user_create`, `user_update`, `time_create`, `time_update`) VALUES ('P14', 'GP05', 'Role', '1', '1', '', '0', '0', '0', '0', '', '', '', NULL, NULL)