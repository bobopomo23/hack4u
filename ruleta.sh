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
    echo -e "\n${yellowColour}Dinero Actual${endColour} ${purpleColour}$money€${endColour}\n"
    echo -ne "${turquoiseColour}Cuanto Dinero Tienes Pensado Apostar? ->${endColour} " && read initial_be
    echo -ne "\n${turquoiseColour} A Que Deseas Apostar Continuamente?${endColour} -> ${purpleColour}(${endColour}${blueColour}Par${endColour}${purpleColour}/${endColour}${blueColour}Impar${endColour}${purpleColour})${endColour} " && read par_impar
    tput civis
    while true; do
        random_number="$(($RANDOM % 37))"
        echo -e  "${yelllowColour}[+]${endColour} ${grayColour}Ha salido el numero${endColour} ${blueColour}$random_number${endColour}"
        if [ "$(($random_number % 2))" -eq 0 ]; then
            if [ "$random_number" -eq 0 ]; then
                echo "[+] Ha Salido El 0, Por Lo Tanto Perdemos el dinero"
            else
                echo "[+] el numero que a salido es par"
            fi
        else
            echo "[+] El Numero que a salido es impar" 
        fi
    sleep 0.4
    done
}

function ctrl_c(){
    echo -e "\n\n${yellowColour}[!]${endColour} ${redColour}Saliendo.....\n${endColour}"
    tput cnorm; exit 1

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