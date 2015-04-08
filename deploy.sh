#!/bin/bash -l
set -e

# Set UTF-8 as default locale
export LC_ALL="C.UTF-8"

GIT_REPO=$HOME/cssu.ca.git
TMP_GIT_CLONE=$HOME/tmp/cssu.ca
PUBLIC_WWW=/space/data/www/cssu/htdocs

remove_tmp_repo () {
  # Remove the temporary repo
  cd ~
  rm -rf $TMP_GIT_CLONE
}
# If there's an error, always remove the temporary repo
trap remove_tmp_repo ERR

# Clone the bare repo into a temporary repo with a working copy
git clone $GIT_REPO $TMP_GIT_CLONE

# Enter the working directory
cd $TMP_GIT_CLONE

# Use Jekyll to generate the static site
echo "Building Jekyll site..."
gem install bundler
bundle install && bundle exec jekyll build

echo "Successfully built Jekyll site!"

# Copy the static site to htdocs, ignoring specific files
echo "Copying site to $PUBLIC_WWW ..."
if [ -r .rsyncexclude ]; then
  rsync --archive --delete --exclude-from=.rsyncexclude _site/ $PUBLIC_WWW
else
  rsync --archive --delete _site/ $PUBLIC_WWW
fi
echo "Done copying!"

# Remove the temporary repo
remove_tmp_repo
