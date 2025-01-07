#!/bin/bash

python3 /opt/code/smart_release.py -p $INPUT -o $OUTPUT 

# copy nested output files to working directory
find . -type f -name "*.xlsx" -exec cp {} $WORKDIR \;
find . -type f -name "*.png" -exec cp {} $WORKDIR \;
