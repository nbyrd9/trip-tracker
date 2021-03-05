class Trip < ActiveRecord::Base
    belongs_to :user

    validates_presence_of :city, :country, :travel_dates
#define instance method for date
#self.dates_traveled


end