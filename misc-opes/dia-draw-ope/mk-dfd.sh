#! /bin/sh
#
# mk-dfd.sh
# Copyright (C) 2018 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.
#

DFD_DIR="./dia-dfd/"
#ln -s $DFD_DIR/dia-dfd/shapes/*           ~/.dia/shapes/
# for file in $DFD_DIR/dia-dfd/shapes/* ;
    #ln -s $DFD_DIR/dia-dfd/shapes/*           ~/.dia/shapes/
#endfor
ln -s $DFD_DIR/dia-dfd/sheets/dfd.sheet   ~/.dia/sheets/
