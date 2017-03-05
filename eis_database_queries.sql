

create user 'testuser' identified by 'test1234';
GRANT ALL PRIVILEGES ON eis.* TO 'testuser'@'localhost';

CREATE TABLE eis_employee_master (
  emp_id int(11) NOT NULL AUTO_INCREMENT,
  created_by varchar(255) NOT NULL,
  created_date varchar(255) NOT NULL,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  middle_name varchar(255) DEFAULT NULL,
  PRIMARY KEY (emp_id)
);

CREATE TABLE eis_employee_details (
  emp_id int(11) NOT NULL AUTO_INCREMENT,
  date_of_birth varchar(255) NOT NULL,
  date_of_joining varchar(255) DEFAULT NULL,
  role varchar(255) NOT NULL,
  ssn int(11) NOT NULL,
  termination_date varchar(255) DEFAULT NULL,
  PRIMARY KEY (emp_id),
  CONSTRAINT employee_master_emp_id_fk FOREIGN KEY (emp_id) REFERENCES eis_employee_master (emp_id)
);

CREATE TABLE eis_address (
  emp_id int(11) NOT NULL AUTO_INCREMENT,
  address_line1 varchar(255) NOT NULL,
  address_line2 varchar(255) DEFAULT NULL,
  city varchar(255) NOT NULL,
  country varchar(255) NOT NULL,
  state varchar(255) NOT NULL,
  PRIMARY KEY (emp_id),
  CONSTRAINT employee_master_emp_id_fk_address FOREIGN KEY (emp_id) REFERENCES eis_employee_master (emp_id)
);

CREATE TABLE eis_users (
  user_name varchar(15) NOT NULL,
  password varchar(15) NOT NULL,
  role varchar(20) NOT NULL,
  emp_id int(15) NOT NULL,
  enabled int(4) NOT NULL DEFAULT '1',
  created_by varchar(20) NOT NULL,
  created_date varchar(20) NOT NULL,
  PRIMARY KEY (user_name),
  KEY emp_id (emp_id),
  CONSTRAINT eis_users_ibfk_1 FOREIGN KEY (emp_id) REFERENCES eis_employee_master (emp_id)
);
