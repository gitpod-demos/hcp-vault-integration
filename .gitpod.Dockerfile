FROM gitpod/workspace-full

RUN brew tap hashicorp/tap
RUN brew install hashicorp/tap/vault

RUN sudo apt-get update && sudo apt-get install -y xdg-utils
