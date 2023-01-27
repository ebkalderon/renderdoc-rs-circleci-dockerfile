# _This repository has been archived since `renderdoc-rs` switched to GitHub Actions (ebkalderon/renderdoc-rs#135)._

# RenderDoc Rust CircleCI Dockerfile

[![Build Status][s1]][cc] [![Docker Hub][s2]][dh]

[s1]: https://circleci.com/gh/ebkalderon/renderdoc-rs-circleci-dockerfile.svg?style=shield
[cc]: https://circleci.com/gh/ebkalderon/renderdoc-rs-circleci-dockerfile
[s2]: https://img.shields.io/badge/docker%20hub-renderdoc--rs--circleci-blue.svg
[dh]: https://hub.docker.com/r/ebkalderon/renderdoc-rs-circleci

Base Docker images used to build and test [renderdoc-rs] in [CircleCI].

[CircleCI]: https://circleci.com/

These images are based on [circleci/rust] with the [RenderDoc] package installed
from the Debian `unstable` repository.

[RenderDoc]: http://renderdoc.org/

## Building locally

1. Make any desired changes to the [scripts](scripts).
2. Run `./scripts/generate.sh > Dockerfile` to generate the new Dockerfile.
3. `docker build -t ebkalderon/renderdoc-rs-circleci:${rust_version} .`

## Deploying a new version

1. Commit the desired changes.
2. Merge the changes into `master`.
3. New image is automatically generated, tested, and pushed to [Docker Hub].
4. Switch to the [renderdoc-rs] repository and update the `.circleci/config.yml`
   to point to the new tag, if necessary.

[Docker Hub]: https://hub.docker.com/r/ebkalderon/renderdoc-rs-circleci
[renderdoc-rs]: https://github.com/ebkalderon/renderdoc-rs

## Versioning

The tag names used for this image are taken from the underlying [circleci/rust]
image that this image is based on. For example, if the container is updated to
use `circleci/rust:1.34.2` as a base, for example, then a container named
`ebkalderon/renderdoc-rs-circleci:1.34.2` will be deployed.

[circleci/rust]: https://hub.docker.com/r/circleci/rust/

## License

`renderdoc-rs-circleci-dockerfile` is free and open source software distributed
under the terms of the [MIT License](LICENSE).
