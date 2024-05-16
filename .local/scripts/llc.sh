#!/bin/bash

# Set variable for the ISBN
isbn=$1

# Make a request to the Open Library API
response=$(curl -s "https://openlibrary.org/api/books?bibkeys=ISBN:${isbn}&format=json&jscmd=data")

# Extract the LCC number from the response
lcc=$(echo "$response" | grep -o -e '[A-Z][A-Z][0-9]*\.[A-Z][0-9]*' | head -n1 )

# Print the LCC number
echo "LCC Number: $lcc"
