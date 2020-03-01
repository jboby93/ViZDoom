#!/bin/bash

# Set DBUILD options to match your needs.
rm CMakeCache.txt

# fix for compiling in pyenv virtual environment
# (https://stackoverflow.com/questions/24174394/cmake-is-not-able-to-find-python-libraries)
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_PYTHON=OFF -DBUILD_PYTHON3=ON -DBUILD_JAVA=OFF -DBUILD_LUA=OFF \
	-DPYTHON_INCLUDE_DIR=$(python -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())")  \
	-DPYTHON_LIBRARY=$(python -c "import distutils.sysconfig as sysconfig; print(sysconfig.get_config_var('LIBDIR'))")