#!/bin/bash
all_pokemon=$(curl -sL https://pokeapi.co/api/v2/pokemon?limit=14000 | jq ".results[].name" -r)
for pokemon in $all_pokemon; do
echo "the name of the pokemon is : $pokemon"
done