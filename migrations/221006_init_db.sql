CREATE TABLE languages (
   id INTEGER PRIMARY KEY AUTOINCREMENT,
   name TEXT NOT NULL,
   creator TEXT,
   year INTEGER NOT NULL,
   version TEXT
);
INSERT INTO languages VALUES (
    1,
    "Python",
    "Guido van Rossum",
    1991,
    "0.9.1"
);