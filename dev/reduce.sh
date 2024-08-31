#! /bin/bash

# AUTHOR: JONAS STYLBÄCK
# Call this script to reduce file size for media in the $INPUT_PATH, which are then saved to $OUTPUT_PATH.
# The script will reduce image resolution to roughly ~1080×720px using ImageMagick and
# transcode .mp4 video files to VP9/Opus in a .webm container (saving roughly 70% storage) using HandBrakeCLI.
# It will also strip image files of metadata (not necessary for video).

# NOTE: The script MUST be called with two path arguments.
# EXAMPLE: ./dev/reduce.sh ~/Pictures/newpost ~/Pictures/newpost_reduced

# NOTE: A prerequisite for this script is that you have ImageMagick and HandbrakeCLI installed.
# NOTE: Depending on your distro and ImageMagick version, you might need to replace "convert" with "magick" below.

# For more information on ImageMagick, HandbrakeCLI or Parameter Expansion, see:
# https://www.imagemagick.org/script/convert.php
# https://handbrake.fr/docs/en/latest/cli/command-line-reference.html
# https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html

ARG_1="$1" 	# $INPUT_PATH
ARG_2="$2" 	# $OUTPUT_PATH
INPUT_PATH=$(echo "$ARG_1" | sed 's:/*$::') 	# Removes trailing slashes
OUTPUT_PATH=$(echo "$ARG_2" | sed 's:/*$::') 	# Removes trailing slashes

if [[ ( ! -d $INPUT_PATH ) || ( -z "$INPUT_PATH" ) ]]; then
  echo "INPUT_PATH does not exist OR no argument, exiting."

elif [[ -z "$OUTPUT_PATH" ]]; then
  echo "No argument for OUTPUT_PATH, exiting."

else
  if [ ! -d $OUTPUT_PATH ]; then
    echo "$OUTPUT_PATH does not exist, creating..."
    mkdir -p $OUTPUT_PATH
  fi
  
  for FILE in $INPUT_PATH/*; do
    FILE="$FILE" 		        # In case of whitespace characters in the filename
    BASENAME="${FILE##*/}" 	# Filename without extension

    if [[ ( $FILE == *.PNG ) || ( $FILE == *.png ) ]]; then
      convert ${FILE} -auto-orient -strip -resize 777600@\> $OUTPUT_PATH/"${BASENAME%.*}.png"
      echo "Saved ${FILE##*/} to $OUTPUT_PATH/${BASENAME%.*}.png"
	
    elif [[ ( $FILE == *.jpg ) || ( $FILE == *.JPG ) || ( $FILE == *.jpeg ) ]]; then
      convert ${FILE} -auto-orient -strip -resize 777600@\> $OUTPUT_PATH/"${BASENAME%.*}.jpg"
      echo "Saved ${FILE##*/} to $OUTPUT_PATH/${BASENAME%.*}.jpg"
	
    elif [[ $FILE == *.mp4 ]]; then
      HandBrakeCLI -e VP9 -E opus -f av_webm -i --two-pass $FILE -o $OUTPUT_PATH/"${BASENAME%.*}.webm"
      echo "Saved ${FILE##*/} to $OUTPUT_PATH/${BASENAME%.*}.webm"
	
    else
      echo "${FILE##*/} does not have a supported file format."
    fi
  done
fi