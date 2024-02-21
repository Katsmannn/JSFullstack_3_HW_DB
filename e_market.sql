CREATE TABLE users (
    id          serial  PRIMARY KEY,
    second_name varchar NOT NULL,
    first_name  varchar,
    birthday    timestamp,
    email       varchar NOT NULL UNIQUE,
    phone       varchar
);

CREATE TABLE departments (
    id          serial PRIMARY KEY,
    name        varchar NOT NULL UNIQUE,
    description text
);

CREATE TABLE positions (
    id          serial PRIMARY KEY,
    name        varchar NOT NULL UNIQUE,
    description text
);

// Сотрудники
CREATE TABLE employees (
    id              serial PRIMARY KEY,
    user_id         int NOT NULL UNIQUE REFERENCES users (id),
    department_id   smallint REFERENCES departments (id),
    position_id     int REFERENCES positions (id),
    work_phone      varchar  
);

// Покупатели
CREATE TABLE customers (
    id              serial PRIMARY KEY,
    user_id         int NOT NULL UNIQUE REFERENCES users (id),
    contact_phone   varchar
);

//Единицы измерения
CREATE TABLE units (
    id      serial PRIMARY KEY,
    name    varchar UNIQUE
);

CREATE TABLE products (
    id      serial PRIMARY KEY,
    code    varchar UNIQUE,
    name    varchar,
    price   numeric,
    unit_id smallint REFERENCES units (id)
);

CREATE TABLE carts (
    id          serial PRIMARY KEY,
    customer_id int REFERENCES customers (id),
    product_id  int REFERENCES products (id),
    amount      smallint CHECK (amount>0),
    UNIQUE (customer_id, product_id)
);

CREATE TABLE orders_statuses (
    id          serial PRIMARY KEY,
    status      varchar NOT NULL UNIQUE,
    description text
);

CREATE TABLE orders (
    id                  serial PRIMARY KEY,
    customer_id         int REFERENCES customers (id),
    employee_id         int REFERENCES employees (id),
    delivery_address    text,
    delivery_date       timestamp NOT NULL,
    status_id           smallint REFERENCES orders_statuses (id),
);

CREATE TABLE orders_products (
    id          serial PRIMARY KEY,
    order_id    REFERENCES orders (id),
    product_id  REFERENCES products (id),
    amount      smallint CHECK (amount>0),
    UNIQUE (customer_id, product_id)
);