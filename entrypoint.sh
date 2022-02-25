#!/bin/sh

set -e

find /tmp/.git/hooks -type l -exec rm {} \; && find /tmp/.githooks -type f -exec ln -sf ../../{} /tmp/.git/hooks/ \; && echo 'githooks installed'

exec "$@"
