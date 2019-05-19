#
# Docker configuration creating an image based on `circleci/rust` with
# RenderDoc installed from the `unstable` Debian repository.
#

FROM circleci/rust:1.34.2

RUN \
    echo 'deb http://ftp.debian.org/debian unstable main contrib non-free' >> /etc/apt/sources.list && \
    apt -y update && \
    apt -y install --no-install-recommends unstable/renderdoc && \
    apt -y clean
