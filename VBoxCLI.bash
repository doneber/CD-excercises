clear
VBoxManage="/mnt/d/Program\ Files/Oracle/VirtualBox/VBoxManage.exe"

echo "***********************************"
echo "********   WELCOME   **************"
echo "***********************************"
echo "What do you wanna do?"
echo "    1.- List the Virtual Machines (vms)"
echo "    2.- Create an especific VM"
echo "    3.- Delete an especific VM"
echo "    4.- Quit"
echo "Write an option"
echo ""
read option
while [ $option -lt 4 ]
do
  case $option in

    1)
      echo "You choose option 1"
      echo ""
      eval $VBoxManage list vms
      ;;
    2)
      echo "You choose option 2"
      echo "What will be the VM's name?"
      read name
      eval $VBoxManage createvm --name "VM-$name"
      ;;
    3)
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
  echo "do you wanna do something else?"
  echo "    1.- List the Virtual Machines (vms)"
  echo "    2.- Create an VM"
  echo "    3.- Delete an VM"
  echo "    4.- Quit"
  echo "Write an option"
  echo ""
  read option
done