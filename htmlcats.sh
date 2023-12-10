#!/bin/bash
# Build html files with the same header, sidebar and footer
#
# Usage:
# Create a "source" folder and put your source files there
# Source files include a "header", a "sidefoot" (sidebar+footer),
# and as many pages as you want as .html files

# Define your source files
HEADER=header.html
SIDEBAR=sidebar.html
FOOTER=footer.html
OCEANO=oceano.html
GALERIA=galeria.html
MOSTRAS=mostras.html
SECTUR=sectur.html
TAMAR=tamar.html
ECIENCIA=eciencia.html
MVIDA=museuvida.html
INDEX=index.html
CSSDEF=default.css
CSSINTRO=intro.css
DIR=www

# Site content should be stored as .html

# Define your backup folder
#BACKUPDIR=backups

# Check that the www folder exists
if [ ! -d "$DIR/" ]
then
	echo "$DIR folder does not exist!"
	echo "creating a folder to put files..."
	mkdir $DIR
	exit
fi

# Check that a directory for backups exists
#if [ ! -d "$BACKUPDIR/" ]
#then
#	echo "backup folder does not exist!"
#	echo "creating backup folder..."
#	mkdir $BACKUPDIR
#fi

# Rename old files if they exist and move them to backup dir
cd www/
for i in *.html; do
if [ -e $i ]
then
	rm -f $i
fi
done
cd ..

# Stacking header, content, sidebar and footer into one file
# for each .html source file
echo "concatenating...";
cat $HEADER $MOSTRAS $SIDEBAR $FOOTER >> $DIR/$MOSTRAS
cat $HEADER $SECTUR $SIDEBAR $FOOTER >> $DIR/$SECTUR
cat $HEADER $TAMAR $SIDEBAR $FOOTER >> $DIR/$TAMAR
cat $HEADER $ECIENCIA $SIDEBAR $FOOTER >> $DIR/$ECIENCIA
cat $HEADER $MVIDA $SIDEBAR $FOOTER >> $DIR/$MVIDA
cat $HEADER $OCEANO $SIDEBAR $GALERIA $FOOTER >> $DIR/$OCEANO
cp $CSSDEF $DIR/$CSSDEF
cp $CSSINTRO $DIR/$CSSINTRO
cp $INDEX $DIR/$INDEX
