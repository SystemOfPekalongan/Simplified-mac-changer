#! /bin/bash

#yellow start
YS="\e[1;33m"
#blue start 
BS="\e[0;34m"
#color end
CE="\e[0m"
#red start
RS="\e[1;31m"

WLANN=$(cat wlan.txt)
WLANNM=$(cat wlanmon.txt)
ETH=$(cat eth.txt)
export WLANN
export WLANNM
export ETH
WLANCHECKING=$(ifconfig | grep "$WLANN" )
WLANMCHECKING=$(ifconfig | grep "$WLANNM" )

function main_options
{
    change_mac
}

function interface_selection
{
if [[ "$WLANCHECKING" = "" ]]
then
	echo -e ""$RS" 1"$CE") $WLANN"
else
	echo -e ""$YS" 1"$CE") $WLANN"
fi
if [[ "$WLANMCHECKING" = "" ]]
then
	echo -e ""$RS" 2"$CE") $WLANNM"
else
	echo -e ""$YS" 2"$CE") $WLANNM"
fi
echo -e ""$YS" 3"$CE") "$ETH""
echo -e ""$YS" 0"$CE") Main menu"
echo -e "Choose: "
read -e MYINT
if [[ "$MYINT" = "2" ]]
then
	if [[ "$WLANMCHECKING" = "" ]]
	then
		MYINT="OFF"
	else
		MYINT="$WLANNM"
	fi
elif [[ "$MYINT" = "1" ]]
then
	if [[ "$WLANCHECKING" = "" ]]
	then
		MYINT="OFF"
	else
		MYINT="$WLANN"
	fi
elif [[ "$MYINT" = "0" ]]
then
	clear
	exit
elif [[ "$MYINT" = "3" ]]
then
	MYINT="$ETH"
else
echo -e "Wrong choice..."
sleep 1
clear
echo -e "EXITING"
sleep 1
clear
exit
fi
export MYINT
}

function change_mac
{
	interface_selection
	clear
	if [[ "$MYINT" = "OFF" ]]
	then
		echo -e "Interface not available"
		sleep 2
	else
		echo -e "Change it to a random or specific?("$YS"r"$CE"/"$YS"s"$CE")("$YS"Enter"$CE"=r): "
		read -e RORS
		clear
		if [[ "$RORS" != "s" ]]
		then
			echo -e "Changing mac address of $MYINT to a random one..."
			ifconfig $MYINT down
			macchanger -r $MYINT
			ifconfig $MYINT up
			echo -e "Done."
		else
			echo -e "Enter the MAC you want:"
			read -e SMAC
			echo -e "Changing mac address of $MYINT to $SMAC..."
			ifconfig $MYINT down
			macchanger -m $SMAC $MYINT
			ifconfig $MYINT up
			echo -e "Done."
		fi
	fi
}

main_options