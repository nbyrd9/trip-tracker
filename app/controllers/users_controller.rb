class UsersController < ApplicationController

    get '/signup' do
        if logged_in?
            @user = current_user
            redirect "/users/#{session[:user_id]}"
        else
            erb :'users/signup'
        end
    end


    post '/signup' do
        user = User.create(params[:user])
        if user.id 
            session[:user_id] = user.id
            redirect '/users/#{user.id}'
        else
            erb :'users/create_user'
        end
    end

    get '/users/:id' do
        authenticate
            @user = User.find_by(id: params[:id])
            @trips = @user.trips
            erb :'users/show'
    end

    get '/login' do 
        if !logged_in?
            erb :'users/login' 
        else
            redirect "/users/#{session[:user_id]}"
        end
    end

    post '/login' do
        user = User.find_by(username: params[:user][:username])

        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            flash[:message] = "You have successfully logged in!"
            redirect "/users/#{user.id}"
        else
            @errors = ["Invalid login. Please try again."]
            redirect "users/login"
        end
    end

    get '/logout' do 
        session.destroy
        erb :'/login'
    end

    get '/users' do
        authenticate
        @users = User.all
        erb :'users/index'
    end
end

