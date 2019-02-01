CREATE TABLE users (
 username TEXT,
 variable TEXT,
 value DOUBLE,
 ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL 
);

-- below are exact copies of users to save games mid-turn or to
-- restore previous turn

CREATE TABLE saved_users (
 username TEXT,
 variable TEXT,
 value DOUBLE,
 ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL 
);

CREATE TABLE turned_users (
 username TEXT,
 variable TEXT,
 value DOUBLE,
 ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL 
);

-- This table only lists land tiles that have been improved in some way

CREATE TABLE land (
 x INT, y INT, variable TEXT, value DOUBLE,
 ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);


-- NOTE: oid is an automatically defined column in SQLite3, but not in MySQL

