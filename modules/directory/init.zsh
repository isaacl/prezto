#
# Sets directory options and defines directory aliases.
#
# Authors:
#   James Cox <james@imaj.es>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Options
#

setopt AUTO_CD              # Auto changes to a directory without typing cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt MULTIOS              # Write to multiple descriptors.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
unsetopt CLOBBER            # Do not overwrite existing files with > and >>.
                            # Use >! and >>! to bypass.

#
# Aliases
#

if ! zstyle -t ':prezto:module:directory:alias' skip; then
  alias -- -='cd -'
  alias d='dirs -v'
  for index ({1..9}) alias "$index"="cd +${index}"; unset index
  alias_str=".."
  cmd_str="cd .."
  for index ({1..15}); do
    alias_str+="."
    cmd_str+="/.."
    alias "$alias_str=$cmd_str";
  done
  unset index alias_str cmd_str
fi
