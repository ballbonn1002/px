-- SQL SCRIPT
-- Any sql script after production 2022-04-26 here:

ALTER TABLE user_salary ADD user_create VARCHAR(32) NULL AFTER amount;
ALTER TABLE user_salary ADD user_update VARCHAR(32) NULL AFTER user_create;
ALTER TABLE user_salary ADD time_update timestamp NULL AFTER time_create;

UPDATE `user_payment_config` SET `config_flag`='1' WHERE user_id = 'sirung.t';

ALTER TABLE `permission` CHANGE `time_update` `time_update` TIMESTAMP on update CURRENT_TIMESTAMP NULL DEFAULT NULL;
ALTER TABLE `permission` CHANGE `name` `page_name` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL;
INSERT INTO `page` (`page_id`, `page_group_id`, `page_name`, `is_active`, `is_page`, `redirect`, `check_view`, `check_create_update`, `check_delete`, `check_approve`, `description`, `user_create`, `user_update`, `time_create`, `time_update`) VALUES ('P11', 'GP03', 'Report working', '1', '1', '', '1', '1', '1', '0', '', '', '', NULL, NULL)
INSERT INTO `page` (`page_id`, `page_group_id`, `page_name`, `is_active`, `is_page`, `redirect`, `check_view`, `check_create_update`, `check_delete`, `check_approve`, `description`, `user_create`, `user_update`, `time_create`, `time_update`) VALUES ('P12', 'GP05', 'Page menu', '1', '1', '', '0', '0', '0', '0', '', '', '', NULL, NULL)
INSERT INTO `page` (`page_id`, `page_group_id`, `page_name`, `is_active`, `is_page`, `redirect`, `check_view`, `check_create_update`, `check_delete`, `check_approve`, `description`, `user_create`, `user_update`, `time_create`, `time_update`) VALUES ('P13', 'GP05', 'User', '1', '1', '', '0', '0', '0', '0', '', '', '', NULL, NULL)
INSERT INTO `page` (`page_id`, `page_group_id`, `page_name`, `is_active`, `is_page`, `redirect`, `check_view`, `check_create_update`, `check_delete`, `check_approve`, `description`, `user_create`, `user_update`, `time_create`, `time_update`) VALUES ('P14', 'GP05', 'Role', '1', '1', '', '0', '0', '0', '0', '', '', '', NULL, NULL)

