#! /bin/bash

PLACEHOLDER=$(openssl rand -hex 7);

read -p "Create a new signature in Apple Mail, write inside only $PLACEHOLDER and save it, done?";
killall Mail

SIG_FILE=$(find ~/Library/Mail/V3/MailData/Signatures -type f -print0 | xargs -0 grep -l "$PLACEHOLDER")
open -a TextEdit $SIG_FILE
read -p "Replace the HTML code inside <body> tag in the TextEdit window and save it, done?";

chflags uchg $SIG_FILE

open -a Mail

sleep 5

chflags nouchg $SIG_FILE

echo "Done.";
