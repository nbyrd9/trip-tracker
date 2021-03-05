class TripsController < ApplicationController

    get '/trips' do
        authenticate
        @trips = Trip.all
        erb :'trips/index'
    end

    get '/trips/new' do
        authenticate
        erb :'trips/new'
    end

    post '/trips/' do
        authenticate
        trip = Trip.create(params[:trip])
       
        user = User.find_by(id: session[:user_id])
        user.trips << trip
        redirect "/trips/#{trip.id}"
    end

    get '/trips/:id' do
        authenticate
        set_trip
         if !@trips
        redirect '/trips'
        end
        erb :'trips/show'
    end

    get '/trips/:id/edit' do

        authenticate
        @users = User.find_by(id :params[:id])
        set_trip
        redirect_if_not_owner(@trips)
        erb :'trips/edit'
    end

    patch '/trips/:id' do
        authenticate
        set_trip
        if check_owner(@trips)
            @trips.update(params[:trip])
        end
        erb :'trips/show'
    end

    delete '/trips/:id' do
        authenticate
        set_trip
        if check_owner(@trips)
           @trips.delete
           redirect "/trips"
        else
            erb :'trips/show'
        end    
    end
end

