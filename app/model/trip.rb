class Trip < ActiveRecord::Base
    belongs_to :user
    has_many :tourist_attractions

    validates_presence_of :city, :country, :travel_dates, :traveled?
end