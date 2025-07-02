SASSC = sassc -t expanded

GTK30_DEPS = gtk-3.0/apps/ gtk-3.0/common/ gtk-3.0/widgets/ common/
BUILD_DIRS = gnome-shell/ common/ gtk-3.0/

.PHONY: all
all: gtk-3.0/gtk.css gtk-3.0/gtk-dark.css gnome-shell/gnome-shell.css 

gtk-3.0/gtk.css: gtk-3.0/gtk.scss $(GTK30_DEPS)
	$(SASSC) $< $@

gtk-3.0/gtk-dark.css: gtk-3.0/gtk-dark.scss $(GTK30_DEPS)
	$(SASSC) $< $@

gnome-shell/gnome-shell.css: gnome-shell/gnome-shell.scss gnome-shell/assets/
	$(SASSC) $< $@

# gnome-shell/: gnome-shell/gnome-shell.css

deb-package: debian/ 
	./build_deb_package.sh
