class NotifyMailer <  ActionMailer::Base
    def notify_mail(citation)
            @citation = citation
            puts @citation
            mail to: citation.client_email, subject: 'Programaciòn de Cita'
            
    end
    
    def reminder_mail(reminder)
            @reminder = reminder
            puts @reminder
            mail to: reminder.email, subject: reminder.subject
            
    end
end
