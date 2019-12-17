class EmploytrainController < ApplicationController
    get '/employtrains/new' do
        if logged_in?
            @employees = Employee.all
            @trainings = Training.all 
            erb :"/employtrains/new.html"
        end
      end

    post '/employtrains' do
    
        @employtrains = []
        params[:employee_ids].each do |e|
        @employtrains << Employtrain.create(date: params[:date], employee_id: e, training_id: params[:training_id])
        
        end
        
        erb :"/employtrains/show.html"
    end

    get '/employtrains' do
        
        erb :"/employtrains/show.html"
    end
end 