clear
VBoxManage="/mnt/d/Program\ Files/Oracle/VirtualBox/VBoxManage.exe"
echo "********   WELCOME   **************"
echo "What do you wanna do?"
echo "    1.- List the Virtual Machines (vms)"
echo "    2.- Start a VM"
echo "    3.- Turn off a VM"
echo "    4.- Create a VM"
echo "    5.- Delete a VM"
echo "    6.- Quit"
echo "Write an option"
echo ""
read option
while [ $option -lt 6 ]
do
  case $option in

    1)
      echo "You choose option 1"
      echo ""
      eval $VBoxManage list vms
      ;;
    2)
      echo "Type your VM to turn on"
      read vm
      eval "$VBoxManage startvm $vm "
      ;;
    3)
      echo "Type your VM to turn off"
      read vm
      eval "$VBoxManage controlvm $vm poweroff vm soft"
      ;;
    4)
      echo "You choose option 2"
      echo "What will be the VM's name?"
      read name
      eval $VBoxManage createvm --name "VM-$name"
      ;;
    5)
      echo "You choose option 3"
      echo "What is the VM's uid or name?"
      read vm
      eval "$VBoxManage unregistervm $vm --delete"
      echo "$vm VM deleted"
      ;;
    *)
      echo "Invalid option. Wanna quit? Just select '4' option"
      ;;
  esac
  echo ""
  echo "Press intro to continue..."
  read intro
  clear
  echo ""
  echo "Do you wanna do something else?"
  echo "    1.- List the Virtual Machines (vms)"
  echo "    2.- Start a VM"
  echo "    3.- Turn off a VM"
  echo "    4.- Create a VM"
  echo "    5.- Delete a VM"
  echo "    6.- Quit"
  echo "Write an option"
  echo ""
  read option
done