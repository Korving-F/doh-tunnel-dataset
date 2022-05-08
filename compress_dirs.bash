#!/bin/env bash
shopt -s dotglob
find * -prune -type d | while IFS= read -r d; do 
    echo "$d"
    tar -cvzf "$d"_full_dataset.tar.gz "$d"
    mv "$d"_full_dataset.tar.gz "$d"
done