# RenderDoc Rust CircleCI Dockerfile

Base Docker image used to build and test [renderdoc-rs] in [CircleCI].

[CircleCI]: https://circleci.com/

This image is based on [circleci/rust] with the [RenderDoc] package installed
from the Debian `unstable` repository.

[RenderDoc]: http://renderdoc.org/

## Deploying a new version

1. Commit the desired changes.
2. Merge the changes into `master`.
3. New image will be automatically generated, tested, and pushed to Docker Hub.
4. Switch to the [renderdoc-rs] repository and update the `.circleci/config.yml`
   to point to the new tag, if necessary.

[renderdoc-rs]: https://github.com/ebkalderon/renderdoc-rs

## Versioning

The tag names used for this image are taken from the underlying [circleci/rust]
image that this image is based on. For example, if the container is updated to
use `circleci/rust:1.34.2` as a base, for example, then a container named
`ebkalderon/renderdoc-rs-circleci:1.34.2` will be deployed.

[circleci/rust]: https://hub.docker.com/r/circleci/rust/

## License

`renderdoc-rs-circleci-dockerfile` is free and open source software distributed
under the terms of the [MIT](LICENSE).
