# debuntu-dev
Containerized script to produce a dev build of I2P for all supported architectures.
I use a lot of Debian based systems and coordinating updates between them is
sometimes an issue.

To use it, install Docker, add yourself to the docker group, restart your shell and
run

`make`.

Then wait. It will generate containers, update them, installl dependencies, and build
I2P a total of 7 times.

If you have API keys, `gothub` or `github-release` aliased to `gothub`, and figure
Microsoft can afford it, run:

`make github-mad`

to upload your dev packages to github when you're done. If you want to use my builds,
you can grab them at the [github releases page](https://github.com/eyedeekay/debuntu-dev/releases).

Logs are uploaded with each build. They can be viewed below.