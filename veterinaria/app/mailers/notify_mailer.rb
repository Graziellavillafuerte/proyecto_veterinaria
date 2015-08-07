class NotifyMailer <  ActionMailer::Base
    def notify_mail(client, name)
            #@client_name = Client.where(:id => id).select(:name)
            @client_name = name
            puts @client_name
            mail to: client, subject: 'Programaciòn de Cita'
            
    end
end
