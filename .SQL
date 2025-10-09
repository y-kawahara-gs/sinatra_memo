CREATE ROLE "user-name" WITH LOGIN PASSWORD 'password';

CREATE DATABASE sinatra_memo;

GRANT ALL PRIVATES ON DATABASE sinatra_memo TO "user-name";
