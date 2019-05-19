#!/usr/bin/env bash

cat <<EOF
#
# Docker configuration creating an image based on \`circleci/rust\` with
# RenderDoc installed from the \`unstable\` Debian repository.
#

FROM circleci/rust:${IMAGE_TAG:-latest}

# Install 'renderdoc' on top of base image
RUN \\
    echo 'deb http://ftp.debian.org/debian unstable main contrib non-free' | sudo tee /etc/apt/sources.list.d/unstable.list > /dev/null && \\
    sudo apt-get -y update && \\
    sudo apt-get -y install --no-install-recommends -t unstable renderdoc && \\
    sudo apt-get -y clean

# Install 'bats' for testing Docker container
RUN \\
    cd ~ && \\
    git clone https://github.com/sstephenson/bats.git ~/bats && \\
    cd ~/bats && \\
    sudo ./install.sh /usr/local && \\
    cd - && \\
    rm -rf ~/bats

# Install dependencies for 'scripts/tap-to-junit.sh'
RUN \\
    sudo perl -MCPAN -e 'install TAP::Parser' && \\
    sudo perl -MCPAN -e 'install XML::Generator'

ENV DISPLAY :99

CMD ["/bin/sh"]
EOF
