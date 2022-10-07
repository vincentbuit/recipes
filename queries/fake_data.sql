INSERT INTO tag (name) VALUES 
    ( "Vegetarisch" ),
    ( "Italiaans" );

INSERT INTO ingredient (name, unit) VALUES 
    ( "Rijst", "gram" ),
    ( "Ei", null ),
    ( "Bloem", "gram" ),
    ( "Tomaten", null );

INSERT INTO recipe (name, category_id, prep_time, cook_time, servings, intro, description, rating, source) VALUES 
    ( "Pannenkoeken", 3, 5, 30, 1, "intro", "description", 5, "source" ),
    ( "Pasta", 2, 15, 20, 1, "intro", "description", 3.5, "source" );

INSERT INTO tag_mapping VALUES 
    ( 1, 1 ),
    ( 1, 2 ),
    ( 2, 2 );

INSERT INTO recipe_ingredient VALUES 
    ( 1, 2, 4, 1 ),
    ( 1, 3, 500, 1 ),
    ( 2, 1, 500, 1 ),
    ( 2, 4, 8, 1 );
