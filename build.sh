#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"

declare -a THEMES=(
	ePapirus
	Papirus
	PapirusDark
)

readonly TAB=$'\t'

: "${DEST_DIR:=$SCRIPT_DIR}"
: "${SRC_DIR:=$SCRIPT_DIR/src}"
: "${BUILD_DIR:=$SCRIPT_DIR/build}"

for theme in "${THEMES[@]}"; do
	printf '=> Generate "%s" ...\n' "$theme" >&2

	dest_theme_dir="$DEST_DIR/$theme"
	build_theme_dir="$BUILD_DIR/$theme"

	rm -rf "$build_theme_dir" "$dest_theme_dir"
	mkdir -p "$build_theme_dir" "$dest_theme_dir"

	cp -R "$SRC_DIR"/* "$build_theme_dir"

	case "$theme" in
		ePapirus)
			theme_name="$theme"
			find "$build_theme_dir" -type f -name '*.svg' -exec sed -i \
				-e 's/#dfdfdf/#6e6e6e/gI' \
				-e 's/#4285f4/#4285f4/gI' '{}' \;
			;;
		Papirus)
			theme_name="$theme"
			find "$build_theme_dir" -type f -name '*.svg' -exec sed -i \
				-e 's/#dfdfdf/#444444/gI' \
				-e 's/#4285f4/#4285f4/gI' '{}' \;
			;;
		PapirusDark)
			theme_name="Papirus Dark"
			find "$build_theme_dir" -type f -name '*.svg' -exec sed -i \
				-e 's/#dfdfdf/#dfdfdf/gI' \
				-e 's/#4285f4/#4285f4/gI' '{}' \;
			;;
	esac

	# Create README.txt
	cat > "$dest_theme_dir/README.txt" <<-EOF
	${theme_name} theme for SMPlayer

	Author: Alexey Varfolomeev <https://github.com/varlesh>
	Homepage: https://github.com/PapirusDevelopmentTeam/papirus-smplayer-theme
	License: GPL-3.0
	EOF

	# Convert to bitmap images
	find "$build_theme_dir" -name '*.svg' | while read -r file; do
		bitmap_file="${file//.svg/.png}"

		printf 'Converting "%s" -> "%s"\n' "$file" "$bitmap_file" >&2
		rsvg-convert -f png "$file" -o "$bitmap_file"

		# delete SVG file
		rm -f "$file"
	done

	# Generate <theme>.qrc
	cat > "$BUILD_DIR/$theme.qrc" <<-EOF
	<RCC>
	${TAB}<qresource prefix="/">
	$(for f in "$build_theme_dir"/*.png; do \
		printf "\t\t<file>%s</file>\n" "${f#${BUILD_DIR}/}"; \
	done)
	${TAB}</qresource>
	</RCC>
	EOF

	# Compile <theme>.rcc
	/usr/lib/qt5/bin/rcc -binary "$BUILD_DIR/$theme.qrc" -o "$dest_theme_dir/$theme.rcc"
done
