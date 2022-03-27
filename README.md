# debuntu-dev
Containerized script to produce a dev build of I2P for all supported architectures.
I use a lot of Debian based systems and coordinating updates between them is
sometimes an issue.

These are built on an as-needed basis. The process is essentially designed to be
fire and forget, and if things fail, the right response is to upload the log so
we can see why. Not all packages will be available at all times but stable,
oldstable, LTS, and usually testing will work.

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