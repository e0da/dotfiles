# (c) Zygmunt Krynicki 2007,
# Licensed under GPL, see COPYING for the whole text
#
# Modified by Justin Force, 2018, released under the same license.
# Original location: /etc/zsh_command_not_found
#
# This script will look-up command in the database and suggest
# installation of packages available from the repository
if [[ -x /usr/lib/command-not-found ]] ; then
	if (( ! ${+functions[command_not_found_handler]} )) ; then
		function command_not_found_handler {
			[[ -x /usr/lib/command-not-found ]] || return 1

      # XXX --no-failure-msg is not correct for zsh integration. I don't know
      # why they did this.
			# /usr/lib/command-not-found --no-failure-msg -- ${1+"$1"} && :
			/usr/lib/command-not-found -- ${1+"$1"} && :
		}
	fi
fi
