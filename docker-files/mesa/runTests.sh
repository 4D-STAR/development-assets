#!/bin/bash
source $MESASDK_ROOT/bin/mesasdk_init.sh
echo "Cloning libmesac from branch $REPOSITORY/$BRANCH"
git clone --branch $BRANCH $REPOSITORY
cd libmesac
./mk
cp build/install/bin/test_results.xml ~/results
