#!/bin/bash

POSTPONED="__POSTPONED__"
SENT="__SENT__"
SENDMAIL="__SENDMAIL__"

cd "$POSTPONED"


# Find all drafts marked with a delayed send header:
Delayed=$(find . -type f -exec grep -i -l "^X-Delay: $1" {} \;)

# Send the delayed drafts:
for mail in $Delayed;
do
  echo "Sending $mail"
  if $SENDMAIL -t < "$mail"; then
    mv -v "$mail" "$SENT/"
  fi
done


