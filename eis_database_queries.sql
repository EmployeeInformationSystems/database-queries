create user 'testuser' identified by 'test1234';
GRANT ALL PRIVILEGES ON eis.* TO 'testuser'@'localhost';

CREATE TABLE eis_employee_master (
  emp_id int(15) NOT NULL,
  first_name varchar(20) NOT NULL,
  middle_name varchar(20) NOT NULL,
  last_name varchar(20) NOT NULL,
  created_by varchar(20) NOT NULL,
  created_date varchar(20) NOT NULL,
  PRIMARY KEY (emp_id)
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