#!/bin/bash

declare -A SITES

# Map hostname and public directory / index file location
#
# Example :
# SITES[myhostname]=mywebsite
# Configuration above will use `myhostname` as the hostname and index file is located at `mywebsite/index.php`. No need to add /index.php
#
# If the index file is located in another subdirectory within your document root (for example Laravel/Lumen app use `public/index.php``). You just need to set that subdirectory like this :
# SITES[mylaravelhostname]=mylaravelfolder/public
#
# Notes:
# By default all sites will be stored at /var/www/ in the container. It means this mapping will be placed automatically at /var/www/yourwebsitedir. You don't need to add extra /var/www also in this config file

# site list
SITES[api.local]=api/public
SITES[blog.local]=blog
