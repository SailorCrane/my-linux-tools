/*
 * person.sql
 * Copyright (C) 2018 crane <crane@crane-pc>
 *
 * Distributed under terms of the MIT license.
 */

use mysql;

CREATE TABLE person (
     id INT NOT NULL AUTO_INCREMENT,
     name CHAR(30) NOT NULL,
     age INT NOT NULL,
     PRIMARY KEY (id)
);

-- show create table person;  -- 查看创建'person' table的sql语句
