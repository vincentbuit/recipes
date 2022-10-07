#!/bin/sh
set -eux

DB="recipes.db"

# FUNCTIONS -------------------------------------------------------------------
die() {
    printf "%s\n" "$1" >&2; exit 1;
}

# SUBCOMMANDS -----------------------------------------------------------------
add_recipe_to_db() {
    echo "test";
    # execute a sql file
}

add_ingredients_to_db() {
    echo "test";
    # execute a sql file
}

delete_ingredients_from_db() {
    echo "test";
    # execute a sql file
}

delete_recipe_db() {
    echo "test";
    # execute a sql file
}

edit_ingredients_from_db() {
    echo "test";
    # execute a sql file
}

edit_recipe_db() {
    echo "test";
    # execute a sql file
}

get_recipes_from_db() {
    echo "test";
    # execute a sql file
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

read_db () {
    sqlite3 $DB "SELECT * FROM recipe;"
}

# MAIN ------------------------------------------------------------------------
case "$1" in
add)
    case "$2" in
    ingredients)
        # Add ingredients
        shift;
        add_ingredients_to_db "$@"
        ;;
    recipe)
        # Add recipe
        shift;
        add_recipe_to_db "$@"
        ;;
    *)
        die "ERROR: unknown command $1"
        ;;
    esac
    ;;
delete)
    case "$2" in
    ingredients)
        # Delete ingredients
        shift;
        delete_ingredients_from_db "$@"
        ;;
    recipe)
        # Delete recipe
        shift;
        delete_recipe_db "$@"
        ;;
    *)
        die "ERROR: unknown command $1"
        ;;
    esac
    ;;
edit)
    case "$2" in
    ingredients)
        # Edit ingredients
        shift;
        edit_ingredients_from_db "$@"
        ;;
    recipe)
        # Edit recipe
        shift;
        edit_recipe_db "$@"
        ;;
    *)
        die "ERROR: unknown command $1"
        ;;
    esac
    ;;
init)
    # Init DB
    shift;
    init_db "$@"
    ;;
*)
    # Get all recipes from db and search
    get_recipes_from_db "$@"
    # lijst met recipes zoekbaar op naam, tags, category, ingredients | fzf
    shift;
    ;;
esac
