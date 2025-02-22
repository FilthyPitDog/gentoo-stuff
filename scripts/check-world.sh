#!/bin/bash
## https://wiki.gentoo.org/wiki/User:Feng/World_file

while read i ; do \
        if [ -n "$(qdepends -Q $i)" ]; then \
                echo '' ; echo 'checking '$i ;
                if [ -n "$(emerge -p --quiet --depclean $i)" ]; then \
                        echo $i' needs to stay in @world'
                else
                        echo $i' can be deselected'
                        echo $i >> /tmp/deselect
                fi
        fi
done < /var/lib/portage/world
