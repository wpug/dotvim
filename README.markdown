Installation
============

Clone my VIM setup and the Vundle plugin from GitHub.
----------------------------------------------------

    git clone https://github.com/wpug/dotvim.git ~/.vim
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Create .vimrc as a symbolic link
--------------------------------

    ln -s ~/.vim/vimrc ~/.vimrc

Install the "bundles" with plugins
----------------------------------

Open VIM and issue the command

    :BundleInstall

When Vundle is done with installing the bundles exit VIM with the command

    :qa

That's it.

How to update your installation
-------------------------------

First you need to pull any possible changes to the basic installation part
(vimrc). To do it you need to be inside the .vim directory:

    cd ~/.vim
    git pull

If there are any changes reported by Git you should (inside Vim) issue
the following sequence of commands:

    :BundleClean
    :BundleInstall!

If Git says that your basic installation is up to date you can always
try to update the individual bundles by issuing the command:

    :BundleInstall!

