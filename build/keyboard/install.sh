#!/bin/bash

INSTALL_PATH="."
INSTALL_DIR="/rf24libs"

ROOT_PATH=${INSTALL_PATH}
ROOT_PATH+=${INSTALL_DIR}

DORF24=0
DORF24Network=0
DORF24Mesh=0
DORF24Gateway=0

echo""
echo "RF24 libraries installer by TMRh20"
echo "report issues at https://github.com/TMRh20/RF24/issues"
echo ""
echo "******************** NOTICE **********************"
echo "Installer will create an 'rf24libs' folder for installation of selected libraries"
echo "To prevent mistaken deletion, users must manually delete existing library folders within 'rf24libs' if upgrading"
echo "Run 'sudo rm -r rf24libs' to clear the entire directory"
echo ""
echo ""

echo "Prerequisite: GIT "
echo -n "Do you want to install GIT using APT (Used to download source code) [y/N]? " 
read answer
case ${answer^^} in
	Y ) sudo apt-get install git
esac

echo $'\n'
echo -n "Do you want to install the RF24 core library, [y/N]? "
read answer
case ${answer^^} in
    Y ) DORF24=1;;
esac

echo $'\n'
echo -n "Do you want to install the RF24Network library [y/N]? "
read answer
case ${answer^^} in
    Y ) DORF24Network=1;;
esac

echo $'\n'
echo -n "Do you want to install the RF24Mesh library [y/N]? "
read answer
case ${answer^^} in
    Y ) DORF24Mesh=1;;
esac

echo $'\n'
echo -n "Do you want to install the RF24Gateway library [y/N]? "
read answer
case ${answer^^} in
    Y ) DORF24Gateway=1;;
esac

if [[ $DORF24Gateway > 0 ]]
then
	echo ""
	echo "Install ncurses library, recommended for RF24Gateway [y/N]? "
	read answer
    case ${answer^^} in
		Y ) sudo apt-get install libncurses5-dev
	esac
	echo ""
fi

if [[ $DORF24 > 0 ]]
then
    echo ""
	echo "Installing RF24 Repo..."
	echo ""
	git clone https://github.com/tmrh20/RF24.git ${ROOT_PATH}/RF24
	echo ""
    echo "*** Install RF24 core using? ***"
    echo "1.BCM2835 Driver(Performance) 2.SPIDEV(Compatibility, Default)"
    echo "3.WiringPi(Its WiringPi!) 4.MRAA(Intel Devices) 5.LittleWire"
    read answer
    cd ${ROOT_PATH}/RF24
    case ${answer^^} in
        1) ./configure --driver=RPi;;
        2) ./configure --driver=SPIDEV;;
        3) ./configure --driver=wiringPi;;
        4) ./configure --driver=MRAA;;
        5) ./configure --driver=LittleWire;;
        *) ./configure --driver=SPIDEV;;
    esac
    cd ../..    
    make -C ${ROOT_PATH}/RF24
	sudo make install -C ${ROOT_PATH}/RF24
	echo ""
fi

if [[ $DORF24Network > 0 ]]
then
	echo "Installing RF24Network Repo..."
	echo ""
	git clone https://github.com/tmrh20/RF24Network.git ${ROOT_PATH}/RF24Network
	echo ""
    make -B -C ${ROOT_PATH}/RF24Network
	sudo make install -C ${ROOT_PATH}/RF24Network
	echo ""
fi

if [[ $DORF24Mesh > 0 ]]
then
	echo "Installing RF24Mesh Repo..."
	echo ""
	git clone https://github.com/tmrh20/RF24Mesh.git ${ROOT_PATH}/RF24Mesh
	echo ""
    make -B -C ${ROOT_PATH}/RF24Mesh
	sudo make install -C ${ROOT_PATH}/RF24Mesh
	echo ""
fi

if [[ $DORF24Gateway > 0 ]]
then
	echo "Installing RF24Gateway Repo..."
	echo ""
	git clone https://github.com/tmrh20/RF24Gateway.git ${ROOT_PATH}/RF24Gateway
	echo ""
    make -B -C ${ROOT_PATH}/RF24Gateway
	sudo make install -C ${ROOT_PATH}/RF24Gateway
	
    echo ""; echo -n "Do you want to build an RF24Gateway example [y/N]? "
    read answer
    case ${answer^^} in
       Y ) make -B -C${ROOT_PATH}/RF24Gateway/examples/ncurses; echo ""; echo "Complete, to run the example, cd to rf24libs/RF24Gateway/examples/ncurses and enter  sudo ./RF24Gateway_ncurses";;
    esac	
fi


echo ""
echo ""
echo "*** Installer Complete ***"
echo "See http://tmrh20.github.io for documentation"
echo "See http://tmrh20.blogspot.com for info "
echo ""
echo "Listing files in install directory rf24libs/"
ls ${ROOT_PATH}



