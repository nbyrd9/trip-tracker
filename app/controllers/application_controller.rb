class ApplicationController < Sinatra::Base

    configure do
        set(:views, 'app/views')
        set :public_folder, 'public'
        enable :sessions
        set :session_secret, 'secret'
    end

    register Sinatra::Flash


    get '/' do
        erb :'home'
    end

    helpers do 
        def logged_in?
            !!current_user
        end

        def current_user
            @current_user ||= User.find_by(id: session[:user_id])
        end

        def authenticate
            redirect '/login' unless current_user
        end

        def check_owner(obj)
            obj && obj.user == current_user
        end
      
        def redirect_if_not_owner(obj)
            if !check_owner(obj)
              redirect '/trips'
            end
        end

        def set_trip
            @trip = Trip.find_by(id: params[:id])
        end
      
    end
end

