create user 'testuser' identified by 'test1234';
GRANT ALL PRIVILEGES ON eis.* TO 'testuser'@'localhost';

CREATE TABLE eis_employee (emp_id varchar(11) NOT NULL,first_name varchar(10) NOT NULL,last_name varchar(10) NOT NULL,created_date date,   created_by varchar(10),PRIMARY KEY (emp_id) );

CREATE TABLE eis_login (user_name varchar(10) NOT NULL, password varchar(10) NOT NULL, created_date date, created_by varchar(10),   PRIMARY KEY (user_name) );