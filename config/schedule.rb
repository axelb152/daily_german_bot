set :output, "/root/daily_german_bot/config/log/cron_log.log"

job_type :rake, "cd :path && :environment_variable=:environment /root/.asdf/shims/bundle exec rake :task --silent :output"

every 1.day, at: '10:00 am' do
  rake "daily_reminder:send"
end
