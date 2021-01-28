#!/bin/bash

# Copyright 2020 Rene Rivera, Sam Darwin
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE.txt or copy at http://boost.org/LICENSE_1_0.txt)

set -e
export TRAVIS_BUILD_DIR=$(pwd)
export DRONE_BUILD_DIR=$(pwd)
export TRAVIS_BRANCH=$DRONE_BRANCH
export VCS_COMMIT_ID=$DRONE_COMMIT
export GIT_COMMIT=$DRONE_COMMIT
export REPO_NAME=$DRONE_REPO
export PATH=~/.local/bin:/usr/local/bin:$PATH

if [ "$DRONE_JOB_BUILDTYPE" == "boost" ]; then

echo '==================================> INSTALL'

if [ ! -d $HOME/Boost/tools/boostbook ]; then
  echo "rebuilding Boost prerequisites."
  wget https://sourceforge.net/projects/boost/files/boost/1.66.0/boost_1_66_0.tar.gz/download
  tar xf download
  pushd boost_1_66_0
  ./bootstrap.sh
  ./b2 tools/bcp
  mkdir -p $HOME/Boost
  # Install Boost.Python prerequisites, but not Boost.Python itself.
  dist/bin/bcp python tools/boostbook tools/quickbook $HOME/Boost &> /dev/null
  rm -rf $HOME/Boost/boost/python*
  popd
else
  echo "using cached Boost prerequisites."
fi
# Install Faber, the build tool.
python3 -m pip install setuptools
python3 -m pip install faber
#date=2020-08-01
#wget https://github.com/stefanseefeld/faber/archive/snapshot/$date.tar.gz
#tar xf $date.tar.gz
#pushd faber-snapshot-$date
#sudo python3 setup.py install
#popd

echo '==================================> BEFORE_SCRIPT'

. $DRONE_BUILD_DIR/.drone/before-script.sh

echo '==================================> SCRIPT'

if [ "$DOC" ]; then
  BOOST_ROOT=$HOME/Boost faber --builddir=build doc.html
else
  faber --with-boost-include=$HOME/Boost --builddir=build test.report cxx.name=$CXX cxxflags=$CXXFLAGS -j8
fi

echo '==================================> AFTER_SUCCESS'

. $DRONE_BUILD_DIR/.drone/after-success.sh

fi
