# *****************************************************************
# (C) Copyright IBM Corp. 2023. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# *****************************************************************
#!/bin/bash

set -vex

source open-ce-common-utils.sh


cd $SRC_DIR
patch -p1 < $RECIPE_DIR/0001-Fix-resnet50_tf-tests-in-FIPS-mode.patch
wheel pack $SRC_DIR

$PYTHON -m pip install -vv keras-${PKG_VERSION}-py2.py3-none-any.whl
