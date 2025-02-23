DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS work_schedule;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);

CREATE TABLE employee (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name TEXT NOT NULL,
  middle_name TEXT,
  last_name TEXT NOT NULL,
  email TEXT NOT NULL,
  title TEXT NOT NULL,
  employment_status BOOL NOT NULL,
  FOREIGN KEY (id) REFERENCES user (id),
  FOREIGN KEY (email) REFERENCES user (username)
);

CREATE TABLE work_schedule (
  log INTEGER PRIMARY KEY AUTOINCREMENT,
  employee_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  did_work BOOL NOT NULL,
  pay_sent BOOL NOT NULL,
  FOREIGN KEY (employee_id) REFERENCES employee (id)
);
