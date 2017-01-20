#!/usr/bin/env bash

set -e

THEMES=(
	ePapirus
	Papirus
	PapirusDark
)

for theme in "${THEMES[@]}"; do
	echo "=> Generate $theme ..."
	find "$theme" -type f -name '*.svg' | while read file; do
		dest_file="${file//.svg/.png}"
		echo "Convert $file -> $dest_file"
		rsvg-convert -f png "$file" -o "$dest_file"
	done
done
