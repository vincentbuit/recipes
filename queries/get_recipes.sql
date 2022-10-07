SELECT
    r.id,
    r.name,
    r.category_id,
    c.name,
    t.name
FROM recipe AS r
LEFT JOIN category AS c
ON r.category_id=c.id
LEFT JOIN tag_mapping AS tm
ON r.id = tm.recipe_id
LEFT JOIN tag AS t
ON tm.tag_id = t.id
