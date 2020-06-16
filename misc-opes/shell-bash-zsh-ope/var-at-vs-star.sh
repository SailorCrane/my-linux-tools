#!/bin/bash
#
# var-at-vs-star.sh
# Copyright (C) 2017 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.
#


# A key difference from my POV is that "$@" preserves the original number of arguments.
# It's the only form that does.
# For that reason it is very handy for passing args around with the script.

# For example, if file my_script contains:

   main()
   {
      echo 'MAIN sees ' $# ' args'
   }

   main $*
   main $@

   main "$*"
   main "$@"

   ### end ###

# and I run it like this:

my_script 'a b c' d e
# I will get this output:

# MAIN sees 5 args

# MAIN sees 5 args

# MAIN sees 1 args

# MAIN sees 3 args
