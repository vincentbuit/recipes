#!/bin/sh
set -eu
DB="recipes.db"

# FUNCTIONS -------------------------------------------------------------------
die() {
    printf "%s\n" "$1" >&2; exit 1;
}

# SUBCOMMANDS -----------------------------------------------------------------
get_recipes_from_db() {
    RESULT="$(cat ./queries/get_recipes.sql | sqlite3 $DB | fzf-tmux)" 
    ID="$(echo $RESULT | awk -F "|" '{print $1}')"
    QUERY="
        SELECT 
            name, 
            prep_time,
            cook_time,
            servings,
            intro,
            description,
            rating,
            source
        FROM recipe
        WHERE id=${ID}
    "
    echo $QUERY | sqlite3 $DB
}

init_db() {
    cat ./migrations/221006_init_db.sql | sqlite3 $DB
    if [ $# -eq 0 ]
    then
        echo "no arguments were given so no fake data is being generated"
    else
        echo "generating fake data"
        cat ./queries/fake_data.sql | sqlite3 $DB
    fi
}

# MAIN ------------------------------------------------------------------------
case "${1-default}" in
help)
    # Print help message
    echo "Insert the required data into the query files."
    echo "Execute in the following order:"
    echo "- Check whether ingredients are new by simply searching: 'recipes SEARCHNAME'"
    echo "- Add new ingredients, recipes and tags"
    echo "- Lookup ID's of recipes, ingredients and tags using search"
    echo "- Add mapping_ingredient (recipe ingredient with recipe)"
    echo "- Add mapping_tag (recipe with tag)"
    ;;
init)
    # Init DB
    shift;
    init_db "$@"
    ;;
run)
    # Run query
    shift
    if [ $# -eq 0 ]
    then
        echo "please provide query filename without extension"
    else
        echo "executing query"
        QUERY="./queries/${1}.sql"
        cat $QUERY | sqlite3 $DB
    fi
    ;;
*)
    # Get all recipes from db and search
    get_recipes_from_db
    ;;
esac
