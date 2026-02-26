# MircSpeech
A utility to make the mIRC client (https://mirc.co.uk) accessible for the visually impaired.

WELCOME TO MIRCSPEECH

A MIRC INTERFACE FOR JFW 3.5 AND ABOVE

By: Sean Randel, The-Bofh, Samuel Proulx, Mohaned, Robert Spangler, and others

LICENSE

Mircspeech is under the Common Public License, v 1.0.  By installing and using this program, you agree to be bound by the terms of this agreement.  For more information, please see:
http://www.eclipse.org/legal/cpl-v10.html

UPDATING FROM OLDER VERSIONS

Simpley run the new install file, and everything should work fine.  If it doesn't, uninstall mircspeech and install the new version.  

INSTALLING

To install mircspeech, click on mircspeechinstaller.exe and follow the directions.  If you haven't installed this program before, it may tell you it's missing MSWINSCK.OCX. You can download it from this repository, as I have absolutely no idea where else you can get it in 2026.

SETUP

Before you can use mircspeech, you have to make some one time configuration changes inside of mIRC.  After you have installed mircspeech, run mIRC and type:
/load -rs jfw.mrc
/jfwstart

startup

To start mircspeech, press alt control m, and mircspeech will start.  You can also click on mircspeech from the programs menu.  
That's it!  You're all set up!  Remember, each time you start mIRC, you'll have to run mircspeech to get it working.  

SOURCE NOTES

The visual Basic source is included with the program, and is located inside your mIRC directory.  It's named mircspeech.vbp, as I've finally gotten around to renaming the files and repointing everything.  

SECURITY NOTES

This program passes data from mIRC to jfw on port 3498, and may cause a security risk to people not behind firewalls.  

CHANGING THE PORT

This requires you to know something about the mIRC scripting language.  Edit jfw.mrc to listen on the port you want to use.  Now start mIRC. When you open mircspeech, you will get an error.  Click "no" and tab to the box with the port number.  Change this port number to the same one you put in jfw.mrc and click connect.  I have no idea why anyone would want to do this.  

listening over the network

First, install mircspeech and get it running on the network computer.  Next, start mIRC *without* starting mircspeech on that computer.  Start mircspeech on your local computer (without starting mIRC first), and click no on the error that pops up.  Now, enter the name of the computer on your network (E.G. secord1800, moe1300, jethro, etc) where you started mIRC and click connect.  You should now be able to hear the messages from that computer.  Again, this really isn't that useful.  

Other Unintended uses

Mircspeech also works well with qotd, time and finger servers.  It's faster and smaller than most telnet programs.  As an example, enter quote.cbk.net as the host, and 17 as the port and click connect.  Jfw will now read out a quote from quote.cbk.net.  Be sure to press disconnect before connecting to something else.  

Bugs

This program is at least 16 years old. There will be bugs. This program is no longer maintained. They are unlikely to be fixed. Install at your own risk.
