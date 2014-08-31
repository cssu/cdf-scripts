# Execute the backup script
every 1.day, at: '4:00 am' do
  command 'cd ~/Backup/ && /u/cssuwww/.rbenv/shims/bundle exec backup perform -t cssu_backup'
end

# Recompile the site to 
every 1.day, at: '12:00 am' do
  # TODO: recompile the site
  command 'pwd'
end