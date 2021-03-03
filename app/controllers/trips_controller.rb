class TripsController < ApplicationController

    get '/trips' do
        redirect_if_not_logged_in
        @trips = Trip.all
        erb :'items/index'
    end

    get '/trips/new' do 
        if logged_in?
            @user = current_user
            erb :'/trips/new'
        else
            redirect '/home'
        end
    end

    post '/trips' do
        redirect_if_not_logged_in
        trip = Trip.create(params[:trip])
        user = User.find_by(id: session[:user_id])
        user.trips << trip
    end

    get '/trips/:id' do
        @trip = Trip.find(params[:id])
        if logged_in? && @trip.user_id == current_user.id
            erb :'/trips/show'
        else
            redirect '/'
        end
    end

    get '/trips/:id/edit' do
        @trip = Trip.find(params[:id])
        if logged_in? && @trip.user_id == current_user.id
            erb :'/trips/edit'
        else
            redirect '/'
        end
    end

    

    









end