#! /usr/bin/env sh
#chmod a+rwx -R .
git clone --depth=1 "$GIT_UPSTREAM" -b "$GIT_BRANCH" && \
cd i2p.i2p && \
sed -i 's|dh \$@ --with systemd,bash-completion|dh \$@ --with systemd,bash-completion,quilt|g' debian/rules && \
ant debian-tarball && ant debian