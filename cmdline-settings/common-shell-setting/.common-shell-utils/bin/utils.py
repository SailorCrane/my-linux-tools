#! /usr/bin/env python
# -*- coding: utf-8 -*-


from __future__ import print_function
import sys


class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'

    ENDC = '\033[0m'

    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


def _color_print(msg, color, file=None):
    if not file:
        file = sys.stdout
    print(color + msg + bcolors.ENDC, file=file)

def warn_print(msg):
    ''' to stderr'''
    return _color_print(msg, bcolors.WARNING, file=sys.stderr)

def fail_print(msg):
    ''' to stderr'''
    return _color_print(msg, bcolors.FAIL, file=sys.stderr)

def ok_print(msg):
    return _color_print(msg, bcolors.OKBLUE)

def param_need(argv, num, error_msg):
    if len(argv) - 1 < num:
        fail_print(error_msg)
        return False
    return True


def main():
    print("start main")
    warn_print("name {}".format('Crane'))
    fail_print("name {}".format('Crane'))
    ok_print("name {}".format('Crane'))


if __name__ == "__main__":
    main()
