#!/bin/bash

# Copyright 2020 Rene Rivera, Sam Darwin
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE.txt or copy at http://boost.org/LICENSE_1_0.txt)

if [ "$DRONE_JOB_UUID" = "b6589fc6ab" ] || [ "$DRONE_JOB_UUID" = "356a192b79" ] || [ "$DRONE_JOB_UUID" = "da4b9237ba" ] || [ "$DRONE_JOB_UUID" = "77de68daec" ] || [ "$DRONE_JOB_UUID" = "1b64538924" ] || [ "$DRONE_JOB_UUID" = "ac3478d69a" ] || [ "$DRONE_JOB_UUID" = "c1dfd96eea" ] || [ "$DRONE_JOB_UUID" = "902ba3cda1" ] || [ "$DRONE_JOB_UUID" = "fe5dbbcea5" ] ; then
    if [ "$DOC" -a \
         "$TRAVIS_REPO_SLUG" = "boostorg/python" -a \
         "$TRAVIS_PULL_REQUEST" = "false" ]; then
      export GH_TOKEN
      .ci/upload_docs.sh
    fi
fi

