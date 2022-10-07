CREATE TABLE category (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT NOT NULL
);

CREATE TABLE tag (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE tag_mapping (
    recipe_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL
);

CREATE TABLE ingredient (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    unit TEXT
);

CREATE TABLE recipe_ingredient (
    recipe_id INTEGER NOT NULL,
    ingredient INTEGER,
    amount REAL CHECK(amount > 0),
    scaling REAL CHECK(scaling > 0),
    FOREIGN KEY(ingredient) REFERENCES ingredient(id)
);

CREATE TABLE recipe (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT NOT NULL,
    category_id INTEGER,
    prep_time INTEGER,
    cook_time INTEGER,
    servings INTEGER NOT NULL,
    intro TEXT,
    description TEXT,
    rating REAL CHECK(rating >= 0 AND rating <= 5),
    source TEXT,
    FOREIGN KEY(category_id) REFERENCES category(id)
);

INSERT INTO category (name) VALUES 
    ( "Ontbijt" ),
    ( "Lunch" ),
    ( "Diner" ),
    ( "Toetje" );
