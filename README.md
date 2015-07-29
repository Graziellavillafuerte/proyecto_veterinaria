
     ,-----.,--.                  ,--. ,---.   ,--.,------.  ,------.
    '  .--./|  | ,---. ,--.,--. ,-|  || o   \  |  ||  .-.  \ |  .---'
    |  |    |  || .-. ||  ||  |' .-. |`..'  |  |  ||  |  \  :|  `--, 
    '  '--'\|  |' '-' ''  ''  '\ `-' | .'  /   |  ||  '--'  /|  `---.
     `-----'`--' `---'  `----'  `---'  `--'    `--'`-------' `------'
    ----------------------------------------------------------------- 


Hi there! Welcome to Cloud9 IDE!

To get you started, create some files, play with the terminal,
or visit http://docs.c9.io for our documentation.
If you want, you can also go watch some training videos at
http://www.youtube.com/user/c9ide.

Happy coding!
The Cloud9 IDE team

# Install devise
rails g devise:install

# Install User to Devise
rails g devise User

# Generar vistas
rails g devise:views

# Migrar
rake db:migrate

# Crear controller para sessiones
rails g controller Sessions

# Para redireccionar a tener una session en el application_controller.rb
before_action :authenticate_user!

# Abrir el session controller y cambiar
class SessionsController < Devise::SessionsController
    layout false
end

# en el routes.rb
devise_for :users, :controllers => { :sessions => "sessions", :registrations => "registrations", :passwords => "passwords" }
# Se crean controllers para sessions, registrations, passwords

##############################
# Envio de mails
rails g mailer NotifierMailer

# Configurar notifier_mailer.rb