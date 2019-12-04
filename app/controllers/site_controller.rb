class SiteController < ApplicationController

    get '/sites' do
        "A list of publically available sites"
    end

    get '/sites/new' do
        if !logged_in?
            redirect "/login"
        else 
            "A new site form"
        end
    end

    get '/sites/:id/edit' do
        if !logged_in?
            redirect "/login"
        else 
            "An edit post form"
        end
        
    end

end 