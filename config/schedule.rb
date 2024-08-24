set :output, "/root/daily_german_bot/log/cron_log.log"

every 1.day, at: '10:00 am' do
  rake "daily_reminder:send"
end
