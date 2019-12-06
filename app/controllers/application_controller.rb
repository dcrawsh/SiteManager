class ApplicationController < Sinatra::Base

    
  
    configure do
      set :public_folder, 'public'
      set :views, 'app/views'
      enable :sessions
      set :session_secret, "password_security"
    end
  
    helpers do

        def logged_in?
            !!current_user
        end

        def login(email, password)
            user = User.find_by(:email => email)
                if user && user.authenticate(password)
                session[:email]=params[:email]
            else 
                redirect '/login'
            end
        end

        def logout! 
            session.clear 
            redirect '/login'

        end

        def current_user
            @current_user ||= User.find_by(:email => session[:email]) if session[:email]
        end
    end


end