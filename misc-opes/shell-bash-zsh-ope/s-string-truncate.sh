#! /bin/sh
#
# s-string-truncate.sh
# Copyright (C) 2017 crane <crane@crane-pc>
#
# Distributed under terms of the MIT license.

# replace
${parameter//substring/replacement}     # example ${PATH//:/\\n}


# remove(prefix + suffix)
${parameter##remove_matching_prefix}
${parameter%%remove_matching_suffix}


# Indexed substring expansion (special behaviours with negative offsets, and, in newer Bashes, negative lengths):
${parameter:offset}
${parameter:offset:length}
${parameter:offset:length}


# And of course, the much useful expansions that operate on whether the parameter is null:
${parameter:+use this if param is NOT null}
${parameter:-use this if param is null}
${parameter:=use this and assign to param if param is null}
${parameter:?show this error if param is null}
