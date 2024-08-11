#!/bin/bash

pipx ensurepath
export DISPLAY=:1
/usr/bin/Xvfb ${DISPLAY} -screen 0 1024x768x24 &
x11vnc -forever -nopw &
/bin/bash
