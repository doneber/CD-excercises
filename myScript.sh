#!/bin/bash
typeset -A config # init array
VBoxManage="/mnt/d/Program\ Files/Oracle/VirtualBox/VBoxManage.exe"
if [ -t 0 ]; then
    echo
  # if [ $# -eq 0 ]; then
  #     echo "No input files specified on command line.  Error." >&2
  # else
  #     echo "Input file given on command line.  It is $1"
  # fi
else
  echo "Good work"
  while read line
  do
      if echo $line | grep -F = &>/dev/null
      then
          varname=$(echo "$line" | cut -d '=' -f 1)
          config[$varname]=$(echo "$line" | cut -d '=' -f 2-)
      fi
  done
fi
case "$1" in
  -h|--help)
    echo "usage: $0"
    echo "        [--help] [--list]"
    echo "        [create < fileConfig] [delete < fileConfig]"
    echo "        [start < fileConfig] [shoutdown < fileConfig]"
    echo
    echo "These are common commands used:"
    echo
    echo "        create < fileNameConfig                   Create a VM with input config file"
    echo "        delete < fileNameConfig                   Delete a VM with input config file"
    exit 0
  ;;
  -l|--list)
    eval $VBoxManage list vms
  ;;
  create)
    if [ -t 0 ]; then
      echo "You need an input config file to CREATE a VM"
    else
      echo ${config[username]}
      echo ${config[password]}
    fi
  ;;
  delete)
    if [ -t 0 ]; then
      echo "You need an input file config to DELETE a VM"
    else
      echo ${config[name]}
    fi
  ;;
  *)
      echo "usage: $0"
      echo "        [--help]"
      echo "        [create < fileConfig]"
      echo "        [delete < fileConfig]"
  ;;
esac


# echo ${config[PROMPT_COMMAND]} # also respects variables that you may not have
#                # been looking for, but they're sandboxed inside the $config array