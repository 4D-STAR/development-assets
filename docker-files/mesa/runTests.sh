#!/bin/bash
source $MESASDK_ROOT/bin/mesasdk_init.sh
echo "Cloning libmesac from branch $BRANCH"
git clone --branch $BRANCH https://github.com/4D-STAR/libmesac.git
cd libmesac
./mk
