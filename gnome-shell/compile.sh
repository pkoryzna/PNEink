#!/usr/bin/env sh
#    -t, --style NAME        Output style. Can be: nested, expanded, compact, compressed.

sassc \
	--style expanded \
	gnome-shell.scss \
	gnome-shell.css
	# test.css
