class TrainingController < ApplicationController

  get '/trainings' do
    if logged_in?
      @trainings = Training.all
      erb :'trainings/index.html'
    else
      redirect to '/login'
    end
  end

   
    
    get '/trainings/new' do
        if logged_in?
            erb :"trainings/new.html"
        else
          redirect to '/login'
        end
    end

    post '/trainings' do
        if logged_in?
          if params[:name] == "" 
            redirect to "/trainings/new"
          else
            @training = Training.create(name: params[:name])
            if @training.save
              redirect to "/trainings"
            else
              redirect to "/trainings/new"
            end
          end
        else
          redirect to '/login'
        end
      end

    

    get '/trainings/:id' do
      if logged_in?
        @training = Training.find_by_id(params[:id])
        
        erb :'trainings/show.html'
      else
        redirect to '/login'
      end
    end
    

    

end 