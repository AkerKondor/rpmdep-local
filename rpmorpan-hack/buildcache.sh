#!/bin/bash
# This script requires rpmorphan package installed.
# The hack is based on static and unchangeable cache file name for the whole rpmorphan package.
rpmdir=$1
rh_cache="/tmp/rpmorphan.cache"
if [ -e $rh_cache ]
then
    rm -f $rh_cache
fi    
touch $rh_cache
for package in `ls $rpmdir`
do
    rpm -q "$rpmdir""$package" --queryformat '%{NAME};[%{REQUIRENAME},] ;[%{PROVIDES},];[%{FILENAMES},];%{INSTALLTIME}\n' >> $rh_cache;
done
