#!/bin/bash -l
GIT_REPO=$HOME/cssu.cdf.toronto.edu.git
TMP_GIT_CLONE=$HOME/tmp/cssu.cdf.toronto.edu
BACKUP_DIR=$HOME/htdocs_backup
PUBLIC_WWW=/space/data/www/cssu/htdocs

# Clone the bare repo into a temporary repo with a working copy
git clone $GIT_REPO $TMP_GIT_CLONE

# Enter the working directory
cd $TMP_GIT_CLONE

# Use Jekyll to generate the static site
jekyll build

# Copy the static site to htdocs, ignoring specific files
rsync --archive --delete --exclude-from=.rsyncexclude --verbose _site/ $PUBLIC_WWW

# Remove the temporary repo
cd ~
rm -rf $TMP_GIT_CLONE

exit
