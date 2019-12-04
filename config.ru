require_relative './config/environment'

use Rack::MethodOverride
### use OtherController1
### use OtherController2
### use OtherController3
use SessionsController
use SiteController
use UserUssController
run ApplicationController