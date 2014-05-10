send-delayed-mail
=================

`send-delayed-mail` checks your postponed/drafts Maildir folder for any that
have been marked with the special header `X-Delay`, it sends those that match
the regular expression supplied as its argument.

It is meant to be used in conjunction with `cron` to schedule dispatch times.

This program is intended for use with Maildir-backed mail clients like `mutt`
that make it easy to modify and add mail headers while composing mail.



Example
-------

For example, if you created a draft with the following structure:

    From: My Name <my@email.com>
    To: recipient@there.com
    Cc: 
    Bcc: 
    Subject: This should be sent in the morning
    Reply-To: 
    X-Delay: morning
    
    Hello!

And you run the command:

    send-delayed-mail morning

then it will send this mail, and move the draft to a different folder.



Installation
------------

To configure and build, run:

    make 

To install `send-delayed-mail` in `~/bin`, run:

    make install



Setting up dispatch times
-------------------------

Use `crontab -e` to edit your cron jobs, and then add entries like the following:

    30 5  * * * ~/bin/send-delayed-mail > ~/tmp/delay.log morning  2>&1
    0  12 * * * ~/bin/send-delayed-mail > ~/tmp/delay.log noon     2>&1
    0  13 * * * ~/bin/send-delayed-mail > ~/tmp/delay.log 1pm      2>&1
    59 23 * * * ~/bin/send-delayed-mail > ~/tmp/delay.log midnight 2>&1

Then, you can use `X-Delay` headers like `morning`, `noon`, `1pm` and `midnight`.



Troubleshooting
---------------

Be sure to specify the full path to your `sendmail` clone.

I set this up to work with [msmtp].



[msmtp]: http://msmtp.sourceforge.net/
