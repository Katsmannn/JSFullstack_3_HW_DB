CREATE TABLE users (
    id      serial  PRIMARY KEY,
    name    varchar NOT NULL,
    email   varchar UNIQUE,
    phone   varchar
);

CREATE TABLE task_statuses (
    id            serial PRIMARY KEY,
    name          varchar NOT NULL UNIQUE,
    description   text
);

CREATE TABLE tasks (
    id          serial PRIMARY KEY,
    user_id     int NOT NULL REFERENCES users (id),
    status_id   int NOT NULL REFERENCES task_statuses (id),
    title       varchar,
    description text,
    start       timestamp DEFAULT CURRENT_TIMESTAMP,
    close       timestamp
);