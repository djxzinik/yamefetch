#/bin/bash

if ! command -v mplayer &> /dev/null
then
    echo "mplayer could not be found"
    exit
fi
if ! command -v lolcat &> /dev/null
then
    echo "lolcat could not be found"
    exit
fi
if ! command -v neofetch &> /dev/null
then
    echo "<neofetch could not be found"
    exit
fi

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
DIR="/img/"
FILES="waifu"
QTTY=`ls ${SCRIPT_DIR}${DIR} | wc -l`
RANDOM=$$
ITEM=$(($RANDOM%$QTTY))
IMG="${SCRIPT_DIR}${DIR}${FILES}${ITEM}"
mplayer "${SCRIPT_DIR}/iiyada.wav" </dev/null > /dev/null 2>&1 &
neofetch --ascii $IMG | lolcat
