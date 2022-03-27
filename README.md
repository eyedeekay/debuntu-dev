# debuntu-dev
Containerized script to produce a dev build of I2P for all supported architectures.
I use a lot of Debian based systems and coordinating updates between them is
sometimes an issue.

To use it, install Docker, add yourself to the docker group, restart your shell and
run

`make`.

Then wait. It will generate containers, update them, installl dependencies, and build
I2P a total of 7 times.