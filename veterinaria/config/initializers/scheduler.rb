require 'rufus-scheduler'
s = Rufus::Scheduler.singleton
s.every '10m' do
    Rails.logger.info "Holaaa #{Time.now}"
end
