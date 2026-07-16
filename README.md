# Molasses' C Template
[![Ko-Fi](https://img.shields.io/badge/donate-kofi-blue?style=for-the-badge&logo=ko-fi&color=e57578&logoColor=FFFFFF&labelColor=262a35)](https://ko-fi.com/molasses)
[![Patreon](https://img.shields.io/badge/donate-patreon-blue?style=for-the-badge&logo=patreon&color=e57578&logoColor=FFFFFF&labelColor=262a35)](https://www.patreon.com/molasseslover)

This is a simple codebase you may want to use as a base for your project. This
project sets up a reproducible build system, statically linked against the
[`musl`](https://en.wikipedia.org/wiki/Musl) C standard library implementation.
Builds are handled through [CMake](https://cmake.org/), which is also 
abstracted through and packaged with a [Nix](https://nixos.org/) 
[*Flake*](https://wiki.nixos.org/wiki/Flakes), providing reproducible build 
environments and a reproducible environment to run the built binary from.

# Features
- CMake support.
- Reproducible builds.
    - Reproducible build and runtime environment.
        - Nix support (packaged as a Nix Flake.)
    - Fully statically linked.
        - Linked against `musl`.

## License
This project is licensed under the 
[3-Clause BSD License](https://opensource.org/license/bsd-3-clause), 
as described in the [`LICENSE.md`](LICENSE.md) file.