#!/bin/bash -l
GIT_REPO=$HOME/cssu.cdf.toronto.edu.git
TMP_GIT_CLONE=$HOME/tmp/cssu.cdf.toronto.edu
PUBLIC_WWW=/space/data/www/cssu/htdocs

# Clone the bare repo into a temporary repo with a working copy
git clone $GIT_REPO $TMP_GIT_CLONE

# Enter the working directory
cd $TMP_GIT_CLONE

# Use Jekyll to generate the static site
bundle exec jekyll build

# Copy the static site to htdocs, ignoring specific files
echo "Copying site to $PUBLIC_WWW ..."
if [ -r .rsyncexclude ]; then
  rsync --archive --delete --exclude-from=.rsyncexclude _site/ $PUBLIC_WWW
else
  rsync --archive --delete _site/ $PUBLIC_WWW
  rsync --archive --delete . $PUBLIC_WWW
fi
echo "Done copying!"

# Remove the temporary repo
cd ~
rm -rf $TMP_GIT_CLONE
