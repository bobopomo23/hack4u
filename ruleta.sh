#!/bin/bash
#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
function martingala (){
    echo -e "\nDinero Actual $money$\n"
    echo -ne "cuanto Dinero Tienes Pensado Apostar? ->" && read initial_be
    echo -ne "A Que Deseas Apostar Continuamente -> (Par/Impar)" && read par_impar
}
function ctrl_c(){
    echo -e "\n\n${yellowColour}[!]${endColour} ${redColour}Saliendo.....${endColour}"
    exit 1

}
function helpPanel(){
    echo -e "\n${yellowColour}[!]${endColour}${grayColour}Panel De Ayuda De :${endColour}${purpleColour}$0${endColour}\n "
    echo -e "\t${purpleColour}-m)${endColour} ${grayColour}Dinero Con El Que Se Desea Jugar${endColour}"
    echo -e "\t${purpleColour}-t)${endColour} ${grayColour}Tecnica Con la Que Se Desea Jugar${endColour}${purpleColour} (martingala/iverseLabrouchere)${endColour}\n"
    exit 1 
}
#ctrl_c
trap ctrl_c INT

while getopts "m:t:h" arg; do
    case $arg in
    m) money=$OPTARG;;
    h) helpPanel;;
    t) tecnique=$OPTARG;;
    esac
done
if [ $money ] && [ $tecnique ]; then
    if [ $tecnique ==  "martingala" ]; then
        martingala
    else
        echo -e "\n${redColour}[!] No Existe Esa Tecnica${endColour}"
        helpPanel
    fi    
else
    helpPanel
fi