#! /bin/bash

set -ex

export PYTHON=python3

ADAPTERS="cztop rbczmq ffi-rzmq pyzmq"

python3 -m pip install nbconvert jupyter
jupyter kernelspec list

for adapter in $ADAPTERS; do
  export IRUBY_TEST_SESSION_ADAPTER_NAME=$adapter
  bundle exec rake test TESTOPTS=-v
done

ls
nbconvert --version
