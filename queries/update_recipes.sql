UPDATE recipe
SET name = "Pannenkoeken", 
    category_id = 3,
    prep_time = 5,
    cook_time = 30,
    servings = 1,
    intro = "intro",
    description = "description",
    rating = 5,
    source = "source"
WHERE
    id = 1;
