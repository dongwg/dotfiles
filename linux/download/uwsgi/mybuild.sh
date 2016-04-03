#!/usr/bin/env bash

# To build uwsgi and plugins, need to run make in the source 
# directory.

make clean

# To make the server core without any plugins
make PROFILE=nolang

# To build plugins for multiple versions of python
PYTHON=python3.4 ./uwsgi --build-plugin "plugins/python python34"
PYTHON=python2.7 ./uwsgi --build-plugin "plugins/python python27"

# To build other plugins, ie, psgi, we can use either of the following 
# two ways:
###python uwsgiconfig.py --plugin plugins/psgi core
# or
# PYTHON=python2.7 ./uwsgi --build-plugin "plugins/psgi psgi"

# To take effect of the new binaries, need to restart uswgi emperor. 
# On Debian 8 Jessie, run systemctl restart emperor.uwsgi

