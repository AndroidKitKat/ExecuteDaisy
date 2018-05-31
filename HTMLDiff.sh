#!/bin/sh

export CURR_HTML="https://niap-ccevs.org/MMO/PP/-424-/"
export NEW_HTML=$(basename $TRAVIS_REPO_SLUG)

wget $CURR_HTML
wget $NEW_HTML
mkdir diff

java -jar daisydiff.jar $CURR_HTML $NEW_HTML --q

phantomjs save_page.js daisydiff.htm > diff/pageDiff.htm

echo "Don't just grab the .htm file! be sure to grab the pageDiff_files folder for the page to work!"
