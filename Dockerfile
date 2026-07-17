FROM nixos/nix

RUN nix-channel --update && echo "experimental-features = nix-command flakes" > /etc/nix/nix.conf

COPY ./flake.nix ./flake.lock /program-cache-warmup/
COPY ./misc/nix /program-cache-warmup/misc/nix
COPY ./apps /program-cache-warmup/apps
COPY ./core /program-cache-warmup/core
COPY ./CMakeLists.txt /program-cache-warmup/

WORKDIR /program-cache-warmup/

RUN nix develop && exit

WORKDIR /opt/workdir