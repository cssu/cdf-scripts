# Execute the backup script
every 1.day, at: '4:00 am' do
  rake 'backup'
end

# Recompile the site to refresh visible posts
every 1.day, at: '12:00 am' do
  rake 'deploy'
end
