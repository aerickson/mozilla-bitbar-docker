#!/bin/bash

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this file,
# You can obtain one at http://mozilla.org/MPL/2.0/.

source ~/.bashrc

echo "ls -la /"
ls -la /
if [[ -e /test ]]; then
    echo "ls -la /test"
    ls -la /test
fi

#entrypoint.py
cd $HOME
# TODO: do envsubst on config file
exec generic-worker run --config /builds/generic-worker/${GENERIC_WORKER_CONF}.yml
