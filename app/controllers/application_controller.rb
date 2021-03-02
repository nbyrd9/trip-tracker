class ApplicationController < Sinatra::Base

    configure do
        set(:views, 'app/views')
        set :public_folder, 'public'
        enable :sessions
        set :session_secret, 'secret'
    end


    get '/' do
        erb :home
    end

    helpers do 
        def logged_in?
            !!current_user
        end

        def current_user
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end
end

