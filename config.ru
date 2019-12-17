require './config/environment'


use Rack::MethodOverride
### use OtherController1
### use OtherController2
### use OtherController3
use SessionsController
use SiteController
use UsersController
use EmployeeController
use TrainingController
use EmploytrainController
run ApplicationController