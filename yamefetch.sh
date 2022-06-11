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
    echo "neofetch could not be found"
    exit
fi

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
IMG="/img/"
WAV="/wav/"
FILES="waifu"
AUDIOS="iiyada"
QTTY1=`ls ${SCRIPT_DIR}${IMG} | wc -l`
QTTY2=`ls ${SCRIPT_DIR}${WAV} | wc -l`
RANDOM=$$
ITEM1=$(($RANDOM%$QTTY1))
ITEM2=$(($RANDOM%$QTTY2))
IMG="${SCRIPT_DIR}${IMG}${FILES}${ITEM1}"
mplayer "${SCRIPT_DIR}${WAV}${AUDIOS}${ITEM2}.wav" </dev/null > /dev/null 2>&1 &
neofetch --ascii $IMG | lolcat
