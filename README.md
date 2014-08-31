cdf-scripts
===========

Deployment scripts and backup automation for CSSU content hosted on CDF.

## Installing

First, clone this repository into the home directory of the `cssuwww` user on CDF:

    git clone git@github.com:cssu/cdf-scripts.git

Then make sure dependencies are installed:

    cd ~/cdf-scripts/
    gem install bundler
    bundle install

## Tasks

Several `rake` tasks are defined in Rakefile:

- `rake deploy`: Build the static Jekyll site and deploy it by copying it to `/space/data/www/cssu/htdocs/`

## Enabling automated cron tasks

Invoke `whenever` to update the crontab:

    cd ~/cdf-scripts/
    bundle exec whenever --update-crontab  # update the crontab using config/schedule.rb
