# video_conversion_script.sh
#
# Video Converter - A shell script that utilises ffmpeg to simplify the 
#		    video conversion process.
#
# Copyright (C) 2011 Daniel Ngu <daniel.dy.ngu@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

#!/bin/sh

FILE=$1

if [ -z "$FILE" ]
then
    echo "Usage: ./video_conversion_script.sh {path-to-file}"
else
    echo " [0] Nexus One"
    echo " [1] Dream/G1/Magic/myTouch/Eris/Desire/Hero/Cliq/DEXT/Behold II"
    echo " [2] Droid"
    echo " [3] iPhone/iPod Touch/iPod Nano/iPod Classic"
    echo " [4] iPhone 4/iPod Touch 4"
    echo " [5] iPad"
    echo " [6] PSP"
    echo " [7] Theora"
    echo " [8] MP4"
    echo " [9] WebM"
    echo "[10] MP3 Audio"
    read FORMAT
    
    WIDTH=`ffmpeg -i $FILE 2>&1 | grep "Stream" | cut -d ' ' -f 11 | \
	head -1 | cut -d "x" -f 1  | sed 's/,//g'`

    HEIGHT=`ffmpeg -i $FILE 2>&1 | grep "Stream" | cut -d ' ' -f 11 | \
	head -1 | cut -d "x" -f 2 | sed 's/,//g'`

    LOC=`echo $FILE | cut -d "." -f 1`
    MP4=".mp4"
    OGV=".ogv"
    MP3=".mp3"
    WEBM=".webm"
    CONVERTED="_converted"

    # Nexus One
    if [ $FORMAT -eq 0 ] 
    then
	if [ $WIDTH -gt 800 ] && [ $HEIGHT -gt 480 ]
	then
	    ffmpeg -i $FILE -strict experimental -y -acodec aac -ac 2 \
		-ab 160k -s 800x480 -vcodec libx264 -vpre ipod640 -vpre slow \
		-f mp4 -threads 0 -crf 22 $LOC$CONVERTED$MP4
	else
	    ffmpeg -i $FILE -strict experimental -y -acodec aac -ac 2 \
		-ab 160k -vcodec libx264 -vpre ipod640 -vpre slow -f mp4 \
		-threads 0 -crf 22 $LOC$CONVERTED$MP4
	fi
    fi
    
    # Dream/G1/Magic/myTouch/Eris/Desire/Hero/Cliq/DEXT/Behold II
    if [ $FORMAT -eq 1 ]
    then
	if [ $WIDTH -gt 480 ] && [ $HEIGHT -gt 320 ]
	then
	    ffmpeg -i $FILE -strict experimental -y -acodec aac -ac 2 \
		-ab 160k -s 480x320 -vcodec libx264 -vpre ipod640 -vpre slow \
		-f mp4 -threads 0 -crf 22 $LOC$CONVERTED$MP4
	else
	    ffmpeg -i $FILE -strict experimental -y -acodec aac -ac 2 \
		-ab 160k -vcodec libx264 -vpre ipod640 -vpre slow -f mp4 \
		-threads 0 -crf 22 $LOC$CONVERTED$MP4
	fi
    fi
    
    # Droid
    if [ $FORMAT -eq 2 ]
    then
	if [ $WIDTH -gt 854 ] && [ $HEIGHT -gt 480 ]
	then
	    ffmpeg -i $FILE -strict experimental -y -acodec aac -ac 2 \
		-ab 160k -s 854x480 -vcodec libx264 -vpre ipod640 -vpre slow \
		-f mp4 -threads 0 -crf 22 $LOC$CONVERTED$MP4
	else
	    ffmpeg -i $FILE -strict experimental -y -acodec aac -ac 2 \
		-ab 160k -vcodec libx264 -vpre ipod640 -vpre slow -f mp4 \
		-threads 0 -crf 22 $LOC$CONVERTED$MP4
	fi
    fi
    
    # iPhone/iPod Touch/iPod Nano/iPod Classic
    if [ $FORMAT -eq 3 ]
    then
	if [ $WIDTH -gt 480 ] && [ $HEIGHT -gt 320 ]
	then
	    ffmpeg -i $FILE -strict experimental -acodec aac -ac 2 \
		-ab 160k -s 480x320 -vcodec libx264 -vpre ipod640 -vpre slow \
		-b 1200k -f mp4 -threads 0 $LOC$CONVERTED$MP4
	else
	    ffmpeg -i $FILE -strict experimental -acodec aac -ac 2 \
		-ab 160k -vcodec libx264 -vpre ipod640 -vpre slow -b 1200k \
		-f mp4 -threads 0 $LOC$CONVERTED$MP4
	fi
    fi
    
    # iPhone 4/iPod Touch 4
    if [ $FORMAT -eq 4 ]
    then
	if [ $WIDTH -gt 640 ] && [ $HEIGHT -gt 480 ]
	then
	    ffmpeg -i $FILE -strict experimental -acodec aac -ac 2 \
		-ab 160k -s 640x480 -vcodec libx264 -vpre ipod640 -vpre slow \
		-b 1200k -f mp4 -threads 0 $LOC$CONVERTED$MP4	
	else
	    ffmpeg -i $FILE -strict experimental -acodec aac -ac 2 \
		-ab 160k -vcodec libx264 -vpre ipod640 -vpre slow -b 1200k \
		-f mp4 -threads 0 $LOC$CONVERTED$MP4
	fi
    fi
    
    # iPad
    if [ $FORMAT -eq 5 ]
    then
	if [ $WIDTH -gt 1024 ] && [ $HEIGHT -gt 768 ]
	then
	    ffmpeg -i $FILE -strict experimental -acodec aac -ac 2 \
		-ab 160k -s 1024x768 -vcodec libx264 -vpre ipod640 -vpre slow \
		-b 1200k -f mp4 -threads 0 $LOC$CONVERTED$MP4	
	else
	    ffmpeg -i $FILE -strict experimental -acodec aac -ac 2 \
		-ab 160k -vcodec libx264 -vpre ipod640 -vpre slow -b 1200k \
		-f mp4 -threads 0 $LOC$CONVERTED$MP4
	fi
    fi
    
    # PSP
    if [ $FORMAT -eq 6 ]
    then
	if [ $WIDTH -gt 480 ] && [ $HEIGHT -gt 270 ]
	then
	    ffmpeg -i $FILE -s 480x270 -b 512000 -ar 24000 -ab 64000 \
		-f psp -r 29.97 $LOC$CONVERTED$MP4
	else
	    ffmpeg -i $FILE -s -b 512000 -ar 24000 -ab 64000 -f psp \
	    -r 29.97 $LOC$CONVERTED$MP4
	fi
    fi

    # Theora
    if [ $FORMAT -eq 7 ]
    then
	ffmpeg2theora --videoquality 8 --audioquality 6 --frontend \
	-o $LOC$CONVERTED$OGV $FILE
    fi

    # MP4
    if [ $FORMAT -eq 8 ]
    then
	ffmpeg -i $FILE -strict experimental -acodec aac -ac 2 -ab 160k -vcodec libx264 \
	-vpre slow -f mp4 -crf 22 $LOC$CONVERTED$MP4
    fi

    # WebM
    if [ $FORMAT -eq 9 ]
    then
	ffmpeg -i $FILE -f webm -vcodec libvpx -acodec libvorbis -ab 160k \
	-crf 22 $LOC$CONVERTED$WEBM
    fi

    # MP3 Audio
    if [ $FORMAT -eq 10 ]
    then
	ffmpeg -i $FILE -f mp3 -y $LOC$CONVERTED$MP3
    fi    
fi
