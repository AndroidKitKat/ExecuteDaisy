#!/bin/sh

export CURR_HTML="https://niap-ccevs.org/MMO/PP/-424-/"
export NEW_HTML=$(basename $TRAVIS_REPO_SLUG)
export TODAY=`date '+%Y_%m_%d'`

wget $CURR_HTML
wget $NEW_HTML
mkdir diffs

java -jar daisydiff.jar $CURR_HTML $NEW_HTML --q

phantomjs save_page.js daisydiff.htm > diffs/$TODAY.htm
