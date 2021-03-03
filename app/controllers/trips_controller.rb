class TripsController < ApplicationController

    get '/trips' do
        redirect_if_not_logged_in
        @trips = Trip.all
        erb :'items/index'
    end


    

end