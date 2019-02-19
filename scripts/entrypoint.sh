#!/bin/bash

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this file,
# You can obtain one at http://mozilla.org/MPL/2.0/.

set -e

source ~/.bashrc

echo "ls -la /"
ls -la /
if [[ -e /test ]]; then
    echo "ls -la /test"
    ls -la /test
fi

cd $HOME
envsubst < /builds/generic-worker/generic-worker.yml.template > /builds/worker/tmp/generic-worker.yml

# user.Current requires cgo, but cross-compilation doesn't enable cgo
# this works around the issue (see https://github.com/golang/go/issues/14625
# and https://github.com/ksonnet/ksonnet/issues/298)
export USER=root
exec generic-worker run --config /builds/worker/tmp/generic-worker.yml
