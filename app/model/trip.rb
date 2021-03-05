class Trip < ActiveRecord::Base
    belongs_to :user

    validates_presence_of :city, :country, :travel_dates
end