CREATE DATABASE cfml_its;
\c cfml_its
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    login     varchar(40),
    first_name    varchar(40),
    last_name varchar(40),
    password varchar(40)
);
INSERT INTO users(login, first_name, last_name, password)  VALUES('admin', 'Maria', 'Chubataja', '1234');

CREATE TABLE emergency(
    id SERIAL PRIMARY KEY,
    name varchar(25)
);
INSERT INTO emergency(name) VALUES ('Очень срочно');
INSERT INTO emergency(name) VALUES ('Срочно');
INSERT INTO emergency(name) VALUES ('Несрочно');
INSERT INTO emergency(name) VALUES ('Совсем несрочно');

CREATE TABLE statuses(
    id SERIAL PRIMARY KEY,
    name varchar(25)
);
INSERT INTO statuses(name) VALUES ('Новая');
INSERT INTO statuses(name) VALUES ('Открытая');
INSERT INTO statuses(name) VALUES ('Решенная');
INSERT INTO statuses(name) VALUES ('Закрытая');

CREATE TABLE critical_levels(
    id SERIAL PRIMARY KEY,
    name varchar(25)
);
INSERT INTO critical_levels(name) VALUES ('Авария');
INSERT INTO critical_levels(name) VALUES ('Критичная');
INSERT INTO critical_levels(name) VALUES ('Некритичная');
INSERT INTO critical_levels(name) VALUES ('Запрос на изменение');

CREATE TABLE issues (
    id SERIAL PRIMARY KEY,
    created_timestamp timestamp not null default current_timestamp,
    title     varchar(100),
    description    text,
    user_id integer REFERENCES users,
    state integer REFERENCES statuses default 1,
    emergency integer REFERENCES emergency,
    critical integer REFERENCES critical_levels
);


