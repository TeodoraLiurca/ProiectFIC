#!/bin/bash

sourceDirectory="/Users/grozavklaus/UNI-THINGS/FUNDAMENTE DE CALCULATOARE/ProiectFIC/IAS_MACHINE_APP"
destinationDirectory="/Users/grozavklaus/UNI-THINGS/FUNDAMENTE DE CALCULATOARE/ProiectFIC/TESTING_SIDE"

rsync -av --delete --exclude='*_tb.v' "$sourceDirectory/" "$destinationDirectory"

echo "Content copied from $sourceDirectory to $destinationDirectory"