ALTER TABLE sys_user CHANGE user_id user_id VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
CHANGE name_th name_th VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
CHANGE email email VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
CHANGE phone phone VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
CHANGE is_active is_active CHAR(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL;




-- 20/6/2022 :
UPDATE `employee_type` SET `payment` = '0', `term` = '1', `term_day` = '30' WHERE `employee_type`.`employee_type_id` = '01';
UPDATE `employee_type` SET `payment` = '0', `term` = '1', `term_day` = '22' WHERE `employee_type`.`employee_type_id` = '02';
INSERT INTO `employee_type` (`employee_type_id`, `name`, `description`, `payment`, `term`, `term_day`, `time_create`, `time_update`, `user_create`, `user_update`)
VALUES ('03', 'trainee', '', '1', '1', '0', '2022-06-20 10:16:31', '2022-06-20 10:16:31', NULL, NULL);

INSERT INTO `employee_type` (`employee_type_id`, `name`, `description`, `payment`, `term`, `term_day`, `time_create`, `time_update`, `user_create`, `user_update`)
VALUES ('04', '15 day 2 times', '', '0', '2', '15', '2022-06-20 10:20:31', '2022-06-20 10:20:31', NULL, NULL);

INSERT INTO `user` (`id`, `role_id`, `department_id`, `manager_id`, `position_id`, `employee_id`, `name`, `nick_name`, `password`, `email`, `email_password`, `email_enable`, `birth_date`, `address`, `flag_search`, `start_date`, `end_date`, `work_day_start`, `work_day_end`, `work_time_start`, `work_time_end`, `latest_salary`, `edu_institute_1`, `edu_institute_2`, `edu_institute_3`, `edu_institute_4`, `edu_dur_start_1`, `edu_dur_start_2`, `edu_dur_start_3`, `edu_dur_start_4`, `edu_dur_end_1`, `edu_dur_end_2`, `edu_dur_end_3`, `edu_dur_end_4`, `edu_degree_1`, `edu_degree_2`, `edu_degree_3`, `edu_degree_4`, `enable`, `leave_quota_1`, `leave_quota_2`, `leave_quota_3`, `leave_quota_lastyear`, `time_create`, `time_update`, `email_host`, `password_update`, `login_failed`, `last_login_failed_time`, `path`, `facebookid`, `line_id`, `phone_num`, `gender`, `username`, `id_sitejob`, `title_name_th`, `title_name_en`, `name_en`, `nick_name_en`, `emergency_contact`, `emergency_phone`, `employee_type_id`, `social_security`, `withholding`, `withholding_auto`, `tax_deduction`, `transfer_type`, `bank`, `bank_type`, `bank_number`, `bank_branch`, `citizen_id`, `passport_id`)
VALUES ('test.data1', '', NULL, NULL, NULL, NULL, 'test 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '9:00', '18:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '0.0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Mr.', 'Mr.', 'test 1', NULL, NULL, NULL, '01', '1', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '');
INSERT INTO `user` (`id`, `role_id`, `department_id`, `manager_id`, `position_id`, `employee_id`, `name`, `nick_name`, `password`, `email`, `email_password`, `email_enable`, `birth_date`, `address`, `flag_search`, `start_date`, `end_date`, `work_day_start`, `work_day_end`, `work_time_start`, `work_time_end`, `latest_salary`, `edu_institute_1`, `edu_institute_2`, `edu_institute_3`, `edu_institute_4`, `edu_dur_start_1`, `edu_dur_start_2`, `edu_dur_start_3`, `edu_dur_start_4`, `edu_dur_end_1`, `edu_dur_end_2`, `edu_dur_end_3`, `edu_dur_end_4`, `edu_degree_1`, `edu_degree_2`, `edu_degree_3`, `edu_degree_4`, `enable`, `leave_quota_1`, `leave_quota_2`, `leave_quota_3`, `leave_quota_lastyear`, `time_create`, `time_update`, `email_host`, `password_update`, `login_failed`, `last_login_failed_time`, `path`, `facebookid`, `line_id`, `phone_num`, `gender`, `username`, `id_sitejob`, `title_name_th`, `title_name_en`, `name_en`, `nick_name_en`, `emergency_contact`, `emergency_phone`, `employee_type_id`, `social_security`, `withholding`, `withholding_auto`, `tax_deduction`, `transfer_type`, `bank`, `bank_type`, `bank_number`, `bank_branch`, `citizen_id`, `passport_id`)
VALUES ('test.data2', '', NULL, NULL, NULL, NULL, 'test 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '9:00', '18:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '0.0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Mrs.', 'Mrs.', 'test 2', NULL, NULL, NULL, '02', '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '');
INSERT INTO `user` (`id`, `role_id`, `department_id`, `manager_id`, `position_id`, `employee_id`, `name`, `nick_name`, `password`, `email`, `email_password`, `email_enable`, `birth_date`, `address`, `flag_search`, `start_date`, `end_date`, `work_day_start`, `work_day_end`, `work_time_start`, `work_time_end`, `latest_salary`, `edu_institute_1`, `edu_institute_2`, `edu_institute_3`, `edu_institute_4`, `edu_dur_start_1`, `edu_dur_start_2`, `edu_dur_start_3`, `edu_dur_start_4`, `edu_dur_end_1`, `edu_dur_end_2`, `edu_dur_end_3`, `edu_dur_end_4`, `edu_degree_1`, `edu_degree_2`, `edu_degree_3`, `edu_degree_4`, `enable`, `leave_quota_1`, `leave_quota_2`, `leave_quota_3`, `leave_quota_lastyear`, `time_create`, `time_update`, `email_host`, `password_update`, `login_failed`, `last_login_failed_time`, `path`, `facebookid`, `line_id`, `phone_num`, `gender`, `username`, `id_sitejob`, `title_name_th`, `title_name_en`, `name_en`, `nick_name_en`, `emergency_contact`, `emergency_phone`, `employee_type_id`, `social_security`, `withholding`, `withholding_auto`, `tax_deduction`, `transfer_type`, `bank`, `bank_type`, `bank_number`, `bank_branch`, `citizen_id`, `passport_id`)
VALUES ('test.data3', '', NULL, NULL, NULL, NULL, 'test 3 ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '9:00', '18:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '0.0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Ms.', 'Ms.', 'test 3', NULL, NULL, NULL, '03', '0', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '');
INSERT INTO `user` (`id`, `role_id`, `department_id`, `manager_id`, `position_id`, `employee_id`, `name`, `nick_name`, `password`, `email`, `email_password`, `email_enable`, `birth_date`, `address`, `flag_search`, `start_date`, `end_date`, `work_day_start`, `work_day_end`, `work_time_start`, `work_time_end`, `latest_salary`, `edu_institute_1`, `edu_institute_2`, `edu_institute_3`, `edu_institute_4`, `edu_dur_start_1`, `edu_dur_start_2`, `edu_dur_start_3`, `edu_dur_start_4`, `edu_dur_end_1`, `edu_dur_end_2`, `edu_dur_end_3`, `edu_dur_end_4`, `edu_degree_1`, `edu_degree_2`, `edu_degree_3`, `edu_degree_4`, `enable`, `leave_quota_1`, `leave_quota_2`, `leave_quota_3`, `leave_quota_lastyear`, `time_create`, `time_update`, `email_host`, `password_update`, `login_failed`, `last_login_failed_time`, `path`, `facebookid`, `line_id`, `phone_num`, `gender`, `username`, `id_sitejob`, `title_name_th`, `title_name_en`, `name_en`, `nick_name_en`, `emergency_contact`, `emergency_phone`, `employee_type_id`, `social_security`, `withholding`, `withholding_auto`, `tax_deduction`, `transfer_type`, `bank`, `bank_type`, `bank_number`, `bank_branch`, `citizen_id`, `passport_id`)
VALUES ('test.data4', '', NULL, NULL, NULL, NULL, 'test 4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '9:00', '18:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, '0.0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'Ms.', 'Mr.', 'test 4', NULL, NULL, NULL, '04', '1', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '', '');

ALTER TABLE `user_salary` CHANGE `user_salary_id` `user_salary_id` BIGINT(20) NOT NULL AUTO_INCREMENT;
INSERT INTO `user_salary` (`user_salary_id`, `user_id`, `payment_type_id`, `amount`, `date`, `description`, `user_create`, `user_update`, `time_create`, `time_update`) VALUES (NULL, 'test.data1', 'SL', '15000.00', '2022-01-01', NULL, '', '', NULL, NULL),
(NULL, 'test.data2', 'SL', '25000.00', '2022-01-01', NULL, '', '', NULL, NULL),
(NULL, 'test.data3', 'SL', '250.00', '2022-01-01', NULL, '', '', NULL, NULL), (NULL, 'test.data4', 'SL', '40000.00', '2022-01-01', NULL, '', '', NULL, NULL);


-- Payment 6/22/2022 BEST:
UPDATE `payment_type` SET `payment_type_id` = 'BONUS', `Payment_type_name` = 'โบนัส', `system` = '0', `config_flag` = '0', `description` = NULL WHERE `payment_type`.`payment_type_id` = 'income';
INSERT INTO `payment_type` (`payment_type_id`, `Payment_type_name`, `type`, `system`, `sequence`, `config_flag`, `user_create`, `user_update`, `description`, `time_create`, `time_update`) VALUES ('EQUIPMENT', 'เบิกค่าอุปกรณ์\r\n', '1', '0', '8', '1', NULL, NULL, NULL, NULL, NULL);
UPDATE `payment_type` SET `sequence` = '10' WHERE `payment_type`.`payment_type_id` = 'TAX';
UPDATE `payment_type` SET `config_flag` = '1' WHERE `payment_type`.`payment_type_id` = 'VA';
UPDATE payment_type SET payment_type_id = 'TISCO', config_flag = '1', sequence = '11', description = NULL WHERE payment_type.payment_type_id = 'PVD';
INSERT INTO payment_type (payment_type_id, Payment_type_name, type, system, sequence, config_flag, user_create, user_update, description, time_create, time_update) VALUES ('TISCO', 'กองทุนสำรองเลี้ยงชีพ', '0', '0', '11', '1', 'thanet.s', 'thanet.s', NULL, '2022-04-01 08:58:00', '2022-04-01 08:58:00');
UPDATE `payment_type` SET `sequence` = '15' WHERE `payment_type`.`payment_type_id` = 'StudentLoan';
UPDATE `payment_type` SET `payment_type_id` = 'LATE', `Payment_type_name` = 'มาสาย', `sequence` = '12', `description` = NULL WHERE `payment_type`.`payment_type_id` = 'ABSENCE';
INSERT INTO `payment_type` (`payment_type_id`, `Payment_type_name`, `type`, `system`, `sequence`, `config_flag`, `user_create`, `user_update`, `description`, `time_create`, `time_update`) VALUES ('ABSENT', 'ขาดงาน\r\n', '0', '0', '13', '0', NULL, NULL, NULL, NULL, NULL), ('ABSENCE', 'ลาไม่รับค่าจ้าง\r\n', '0', '0', '14', '0', NULL, NULL, NULL, NULL, NULL);
ALTER TABLE `payment_group` CHANGE `payment_group_id` `payment_group_id` BIGINT(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `payment_detail` CHANGE `payment_detail_id` `payment_detail_id` BIGINT(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `payment` CHANGE `payment_id` `payment_id` BIGINT(20) NOT NULL AUTO_INCREMENT;
INSERT INTO `payment_group` (`payment_group_id`, `name`, `transaction_date`, `payment_date`, `start_date`, `end_date`, `social_security`, `description`, `status`, `system`, `user_update`, `user_create`, `time_create`, `time_update`) VALUES (NULL, 'Payroll April 2022\r\n', '2022-04-25', '2022-04-30', '2022-04-01', '2022-04-30', '5', 'ทำเงินเดือนวันที่ 25/4/2022\r\n', '4', '1', 'thanet.s', 'thanet.s', '2022-04-25 09:46:35', '2022-04-25 09:46:35');
INSERT INTO `payment` (`payment_id`, `payment_group_id`, `user_id`, `employee_type_id`, `employee_type_name`, `actual_day`, `salary`, `income_net`, `expend_net`, `total_pay`, `status`, `remark`, `user_update`, `user_create`, `time_create`, `time_update`, `actual_hours`, `late`, `absent`, `absence`, `OT1`, `OT2`, `OT3`) VALUES (NULL, '1', 'test.data1', '1', 'พนักงานประจำ', '30', '15000.00', '0.00', '750.00', '14250.00', '2', NULL, 'thanet.s', 'thanet.s', '2022-04-25 09:49:06', '2022-04-25 09:49:06', '0:00', '0:00', '0:00', '0:00', '0:00', '0:00', '0:00');
INSERT INTO `payment` (`payment_id`, `payment_group_id`, `user_id`, `employee_type_id`, `employee_type_name`, `actual_day`, `salary`, `income_net`, `expend_net`, `total_pay`, `status`, `remark`, `user_update`, `user_create`, `time_create`, `time_update`, `actual_hours`, `late`, `absent`, `absence`, `OT1`, `OT2`, `OT3`) VALUES (NULL, '1', 'test.data2', '2', 'พนักงานอัตราจ้าง\r\n', '22', '25000.00', '1500.00', '750.00', '25750.00', '2', NULL, 'thanet.s', 'thanet.s', '2022-04-25 09:51:57', '2022-04-25 09:51:57', '0:00', '0:00', '0:00', '0:00', '0:00', '0:00', '0:00');
INSERT INTO `payment` (`payment_id`, `payment_group_id`, `user_id`, `employee_type_id`, `employee_type_name`, `actual_day`, `salary`, `income_net`, `expend_net`, `total_pay`, `status`, `remark`, `user_update`, `user_create`, `time_create`, `time_update`, `actual_hours`, `late`, `absent`, `absence`, `OT1`, `OT2`, `OT3`) VALUES (NULL, '1', 'test.data3', '3', 'นักศึกษาฝึกงาน\r\n', '20', '5000.00', '0.00', '0.00', '5000.00', '2', NULL, 'thanet.s', 'thanet.s', '2022-04-25 09:53:45', '2022-04-25 09:53:45', '0:00', '0:00', '0:00', '0:00', '0:00', '0:00', '0:00');
INSERT INTO `payment_detail` (`payment_detail_id`, `payment_id`, `user_id`, `payment_type_id`, `amount`, `user_update`, `user_create`, `time_create`, `time_update`) VALUES (NULL, '1', 'test.data1', 'SL', '15000.00', 'thanet.s', 'thanet.s', '2022-04-25 09:59:31', '2022-04-25 09:59:31'), (NULL, '1', 'test.data1', 'OT1', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 09:59:31', '2022-04-25 09:59:31'), (NULL, '1', 'test.data1', 'OT2', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 09:59:31', '2022-04-25 09:59:31'), (NULL, '1', 'test.data1', 'OT3', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 09:59:31', '2022-04-25 09:59:31'), (NULL, '1', 'test.data1', 'VA', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 09:59:31', '2022-04-25 09:59:31'), (NULL, '1', 'test.data1', 'TRAVEL', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 09:59:31', '2022-04-25 09:59:31'), (NULL, '1', 'test.data1', 'BONUS', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 09:59:31', '2022-04-25 09:59:31'), (NULL, '1', 'test.data1', 'EQUIPMENT', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 09:59:31', '2022-04-25 09:59:31'), (NULL, '1', 'test.data1', 'SSI', '750.00', 'thanet.s', 'thanet.s', '2022-04-25 09:59:31', '2022-04-25 09:59:31'), (NULL, '1', 'test.data1', 'TAX', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 09:59:31', '2022-04-25 09:59:31'), (NULL, '1', 'test.data1', 'TISCO', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 09:59:31', '2022-04-25 09:59:31'), (NULL, '1', 'test.data1', 'LATE', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 09:59:31', '2022-04-25 09:59:31'), (NULL, '1', 'test.data1', 'ABSENT', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 09:59:31', '2022-04-25 09:59:31'), (NULL, '1', 'test.data1', 'ABSENCE', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 09:59:31', '2022-04-25 09:59:31'), (NULL, '1', 'test.data1', 'StudentLoan', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 09:59:31', '2022-04-25 09:59:31');
INSERT INTO `payment_group` (`payment_group_id`, `name`, `transaction_date`, `payment_date`, `start_date`, `end_date`, `social_security`, `description`, `status`, `system`, `user_update`, `user_create`, `time_create`, `time_update`) VALUES (NULL, 'Payroll May 2022_1\r\n', '2022-05-25', '2022-05-31', '2022-05-01', '2022-05-31', '1', 'ทำเงินเดือนวันที่ 25/5/2022\r\n', '2', '1', 'thanet.s', 'thanet.s', '2022-05-25 10:23:20', '2022-05-25 10:23:20'), (NULL, 'Payroll May 2022_2\r\n', '2022-05-25', '2022-05-31', '2022-05-01', '2022-05-31', '0', 'ทำเงินเดือนวันที่ 25/5/2022\r\n', '1', '1', 'thanet.s', 'thanet.s', '2022-05-25 10:23:20', '2022-05-25 10:23:20');
INSERT INTO `payment` (`payment_id`, `payment_group_id`, `user_id`, `employee_type_id`, `employee_type_name`, `actual_day`, `salary`, `income_net`, `expend_net`, `total_pay`, `status`, `remark`, `user_update`, `user_create`, `time_create`, `time_update`, `actual_hours`, `late`, `absent`, `absence`, `OT1`, `OT2`, `OT3`) VALUES (NULL, '2', 'test.data1', '1', 'พนักงานประจำ', '30', '15000.00', '1500.00', '750.00', '15750.00', '2', NULL, 'thanet.s', 'thanet.s', '2022-04-25 10:29:04', '2022-04-25 10:29:04', '0:00', '0:00', '0:00', '0:00', '0:00', '0:00', '0:00'), (NULL, '2', 'test.data2', '2', 'พนักงานอัตราจ้าง', '22', '25000.00', '2000.00', '750.00', '26250.00', '2', NULL, 'thanet.s', 'thanet.s', '2022-04-25 10:29:04', '2022-04-25 10:29:04', '0:00', '0:00', '0:00', '0:00', '0:00', '0:00', '0:00'), (NULL, '2', 'test.data3', '3', 'นักศึกษาฝึกงาน\r\n', '20', '5000.00', '2200.00', '0.00', '7200.00', '2', NULL, 'thanet.s', 'thanet.s', '2022-04-25 10:29:04', '2022-04-25 10:29:04', '0:00', '0:00', '0:00', '0:00', '0:00', '0:00', '0:00'), (NULL, '3', 'test.data4', '4', '15 วัน 2 งวด\r\n', '15', '20000.00', '3700.00', '1500.00', '22200.00', '1', NULL, 'thanet.s', 'thanet.s', '2022-04-25 10:29:04', '2022-04-25 10:29:04', '0:00', '0:00', '0:00', '0:00', '0:00', '0:00', '0:00');
INSERT INTO `payment_detail` (`payment_detail_id`, `payment_id`, `user_id`, `payment_type_id`, `amount`, `user_update`, `user_create`, `time_create`, `time_update`) VALUES (NULL, '2', 'test.data2', 'SL', '25000.00', 'thanet.s', 'thanet.s', '2022-04-25 11:12:59', '2022-04-25 11:12:59'), (NULL, '2', 'test.data2', 'OT1', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:14:25', '2022-04-25 11:14:25'), (NULL, '2', 'test.data2', 'OT2', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:14:25', '2022-04-25 11:14:25'), (NULL, '2', 'test.data2', 'OT3', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:14:25', '2022-04-25 11:14:25'), (NULL, '2', 'test.data2', 'VA', '1500.00', 'thanet.s', 'thanet.s', '2022-04-25 11:14:25', '2022-04-25 11:14:25'), (NULL, '2', 'test.data2', 'TRAVEL', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:14:25', '2022-04-25 11:14:25'), (NULL, '2', 'test.data2', 'BONUS', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:14:25', '2022-04-25 11:14:25'), (NULL, '2', 'test.data2', 'EQUIPMENT', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:14:25', '2022-04-25 11:14:25'), (NULL, '2', 'test.data2', 'SSI', '750.00', 'thanet.s', 'thanet.s', '2022-04-25 11:14:25', '2022-04-25 11:14:25'), (NULL, '2', 'test.data2', 'TAX', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:14:25', '2022-04-25 11:14:25'), (NULL, '2', 'test.data2', 'TISCO', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:14:25', '2022-04-25 11:14:25'), (NULL, '2', 'test.data2', 'LATE', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:14:25', '2022-04-25 11:14:25'), (NULL, '2', 'test.data2', 'ABSENT', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:14:25', '2022-04-25 11:14:25'), (NULL, '2', 'test.data2', 'ABSENCE', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:14:25', '2022-04-25 11:14:25'), (NULL, '2', 'test.data2', 'StudentLoan', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:14:25', '2022-04-25 11:14:25');
INSERT INTO `payment_detail` (`payment_detail_id`, `payment_id`, `user_id`, `payment_type_id`, `amount`, `user_update`, `user_create`, `time_create`, `time_update`) VALUES (NULL, '3', 'test.data3', 'SL', '5000.00', 'thanet.s', 'thanet.s', '2022-04-25 11:20:50', '2022-04-25 11:20:50'), (NULL, '3', 'test.data3', 'OT1', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:20:50', '2022-04-25 11:20:50'), (NULL, '3', 'test.data3', 'OT2', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:20:50', '2022-04-25 11:20:50'), (NULL, '3', 'test.data3', 'OT3', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:20:50', '2022-04-25 11:20:50'), (NULL, '3', 'test.data3', 'VA', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:20:50', '2022-04-25 11:20:50'), (NULL, '3', 'test.data3', 'TRAVEL', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:20:50', '2022-04-25 11:20:50'), (NULL, '3', 'test.data3', 'BONUS', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:20:50', '2022-04-25 11:20:50'), (NULL, '3', 'test.data3', 'EQUIPMENT', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:20:50', '2022-04-25 11:20:50'), (NULL, '3', 'test.data3', 'SSI', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:20:50', '2022-04-25 11:20:50'), (NULL, '3', 'test.data3', 'TAX', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:20:50', '2022-04-25 11:20:50'), (NULL, '3', 'test.data3', 'TISCO', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:20:50', '2022-04-25 11:20:50'), (NULL, '3', 'test.data3', 'LATE', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:20:50', '2022-04-25 11:20:50'), (NULL, '3', 'test.data3', 'ABSENT', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:20:50', '2022-04-25 11:20:50'), (NULL, '3', 'test.data3', 'ABSENCE', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:20:50', '2022-04-25 11:20:50'), (NULL, '3', 'test.data3', 'StudentLoan', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:20:50', '2022-04-25 11:20:50');
INSERT INTO `payment_detail` (`payment_detail_id`, `payment_id`, `user_id`, `payment_type_id`, `amount`, `user_update`, `user_create`, `time_create`, `time_update`) VALUES (NULL, '4', 'test.data1', 'SL', '15000.00', 'thanet.s', 'thanet.s', '2022-04-25 11:39:13', '2022-04-25 11:39:13'), (NULL, '4', 'test.data1', 'OT1', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:39:13', '2022-04-25 11:39:13'), (NULL, '4', 'test.data1', 'OT2', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:39:13', '2022-04-25 11:39:13'), (NULL, '4', 'test.data1', 'OT3', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:39:13', '2022-04-25 11:39:13'), (NULL, '4', 'test.data1', 'VA', '1500.00', 'thanet.s', 'thanet.s', '2022-04-25 11:39:13', '2022-04-25 11:39:13'), (NULL, '4', 'test.data1', 'TRAVEL', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:39:13', '2022-04-25 11:39:13'), (NULL, '4', 'test.data1', 'BONUS', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:39:13', '2022-04-25 11:39:13'), (NULL, '4', 'test.data1', 'EQUIPMENT', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:39:13', '2022-04-25 11:39:13'), (NULL, '4', 'test.data1', 'SSI', '750.00', 'thanet.s', 'thanet.s', '2022-04-25 11:39:13', '2022-04-25 11:39:13'), (NULL, '4', 'test.data1', 'TAX', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:39:13', '2022-04-25 11:39:13'), (NULL, '4', 'test.data1', 'TISCO', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:39:13', '2022-04-25 11:39:13'), (NULL, '4', 'test.data1', 'LATE', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:39:13', '2022-04-25 11:39:13'), (NULL, '4', 'test.data1', 'ABSENT', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:39:13', '2022-04-25 11:39:13'), (NULL, '4', 'test.data1', 'ABSENCE', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:39:13', '2022-04-25 11:39:13'), (NULL, '4', 'test.data1', 'StudentLoan', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:39:13', '2022-04-25 11:39:13');
INSERT INTO `payment_detail` (`payment_detail_id`, `payment_id`, `user_id`, `payment_type_id`, `amount`, `user_update`, `user_create`, `time_create`, `time_update`) VALUES (NULL, '5', 'test.data2', 'SL', '25000.00', 'thanet.s', 'thanet.s', '2022-04-25 11:45:47', '2022-04-25 11:45:47'), (NULL, '5', 'test.data2', 'OT1', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:45:47', '2022-04-25 11:45:47'), (NULL, '5', 'test.data2', 'OT2', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:45:47', '2022-04-25 11:45:47'), (NULL, '5', 'test.data2', 'OT3', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:45:47', '2022-04-25 11:45:47'), (NULL, '5', 'test.data2', 'VA', '1500.00', 'thanet.s', 'thanet.s', '2022-04-25 11:45:47', '2022-04-25 11:45:47'), (NULL, '5', 'test.data2', 'TRAVEL', '500.00', 'thanet.s', 'thanet.s', '2022-04-25 11:45:47', '2022-04-25 11:45:47'), (NULL, '5', 'test.data2', 'BONUS', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:45:47', '2022-04-25 11:45:47'), (NULL, '5', 'test.data2', 'EQUIPMENT', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:45:47', '2022-04-25 11:45:47'), (NULL, '5', 'test.data2', 'SSI', '750.00', 'thanet.s', 'thanet.s', '2022-04-25 11:45:47', '2022-04-25 11:45:47'), (NULL, '5', 'test.data2', 'TAX', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:45:47', '2022-04-25 11:45:47'), (NULL, '5', 'test.data2', 'TISCO', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:45:47', '2022-04-25 11:45:47'), (NULL, '5', 'test.data2', 'LATE', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:45:47', '2022-04-25 11:45:47'), (NULL, '5', 'test.data2', 'ABSENT', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:45:47', '2022-04-25 11:45:47'), (NULL, '5', 'test.data2', 'ABSENCE', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:45:47', '2022-04-25 11:45:47'), (NULL, '5', 'test.data2', 'StudentLoan', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:45:47', '2022-04-25 11:45:47');
INSERT INTO `payment_detail` (`payment_detail_id`, `payment_id`, `user_id`, `payment_type_id`, `amount`, `user_update`, `user_create`, `time_create`, `time_update`) VALUES (NULL, '6', 'test.data3', 'SL', '5000.00', 'thanet.s', 'thanet.s', '2022-04-25 11:52:51', '2022-04-25 11:52:51'), (NULL, '6', 'test.data3', 'OT1', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:52:51', '2022-04-25 11:52:51'), (NULL, '6', 'test.data3', 'OT2', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:52:51', '2022-04-25 11:52:51'), (NULL, '6', 'test.data3', 'OT3', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:52:51', '2022-04-25 11:52:51'), (NULL, '6', 'test.data3', 'VA', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:52:51', '2022-04-25 11:52:51'), (NULL, '6', 'test.data3', 'TRAVEL', '1000.00', 'thanet.s', 'thanet.s', '2022-04-25 11:52:51', '2022-04-25 11:52:51'), (NULL, '6', 'test.data3', 'BONUS', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:52:51', '2022-04-25 11:52:51'), (NULL, '6', 'test.data3', 'EQUIPMENT', '1200.00', 'thanet.s', 'thanet.s', '2022-04-25 11:52:51', '2022-04-25 11:52:51'), (NULL, '6', 'test.data3', 'SSI', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:52:51', '2022-04-25 11:52:51'), (NULL, '6', 'test.data3', 'TAX', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:52:51', '2022-04-25 11:52:51'), (NULL, '6', 'test.data3', 'TISCO', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:52:51', '2022-04-25 11:52:51'), (NULL, '6', 'test.data3', 'LATE', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:52:51', '2022-04-25 11:52:51'), (NULL, '6', 'test.data3', 'ABSENT', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:52:51', '2022-04-25 11:52:51'), (NULL, '6', 'test.data3', 'ABSENCE', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:52:51', '2022-04-25 11:52:51'), (NULL, '6', 'test.data3', 'StudentLoan', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:52:51', '2022-04-25 11:52:51');
INSERT INTO `payment_detail` (`payment_detail_id`, `payment_id`, `user_id`, `payment_type_id`, `amount`, `user_update`, `user_create`, `time_create`, `time_update`) VALUES (NULL, '7', 'test.data4', 'SL', '20000.00', 'thanet.s', 'thanet.s', '2022-04-25 11:58:02', '2022-04-25 11:58:02'), (NULL, '7', 'test.data4', 'OT1', '1000.00', 'thanet.s', 'thanet.s', '2022-04-25 11:58:02', '2022-04-25 11:58:02'), (NULL, '7', 'test.data4', 'OT2', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:58:02', '2022-04-25 11:58:02'), (NULL, '7', 'test.data4', 'OT3', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:58:02', '2022-04-25 11:58:02'), (NULL, '7', 'test.data4', 'VA', '1500.00', 'thanet.s', 'thanet.s', '2022-04-25 11:58:02', '2022-04-25 11:58:02'), (NULL, '7', 'test.data4', 'TRAVEL', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:58:02', '2022-04-25 11:58:02'), (NULL, '7', 'test.data4', 'BONUS', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:58:02', '2022-04-25 11:58:02'), (NULL, '7', 'test.data4', 'EQUIPMENT', '1200.00', 'thanet.s', 'thanet.s', '2022-04-25 11:58:02', '2022-04-25 11:58:02'), (NULL, '7', 'test.data4', 'SSI', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:58:02', '2022-04-25 11:58:02'), (NULL, '7', 'test.data4', 'TAX', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:58:02', '2022-04-25 11:58:02'), (NULL, '7', 'test.data4', 'TISCO', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:58:02', '2022-04-25 11:58:02'), (NULL, '7', 'test.data4', 'LATE', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:58:02', '2022-04-25 11:58:02'), (NULL, '7', 'test.data4', 'ABSENT', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:58:02', '2022-04-25 11:58:02'), (NULL, '7', 'test.data4', 'ABSENCE', '0.00', 'thanet.s', 'thanet.s', '2022-04-25 11:58:02', '2022-04-25 11:58:02'), (NULL, '7', 'test.data4', 'StudentLoan', '1500.00', 'thanet.s', 'thanet.s', '2022-04-25 11:58:02', '2022-04-25 11:58:02');
UPDATE `payment_type` SET `Payment_type_name` = 'ล่วงเวลา 1.5 เท่า\r\n', `description` = NULL WHERE `payment_type`.`payment_type_id` = 'OT1'; UPDATE `payment_type` SET `Payment_type_name` = 'ล่วงเวลา 2 เท่า\r\n\r\n', `description` = NULL WHERE `payment_type`.`payment_type_id` = 'OT2'; UPDATE `payment_type` SET `Payment_type_name` = 'ล่วงเวลา 3 เท่า\r\n', `description` = NULL WHERE `payment_type`.`payment_type_id` = 'OT3'; UPDATE `payment_type` SET `description` = NULL WHERE `payment_type`.`payment_type_id` = 'VA'; UPDATE `payment_type` SET `description` = NULL WHERE `payment_type`.`payment_type_id` = 'TRAVEL'; UPDATE `payment_type` SET `description` = NULL WHERE `payment_type`.`payment_type_id` = 'SSI'; UPDATE `payment_type` SET `description` = NULL WHERE `payment_type`.`payment_type_id` = 'TAX'; UPDATE `payment_type` SET `description` = NULL WHERE `payment_type`.`payment_type_id` = 'TISCO'; UPDATE `payment_type` SET `description` = NULL WHERE `payment_type`.`payment_type_id` = 'StudentLoan';
UPDATE `payment_type` SET `description` = NULL WHERE `payment_type`.`payment_type_id` = 'SL'; UPDATE `payment_type` SET `user_create` = 'thanet.s', `user_update` = 'thanet.s', `time_create` = '2022-04-01 08:58:00', `time_update` = '2022-04-01 08:58:00' WHERE `payment_type`.`payment_type_id` = 'EQUIPMENT'; UPDATE `payment_type` SET `user_create` = 'thanet.s', `user_update` = 'thanet.s', `time_create` = '2022-04-01 08:58:00', `time_update` = '2022-04-01 08:58:00' WHERE `payment_type`.`payment_type_id` = 'ABSENT'; UPDATE `payment_type` SET `user_create` = 'thanet.s', `user_update` = 'thanet.s', `time_create` = '2022-04-01 08:58:00', `time_update` = '2022-04-01 08:58:00' WHERE `payment_type`.`payment_type_id` = 'ABSENCE';
<<<<<<< HEAD

--user_payment_config 6/23/2022 Ryu:
ALTER TABLE `user_payment_config` CHANGE `user_payment_config_id` `user_payment_config_id` BIGINT(20) NOT NULL AUTO_INCREMENT;
UPDATE payment_type SET sequence = '9' WHERE payment_type.payment_type_id = 'SSI';
UPDATE payment_type SET system = '0' WHERE payment_type.payment_type_id = 'StudentLoan';




-- 23/06/2022 Tan  Update user:
UPDATE `user` SET `time_create` = NULL, `time_update` = NULL, `password_update` = NULL, `last_login_failed_time` = NULL, `withholding_auto` = '1' WHERE `user`.`id` = 'test.data1';
UPDATE `user` SET `time_create` = NULL, `time_update` = NULL, `password_update` = NULL, `last_login_failed_time` = NULL, `withholding_auto` = '1' WHERE `user`.`id` = 'test.data2';
UPDATE `user` SET `time_create` = NULL, `time_update` = NULL, `password_update` = NULL, `last_login_failed_time` = NULL, `withholding_auto` = '0' WHERE `user`.`id` = 'test.data3';
UPDATE `user` SET `time_create` = NULL, `time_update` = NULL, `password_update` = NULL, `last_login_failed_time` = NULL, `withholding_auto` = '1' WHERE `user`.`id` = 'test.data4';
>>>>>>> 3664aca851ce5d357eb68e3a6215cd7ed9271381


-- UAT - 2022 Jun 29 by BONN --

delete from payment_type;

INSERT INTO `payment_type` VALUES('LATE', 'มาสาย', '0', '0', 12, '0', 'thanet.s', 'thanet.s', NULL, '2022-04-01 01:58:00', '2022-04-01 01:58:00');
INSERT INTO `payment_type` VALUES('ABSENT', 'ขาดงาน\r\n', '0', '0', 13, '0', 'thanet.s', 'thanet.s', NULL, '2022-04-01 01:58:00', '2022-04-01 01:58:00');
INSERT INTO `payment_type` VALUES('BONUS', 'โบนัส', '1', '0', 7, '0', 'thanet.s', 'thanet.s', NULL, '2022-04-01 01:58:00', '2022-04-01 01:58:00');
INSERT INTO `payment_type` VALUES('EQUIPMENT', 'เบิกค่าอุปกรณ์\r\n', '1', '0', 8, '1', 'thanet.s', 'thanet.s', NULL, '2022-04-01 01:58:00', '2022-04-01 01:58:00');
INSERT INTO `payment_type` VALUES('LATE', 'มาสาย', '0', '0', 12, '0', 'thanet.s', 'thanet.s', NULL, '2022-04-01 01:58:00', '2022-04-01 01:58:00');
INSERT INTO `payment_type` VALUES('OT1', 'ล่วงเวลา 1.5 เท่า\r\n', '1', '0', 2, '0', 'thanet.s', 'thanet.s', NULL, '2022-04-01 01:58:00', '2022-04-01 01:58:00');
INSERT INTO `payment_type` VALUES('OT2', 'ล่วงเวลา 2 เท่า\r\n\r\n', '1', '0', 3, '0', 'thanet.s', 'thanet.s', NULL, '2022-04-01 01:58:00', '2022-04-01 01:58:00');
INSERT INTO `payment_type` VALUES('OT3', 'ล่วงเวลา 3 เท่า\r\n', '1', '0', 4, '0', 'thanet.s', 'thanet.s', NULL, '2022-04-01 01:58:00', '2022-04-01 01:58:00');
INSERT INTO `payment_type` VALUES('TISCO', 'กองทุนสำรองเลี้ยงชีพ', '0', '0', 11, '1', 'thanet.s', 'thanet.s', NULL, '2022-04-01 01:58:00', '2022-04-01 01:58:00');
INSERT INTO `payment_type` VALUES('SL', 'เงินเดือน', '1', '0', 1, '0', 'thanet.s', 'thanet.s', NULL, '2022-04-01 01:58:00', '2022-04-01 01:58:00');
INSERT INTO `payment_type` VALUES('SSI', 'ประกันสังคม', '0', '0', 9, '0', 'thanet.s', 'thanet.s', NULL, '2022-04-01 01:58:00', '2022-04-01 01:58:00');
INSERT INTO `payment_type` VALUES('StudentLoan', 'กยศ', '0', '0', 15, '1', 'thanet.s', 'thanet.s', NULL, '2022-04-01 01:58:00', '2022-04-01 01:58:00');
INSERT INTO `payment_type` VALUES('TAX', 'ภาษีหัก ณ ที่จ่าย', '0', '0', 10, '0', 'thanet.s', 'thanet.s', NULL, '2022-04-01 01:58:00', '2022-04-01 01:58:00');
INSERT INTO `payment_type` VALUES('TRAVEL', 'เบิกค่าเดินทาง', '1', '0', 6, '1', 'thanet.s', 'thanet.s', NULL, '2022-04-01 01:58:00', '2022-04-01 01:58:00');
INSERT INTO `payment_type` VALUES('VA', 'เบี้ยขยัน', '1', '0', 5, '1', 'thanet.s', 'thanet.s', NULL, '2022-04-01 01:58:00', '2022-04-01 01:58:00');
INSERT INTO `payment_type` VALUES('ABSENCE', 'ลาไม่รับค่าจ้าง\r\n', '0', '0', 14, '0', 'thanet.s', 'thanet.s', NULL, '2022-04-01 01:58:00', '2022-04-01 01:58:00');

-- ALTER SCRIPT to Add PK

ALTER TABLE `authorized_object`
  ADD PRIMARY KEY (`authorized_object_id`);

ALTER TABLE `authorized_object_group`
  ADD PRIMARY KEY (`authorized_object_group_id`);

ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

ALTER TABLE `employee_type`
  ADD PRIMARY KEY (`employee_type_id`);

ALTER TABLE `expense`
  ADD PRIMARY KEY (`expense_id`);

ALTER TABLE `expense_group`
  ADD PRIMARY KEY (`expense_group_id`);

ALTER TABLE `exp_travel_type`
  ADD PRIMARY KEY (`exp_travel_type_id`);

ALTER TABLE `exp_type`
  ADD PRIMARY KEY (`exp_type_id`);

ALTER TABLE `holiday`
  ADD PRIMARY KEY (`id_date`);

ALTER TABLE `job_site`
  ADD PRIMARY KEY (`id_sitejob`);

ALTER TABLE `leaves`
  ADD PRIMARY KEY (`leave_id`);

ALTER TABLE `leave_type`
  ADD PRIMARY KEY (`leave_type_id`);

ALTER TABLE `leave_user`
  ADD PRIMARY KEY (`leave_id`,`user_id`);

ALTER TABLE `page`
  ADD PRIMARY KEY (`page_id`);

ALTER TABLE `page_group`
  ADD PRIMARY KEY (`page_group_id`);

ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

ALTER TABLE `payment_detail`
  ADD PRIMARY KEY (`payment_detail_id`);

ALTER TABLE `payment_group`
  ADD PRIMARY KEY (`payment_group_id`);

ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`payment_type_id`);

ALTER TABLE `permission`
  ADD PRIMARY KEY (`permission_id`);

ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`);

ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `role_authorized_object`
  ADD PRIMARY KEY (`role_id`,`authorized_object_id`);

ALTER TABLE `sys_role`
  ADD PRIMARY KEY (`sys_role_id`);

ALTER TABLE `sys_user`
  ADD PRIMARY KEY (`sys_user_id`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user_payment_config`
  ADD PRIMARY KEY (`user_payment_config_id`);

ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_id`,`role_id`);

ALTER TABLE `user_salary`
  ADD PRIMARY KEY (`user_salary_id`);

ALTER TABLE `work_hours`
  ADD PRIMARY KEY (`work_hours_id`);

ALTER TABLE `payment`
  MODIFY `payment_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
ALTER TABLE `payment_detail`
  MODIFY `payment_detail_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;
ALTER TABLE `payment_group`
  MODIFY `payment_group_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
ALTER TABLE `user_payment_config`
  MODIFY `user_payment_config_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

  
-- Update user 05/07/2022 Job:
UPDATE `user` SET `department_id` = 'IT', `position_id` = 'SA', `time_create` = NULL, `time_update` = NULL, `password_update` = NULL, `last_login_failed_time` = NULL WHERE `user`.`id` = 'test.data1';

UPDATE `user` SET `department_id` = 'IT', `position_id` = 'SA', `time_create` = NULL, `time_update` = NULL, `password_update` = NULL, `last_login_failed_time` = NULL WHERE `user`.`id` = 'test.data2';

UPDATE `user` SET `department_id` = 'IN', `position_id` = NULL, `time_create` = NULL, `time_update` = NULL, `password_update` = NULL, `last_login_failed_time` = NULL WHERE `user`.`id` = 'test.data3';

UPDATE `user` SET `department_id` = 'AE', `position_id` = 'AE', `time_create` = NULL, `time_update` = NULL, `password_update` = NULL, `last_login_failed_time` = NULL WHERE `user`.`id` = 'test.data4';
