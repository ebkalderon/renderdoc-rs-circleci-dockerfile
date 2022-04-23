#!/usr/bin/env bash

cat <<EOF
#
# Docker configuration creating an image based on \`circleci/rust\` with
# RenderDoc installed from the \`unstable\` Debian repository.
#

FROM cimg/rust:${IMAGE_TAG:-latest}

# Install 'renderdoc' on top of base image
RUN \\
    echo 'deb http://deb.debian.org/debian unstable main contrib non-free' | sudo tee /etc/apt/sources.list.d/unstable.list > /dev/null && \\
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138 && \\
    APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9 && \\
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
