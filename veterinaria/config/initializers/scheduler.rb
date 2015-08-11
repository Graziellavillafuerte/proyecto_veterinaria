    require 'rufus-scheduler'
    s = Rufus::Scheduler.singleton
    s.every '40m' do
        Rails.logger.info "Holaaa #{Time.now}"
    end


    # Envio de correos con hora programada
    s.cron '45 * * * *' do
        #Rails.logger.info "Hora de ejecucion: #{Time.now} - Hora de Termino: #{Time.now + 3600}"
        time_range = Time.now..Time.now + 3600
        Rails.logger.info time_range
        @reminders = Reminder.all.where(date: time_range)
        @reminders.each do |reminder|
        NotifyMailer.reminder_mail(reminder)
        end
    end