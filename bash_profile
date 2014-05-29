if [ -f ~/.bashrc ]
then
    source ~/.bashrc
fi

test -r /sw/bin/init.sh && . /sw/bin/init.sh


# MacPorts Installer addition on 2013-10-27_at_00:56:52: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

