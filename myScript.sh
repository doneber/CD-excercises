#!/bin/bash
typeset -A config # init array
config=( # set default values in config array
    [VBoxManage]="/mnt/d/Program\ Files/Oracle/VirtualBox/VBoxManage.exe"
    [vmname]="vm-efe"
)
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
          echo $varname
          echo $config
      fi
  done
  if echo $line | grep -F = &>/dev/null
  then
    varname=$(echo "$line" | cut -d '=' -f 1)
    config[$varname]=$(echo "$line" | cut -d '=' -f 2-)
  fi
fi
case "$1" in
  -h|--help)
    echo "usage: $0"
    echo "        [--help] [--list]"
    echo "        [start < fileConfig] [shoutdown < fileConfig]"
    echo "        [create < fileConfig] [delete < fileConfig]"
    echo
    echo "These are common commands used:"
    echo
    echo "        start < fileNameConfig                    Start a VM with input config file"
    echo "        shoutdown < fileNameConfig                Shoutdown a VM with input config file"
    echo "        create < fileNameConfig                   Create a VM with input config file"
    echo "        delete < fileNameConfig                   Delete a VM with input config file"
    exit 0
  ;;
  -l|--list)
    eval ${config[VBoxManage]} list vms
  ;;
  start)
    if [ -t 0 ]; then
      echo "You need an input config file to Start a VM"
    else
      eval ${config[VBoxManage]} startvm ${config[vmname]}
    fi
  ;;
  shoutdown)
    if [ -t 0 ]; then
      echo "You need an input config file to SHOUTDOWN a VM"
    else
      eval "${config[VBoxManage]} controlvm ${config[vmname]} poweroff vm soft"
    fi
  ;;
  create)
    if [ -t 0 ]; then
      echo "You need an input config file to CREATE a VM"
    else
      eval ${config[VBoxManage]} createvm --name ${config[vmname]}
    fi
  ;;
  delete)
    if [ -t 0 ]; then
      echo "You need an input file config to DELETE a VM"
    else
    eval ${config[VBoxManage]} unregistervm ${config[vmname]} --delete
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