class EmployeeController < ApplicationController

    # get '/sites' do
    #     @sites = Site.all
    #     erb :"/sites/index.html"
    # end

    get '/sites/:id/employees/new' do
      if logged_in?
        @site = Site.find_by_id(params[:id])
        if @site && @site.user == current_user
          erb :'employees/new.html'
        else
          redirect to '/sites'
        end
      else
        redirect to '/login'
      end
    end
    
    post '/sites/:id/employees' do
      @site = Site.find_by_id(params[:id])
      if logged_in?
        if params[:firstname] == "" || params[:lastname] == "" || params[:workdayid] == ""
          redirect to "/sites/#{@site.id}/employees/new"
        else
          
          @site.employees.build(firstname: params[:firstname], lastname: params[:lastname], workdayid: params[:workdayid])
          if @site.save
            redirect to "/sites/#{@site.id}"
          else
            redirect to "/sites/#{@site.id}/employees/new"
          end
        end
      else
        redirect to '/login'
      end
    end

    # post '/sites' do
    #     if logged_in?
    #       if params[:name] == "" || params[:sideid] == "" 
    #         redirect to "/sites/new"
    #       else
    #         @site = current_user.sites.build(name: params[:name], siteid: params[:siteid])
    #         if @site.save
    #           redirect to "/sites/#{@site.id}"
    #         else
    #           redirect to "/sites/new"
    #         end
    #       end
    #     else
    #       redirect to '/login'
    #     end
    #   end

    get '/sites/:id/employees/:workdayid' do
        if logged_in?
          @site = Site.find_by_id(params[:id])
          @employees = @site.employees
          @employee = @employees.find_by(workdayid: params[:workdayid])
          erb :'/employees/show.html'
        else
          redirect to '/login'
        end
    end

    get '/sites/:id/employees/:workdayid/employtrains' do
      if logged_in?
        @site = Site.find_by_id(params[:id])
        @employees = @site.employees
        @employee = @employees.find_by(workdayid: params[:workdayid])
        erb :'/employees/show2.html'
      else
        redirect to '/login'
      end
    end

    get '/sites/:id/employees/:workdayid/edit' do
        if logged_in?
          @site = Site.find_by_id(params[:id])
          @employees = @site.employees
          @employee = @employees.find_by(workdayid: params[:workdayid])
          if @site && @site.user == current_user
            erb :'employees/edit.html'
          else
            erb :'/employees/show.html'
          end
        else
          redirect to '/login'
        end
      end
            
    patch '/sites/:id/employees/:workdayid' do
        
        if logged_in?
          if params[:firstname] == "" || params[:lastname] == ""
            redirect to '/sites/:id/employees/:workdayid/edit'
          else
            @site = Site.find_by_id(params[:id])
            @employees = @site.employees
            @employee = @employees.find_by(workdayid: params[:workdayid])
            if @site && @site.user == current_user
              if @employee.update(firstname: params[:firstname], lastname: params[:lastname], workdayid: params[:workdayid])
                redirect to "/sites/#{@site.id}/employees/#{@employee.workdayid}"
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
    
    delete '/sites/:id/employees/:workdayid/delete' do
        if logged_in?
          @site = Site.find_by_id(params[:id])
          @employees = @site.employees
          @employee = @employees.find_by(workdayid: params[:workdayid])
          
          if @site && @site.user == current_user
            @employee.delete
          end
          redirect to "/sites/#{@site.id}"
        else
          redirect to '/login'
        end
      end
            
        
    

end 