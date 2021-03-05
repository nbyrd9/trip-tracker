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
        set_trip
        redirect_if_not_owner(@trip)
        erb :'trips/edit'
    end

    patch '/trips/:id' do
        authenticate
        set_trip
        if check_owner(@trip)
            @trip.update(params[:trip])
        end
        erb :'trips/show'
    end

    delete '/trips/:id' do
        authenticate
        set_trip
        if check_owner(@trip)
           @trip.delete
           redirect "/trips"
        else
            erb :'trips/show'
        end   
        @trip = Trip.all
        erb :'trips/index' 
    end
end

