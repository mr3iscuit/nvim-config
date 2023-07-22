#!/bin/bash

#!/bin/bash

function list_files {
    local dir="$1"
    local indent="${2:-0}"
    local files=()

    while IFS= read -r -d '' file; do
        files+=("$file")
    done < <(find "$dir" -type f -print0)

    for file in "${files[@]}"; do
        printf "==FILE : "
        echo $file
        printf "%${indent}s%s\n" "" "$(cat "$file")"
    done

    local subdirs=()
    while IFS= read -r -d '' subdir; do
        subdirs+=("$subdir")
    done < <(find "$dir" -mindepth 1 -type d -print0)

    for subdir in "${subdirs[@]}"; do
        printf "%${indent}s%s\n" "" "$subdir"
        list_files "$subdir" $((indent + 2))
    done
}

if [ -z "$1" ]; then
    echo "Please provide a directory path."
    exit 1
fi

directory="$1"

if [ ! -d "$directory" ]; then
    echo "Directory '$directory' does not exist."
    exit 1
fi

list_files "$directory"
function list_files {
    local dir="$1"
    local indent="${2:-0}"
    local files=()

    while IFS= read -r -d '' file; do
        files+=("$file")
    done < <(find "$dir" -type f -print0)

    for file in "${files[@]}"; do
        printf "%${indent}s%s\n" "" "$(cat "$file")"
    done

    local subdirs=()
    while IFS= read -r -d '' subdir; do
        subdirs+=("$subdir")
    done < <(find "$dir" -mindepth 1 -type d -print0)

    for subdir in "${subdirs[@]}"; do
        printf "%${indent}s%s\n" "" "$subdir"
        list_files "$subdir" $((indent + 2))
    done
}

if [ -z "$1" ]; then
    echo "Please provide a directory path."
    exit 1
fi

directory="$1"

if [ ! -d "$directory" ]; then
    echo "Directory '$directory' does not exist."
    exit 1
fi

list_files "$directory"
