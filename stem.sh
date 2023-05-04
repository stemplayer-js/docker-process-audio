#! /bin/bash

# non_interactive=0
SEGMENT_TIME=10
BITRATE=128

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo "Generate segments of mp3s from source wav files."
   echo
   echo "Syntax: scriptTemplate [-help|-input|-output|--segment_time|--bitrate]"
   echo "options:"
   echo "--help         Print this Help."
   echo "--input        The input file."
   echo "--output       The output folder."
   echo "--segment_time The duration of each segment (default 10)"
   echo "--bitrate      Bitrate of each encoded mp3 segment (default 128)"
}

while [ "$1" != "" ]; do
    case $1 in
        --help )            shift
                            Help
                            exit
                            ;;
        --input )           shift
                            INPUT_FILE=$1
                            ;;
        --output )          shift
                            OUTPUT_FOLDER=$1
                            ;;
        --segment_time )    shift
                            SEGMENT_TIME=$1
                            ;;
        --bitrate )         shift
                            BITRATE=$1
                            ;;
        * )                 echo "Invalid parameters."
                            Help
                            exit 1
    esac
    shift
done

if [ -z "$INPUT_FILE" ]
then
      echo "-input is required"
      exit 1
fi

if [ -z "$OUTPUT_FOLDER" ]
then
      OUTPUT_FOLDER=$(dirname "$INPUT_FILE")
fi

echo "Running script using"
echo "  input: $INPUT_FILE"
echo "  output: $OUTPUT_FOLDER"
echo "  segment_time: $SEGMENT_TIME"
echo "  bitrate: $BITRATE"

mkdir -p $OUTPUT_FOLDER

s=$(basename "$INPUT_FILE")
file="$(echo ${s%.*})"

# First we sedment into wav so that we have accurate cuts (no gaps)
ffmpeg -i "$INPUT_FILE" \
    -f segment \
    -segment_time "$SEGMENT_TIME" \
    -segment_list "$OUTPUT_FOLDER/$file.m3u8" \
    -segment_format wav "$OUTPUT_FOLDER/$file-%03d.wav"

# then we convert to mp3
# make sure you have a recent version of lame
for j in $OUTPUT_FOLDER/*.wav ; do
    lame "$j" -b "$BITRATE"
done

rm $OUTPUT_FOLDER/*.wav

# Replace wav with mp3 in the m3u8 playlist file
# find $OUTPUT_FOLDER/*.m3u8 -type f -exec sed -i '' -e "s/\.wav/.\mp3/g" {} \;
# https://superuser.com/questions/677078/sed-cant-read-no-such-file-or-directory
find $OUTPUT_FOLDER/*.m3u8 -type f -print0 | xargs -0 sed -i "s/\.wav/.\mp3/g"
