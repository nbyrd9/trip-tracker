require './config/environment'

use Rack::MethodOverride
use UsersController
use TripsController
run ApplicationController