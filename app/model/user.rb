class User < ActiveRecord::Base
    has_many :trips
    has_many :tourist_attractions, through: :trips

end