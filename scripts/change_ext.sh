#!/bin/sh

for f in $1/*.jpg; do 
    mv -- "$f" "${f%.jpg}.png"
done