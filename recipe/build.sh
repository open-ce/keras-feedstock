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

DEST_DIR=$SRC_DIR/keras_pkg
mkdir -p $DEST_DIR
cd $SRC_DIR/keras/tools/pip_package

python setup.py bdist_wheel --universal --project_name keras
cp dist/* ${DEST_DIR}

echo $(date) : "=== Output wheel file is in: ${DEST_DIR}"
# install using pip from the whl file
pip install --no-deps $DEST_DIR/keras*.whl

