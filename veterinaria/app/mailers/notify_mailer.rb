class NotifyMailer < ApplicationMailer
    def notify(client)
        @client = client
        mail to: @client.email, subject: 'Cita' 
    end
end
