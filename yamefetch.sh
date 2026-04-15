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
if ! command -v fastfetch &> /dev/null
then
    echo "fastfetch could not be found"
    exit
fi

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
WAIFU_DIR="${SCRIPT_DIR}/img/"
IIYADA_DIR="${SCRIPT_DIR}/wav/"
QTTY1=`ls ${WAIFU_DIR} | wc -l`
QTTY2=`ls ${IIYADA_DIR} | wc -l`
WAIFU_FILES=($(ls "${WAIFU_DIR}"))
IIYADA_FILES=($(ls "${IIYADA_DIR}"))
RANDOM=$$
ITEM1=$(($RANDOM%$QTTY1))
ITEM2=$(($RANDOM%$QTTY2))
WAIFU="${WAIFU_DIR}${WAIFU_FILES[$ITEM1]}"
IIYADA="${IIYADA_DIR}${IIYADA_FILES[$ITEM2]}"
mplayer $IIYADA </dev/null > /dev/null 2>&1 &
fastfetch --logo $WAIFU | lolcat
