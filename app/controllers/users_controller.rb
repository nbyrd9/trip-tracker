class UsersController < ApplicationController

    get '/signup' do
        if session[:user_id]
        redirect "/users/#{session[:user_id]}"
        else
            erb :'users/signup'
        end
    end


    post '/signup' do
        user = User.create(params)
        
        if user.id 
            session[:user_id] = user.id
            redirect "/users/#{user.id}"
        else
            erb :'users/signup'
        end
    end

    get '/users/:id' do
        authenticate
            @user = User.find_by(id: params[:id])
            @trips = @user.trips
            erb :'users/show'
    end

    get '/login' do 
        if session[:user_id]
            redirect "/users/#{session[:user_id]}"
        end
          erb :'users/login'
    end

    post '/login' do

        user = User.find_by(username: params[:user][:username])

        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            flash[:message] = ["You have successfully logged in!"]
            redirect "/users/#{user.id}"
        else
            flash[:message] = ["Invalid login. Please try again."]
            erb :'users/login'
        end
    end

    get '/logout' do 
        session.clear
        redirect '/login'
    end

    get '/users' do
        authenticate
        @users = User.all
        erb :'users/index'
    end
end

