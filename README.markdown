# Linux launcher for Jetbrains IDEs, with dock support.

** THIS IS UNOFFICIAL SOFTWARE! I'm not connected to Jetbrains in any way **

## Description

Allows the IDE to correctly work with Docky/AWN; each IDE will have its own icon and won't be exchanged for a different Swing app.
Otherwise you'll probably get a lot of different apps grouped under the very same icon in docks.

Head to [Jetbrains Homepage](http://www.jetbrains.com) to get your favourite IDE.

## Supported IDEs

IDEA 10/11

PyCharm 1.x

RubyMine 3.x

## Basic usage

I suggest you skip to Reccomended usage section later

~~~ {}
launcher.sh [WM_CLASS_NAME] [script_to_launch, i.e. idea.sh or pycharm.sh] 
~~~

### Examples

~~~ {}
launcher.sh IDEA /opt/idea/bin/idea.sh 
launcher.sh RubyMine rubymine.sh
~~~


## Reccomended usage

Install your desktop entry!

### untar IDE archive

e.g.

~~~ {}
cd
mkdir dev
cd dev
tar xvf ~/Downloads/idea-IC-123.tar.gz
~~~


### symlink IDE directory

Create a symlink for ide type; this will prevent you from needing to upgrade the launcher at every update, just update the symlink to point to the latest untarred directory.

~~~ {}
ln -s idea-IC-123 idea
~~~

### remove stale entries

Remove any icon related to the IDE from your dock and/or from your applications menu, if any.

### clone git repo

~~~ {}
cd ~/dev
git clone git://github.com/alanfranz/jb_ide_launcher.git
cd jb_ide_launcher
~~~

### create desktop file

use the install_for script to install a pre-cooked desktop application file. You can pick any IDE type for which a .desktop file exists in the jb_ide_launcher repo, e.g.

~~~ {}
./install_for IDEA_IC ~/dev/idea
~~~

Will install for IDEA, community edition.

### enjoy

you should now get a menu entry in your programming or development menu; drag such entry into your dock, and you're done! Now launching from such icon will let you choose between icons right in your dock.

