CREATE USER repl_user REPLICATION LOGIN PASSWORD '1';

CREATE DATABASE bot_database;

\c bot_database;

CREATE TABLE IF NOT EXISTS emails (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS phone_numbers (
    id SERIAL PRIMARY KEY,
    phone_number VARCHAR(20) UNIQUE NOT NULL
);

INSERT INTO emails (email) VALUES ('test1@example.com'), ('test2@example.com');
INSERT INTO phone_numbers (phone_number) VALUES ('+71234567890'), ('81234567890');
