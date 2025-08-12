function ctrl_c(){
    echo -e "\n\n[!]Saliendo....."
    exit 1

}
function helpPanel(){
    echo -e "\n\n[!]Panel De Ayuda: " 
}
#ctrl_c
trap ctrl_c INT

while getops "m:t:h" arg; do
    case $arg in
    m) money=$OPTARG;;
    h) helpPanel;;
    t) tecnique=$OPTARG
    esac
done
if [ $money ] && [ $tecnique ]; then
    echo -e "\n\n[!]WUEPAAAA"
else
    helpPanel
fi