#!/usr/bin/env bash

set -euxo pipefail

uncrustify --no-backup -c uncrustify.cfg src/*.c include/*.h
shfmt --write misc/integration/tasks/*.sh
