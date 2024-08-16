#!/bin/bash
# Generate a Debian package for the GNOME Theme

if [[ -z "$maintainer_name" ]]; then
	maintainer_name="Maximilian Weigand"
fi

if [[ -z "$maintainer_email" ]]; then
	maintainer_email="mweigand@mweigand.net"
fi

cd "${0%/*}"

name="PNEink"
version="1.0"
description="A Gnome Theme for the Pine64 Pinenote Eink tablet"

declare -a arches=("all")

install -d "$name"/usr/share/themes/"${name}"

cp -r gnome-shell "$name"/usr/share/themes/"${name}"/
cp -r common "$name"/usr/share/themes/"${name}"/
cp -r gtk-3.0 "$name"/usr/share/themes/"${name}"/

for arch in ${arches[@]}; do
	mkdir "$name"/DEBIAN

	echo "Package: $name
Version: $(echo $version | sed 's/v//')
Architecture: $arch
Maintainer: $maintainer_name <$maintainer_email>
Description: $description
Section: misc
Priority: extra" | tee "$name"/DEBIAN/control

	dpkg-deb -Z xz -b "$name"/ .

	# mv *.deb ../

	rm -rf "$name"/DEBIAN
done

rm -r "${name}"
