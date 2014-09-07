desc 'Back up the contents of `/space/data/www/cssu/htdocs/` to S3'
task :backup do
  system 'cd backup/ && bundle exec backup perform -t cssu_backup'
end

desc 'Build the static Jekyll site and deploy it by copying it to `/space/data/www/cssu/htdocs/`'
task :deploy do
  system 'deploy.sh'
end
