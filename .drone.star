# Use, modification, and distribution are
# subject to the Boost Software License, Version 1.0. (See accompanying
# file LICENSE.txt)
#
# Copyright Rene Rivera 2020.

# For Drone CI we use the Starlark scripting language to reduce duplication.
# As the yaml syntax for Drone CI is rather limited.
#
#
globalenv={'secure': 'BRNUkxN3p8f+uYKWC3Hr0VPqZA0PxbWr1DJlcI4hbiZtzKhMCWjDmd9UW9CzzexqeOxpd+9s0G87qvOur+wMSVxugDxtTesZrh1czXHeSVxgQrYD783XJtQJ9aYypbChkiboRD6Xpmbq7itwMuHBJMFtCuDxMynpU1jWwkyTf2Y='}
linuxglobalimage="cppalliance/droneubuntu1804:1"
windowsglobalimage="cppalliance/dronevs2019"

def main(ctx):
  return [
  linux_cxx("CXX=g++ PYTHON=python CXXFLAGS=-std=c++98 Job 0", "g++", packages="gcc g++ clang pypy3-dev python3-pip python-numpy python-sphinx python3-dev python3-numpy libboost-all-dev xsltproc docbook-xsl python-docutils", sources=" pypy", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'CXX': 'g++', 'PYTHON': 'python', 'CXXFLAGS': '-std=c++98', 'DRONE_JOB_UUID': 'b6589fc6ab'}, globalenv=globalenv),
  linux_cxx("CXX=g++ PYTHON=python CXXFLAGS=-std=c++11 Job 1", "g++", packages="gcc g++ clang pypy3-dev python3-pip python-numpy python-sphinx python3-dev python3-numpy libboost-all-dev xsltproc docbook-xsl python-docutils", sources=" pypy", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'CXX': 'g++', 'PYTHON': 'python', 'CXXFLAGS': '-std=c++11', 'DRONE_JOB_UUID': '356a192b79'}, globalenv=globalenv),
  linux_cxx("CXX=g++ PYTHON=python3 CXXFLAGS=-std=c++98 Job 2", "g++", packages="gcc g++ clang pypy3-dev python3-pip python-numpy python-sphinx python3-dev python3-numpy libboost-all-dev xsltproc docbook-xsl python-docutils", sources=" pypy", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'CXX': 'g++', 'PYTHON': 'python3', 'CXXFLAGS': '-std=c++98', 'DRONE_JOB_UUID': 'da4b9237ba'}, globalenv=globalenv),
  linux_cxx("CXX=g++ PYTHON=python3 CXXFLAGS=-std=c++11 Job 3", "g++", packages="gcc g++ clang pypy3-dev python3-pip python-numpy python-sphinx python3-dev python3-numpy libboost-all-dev xsltproc docbook-xsl python-docutils", sources=" pypy", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'CXX': 'g++', 'PYTHON': 'python3', 'CXXFLAGS': '-std=c++11', 'DRONE_JOB_UUID': '77de68daec'}, globalenv=globalenv),
  linux_cxx("CXX=clang++ PYTHON=python3 CXXFLAGS=-std=c++9 Job 4", "clang++", packages="gcc g++ clang pypy3-dev python3-pip python-numpy python-sphinx python3-dev python3-numpy libboost-all-dev xsltproc docbook-xsl python-docutils", sources=" pypy", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'CXX': 'clang++', 'PYTHON': 'python3', 'CXXFLAGS': '-std=c++98', 'DRONE_JOB_UUID': '1b64538924'}, globalenv=globalenv),
  linux_cxx("CXX=clang++ PYTHON=python3 CXXFLAGS=-std=c++1 Job 5", "clang++", packages="gcc g++ clang pypy3-dev python3-pip python-numpy python-sphinx python3-dev python3-numpy libboost-all-dev xsltproc docbook-xsl python-docutils", sources=" pypy", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'CXX': 'clang++', 'PYTHON': 'python3', 'CXXFLAGS': '-std=c++11', 'DRONE_JOB_UUID': 'ac3478d69a'}, globalenv=globalenv),
  linux_cxx("CXX=g++ PYTHON=pypy3 CXXFLAGS=-std=c++11 Job 6", "g++", packages="gcc g++ clang pypy3-dev python3-pip python-numpy python-sphinx python3-dev python3-numpy libboost-all-dev xsltproc docbook-xsl python-docutils", sources=" pypy", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'CXX': 'g++', 'PYTHON': 'pypy3', 'CXXFLAGS': '-std=c++11', 'DRONE_JOB_UUID': 'c1dfd96eea'}, globalenv=globalenv),
  osx_cxx("CXX=clang++ PYTHON=python CXXFLAGS=-std=c++11 Job 7", "clang++", packages="", buildtype="boost", buildscript="drone", environment={'CXX': 'clang++', 'PYTHON': 'python', 'CXXFLAGS': '-std=c++11', 'DRONE_JOB_UUID': '902ba3cda1'}, globalenv=globalenv),
  linux_cxx("PYTHON=python DOC=1 Job 8", "g++", packages="gcc g++ clang pypy3-dev python3-pip python-numpy python-sphinx python3-dev python3-numpy libboost-all-dev xsltproc docbook-xsl python-docutils", sources=" pypy", buildtype="boost", buildscript="drone", image=linuxglobalimage, environment={'PYTHON': 'python', 'DOC': '1', 'DRONE_JOB_UUID': 'fe5dbbcea5'}, globalenv=globalenv),
    ]

# from https://github.com/boostorg/boost-ci
load("@boost_ci//ci/drone/:functions.star", "linux_cxx","windows_cxx","osx_cxx","freebsd_cxx")
