#!/bin/bash

POSTPONED="$HOME/Mail/mattmight/draftsx"
SENT="$HOME/Mail/delayed-sent"
SENDMAIL="/opt/local/bin/msmtp"

if [ -e config.sh ]; then
  source config.sh
fi

echo "Please enter configuration settings."

echo "For each, the current/default is in brackets []."

echo "Enter nothing (just press RETURN) to keep the default."

echo > config.sh
echo > config.sed

echo

read -p "Enter the location of your postponed Maildir folder:
[$POSTPONED] " input
POSTPONED="${input:-${POSTPONED}}"
echo "export POSTPONED='$POSTPONED'" >> config.sh
echo "s%__POSTPONED__%$POSTPONED%g" >> config.sed

echo

read -p "Enter the location where you want to store sent mail:
[$SENT] " input
SENT="${input:-${SENT}}"
echo "export SENT='$SENT'" >> config.sh
echo "s%__SENT__%$SENT%g" >> config.sed

echo

read -p "Enter the path to your sendmail/sendmail clone:
[$SENDMAIL] " input
SENDMAIL="${input:-${SENDMAIL}}"
echo "export SENDMAIL='$SENDMAIL'" >> config.sh
echo "s%__SENDMAIL__%$SENDMAIL%g" >> config.sed

