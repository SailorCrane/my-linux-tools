#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2018 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.

"""

"""

import utils
import sys


def main():
    usage = "must input a 'mod_name' as argument\nfor example: __show_mod_file__ datetime"
    if not utils.param_need(sys.argv, 1, usage):
        return -1

    modname = sys.argv[1]
    mod = __import__(modname)
    file_name = mod.__file__
    print(file_name)
    return 0

if __name__ == "__main__":
    exit(main())
