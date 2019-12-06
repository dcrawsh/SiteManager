class SiteController < ApplicationController

    get '/sites' do
        @sites = Site.all
        erb :"/sites/index.html"
    end

    get '/sites/new' do
        if !logged_in?
            redirect "/login"
        else 
            erb :"/sites/new.html"
        end
    end

    post '/sites' do
        if logged_in?
          if params[:name] == "" || params[:sideid] == "" 
            redirect to "/sites/new"
          else
            @site = current_user.sites.build(name: params[:name], siteid: params[:siteid])
            if @site.save
              redirect to "/sites/#{@site.id}"
            else
              redirect to "/sites/new"
            end
          end
        else
          redirect to '/login'
        end
      end

    get '/sites/:id' do
        if logged_in?
          @site = Site.find_by_id(params[:id])
          @employees = @site.employees
          erb :'sites/show.html'
        else
          redirect to '/login'
        end
    end

    get '/sites/:id/edit' do
        if logged_in?
          @site = Site.find_by_id(params[:id])
          if @site && @site.user == current_user
            erb :'sites/edit.html'
          else
            redirect to '/sites'
          end
        else
          redirect to '/login'
        end
      end
            
    patch '/sites/:id' do
        
        if logged_in?
          if params[:name] == "" || params[:siteid] == ""
            redirect to "/sites/#{params[:id]}/edit"
          else
            @site = Site.find_by_id(params[:id])
            if @site && @site.user == current_user
              if @site.update(name: params[:name], siteid: params[:siteid])
                redirect to "/sites/#{@site.id}"
              else
                redirect to "/sites/#{@site.id}/edit"
              end
            else
              redirect to '/sites'
            end
          end
        else
          redirect to '/login'
        end
      end
    
    delete '/sites/:id/delete' do
        if logged_in?
          @site = Site.find_by_id(params[:id])
          if @site && @site.user == current_user
            @site.delete
          end
          redirect to '/sites'
        else
          redirect to '/login'
        end
      end
            
        
    

end 