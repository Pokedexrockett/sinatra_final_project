class StrainsController < ApplicationController

    #index
    get "/strains" do
        if current_patient
        @strains = Strain.all
        erb :"strains/index"
        end
    end

    #new
    get "/strains/new" do
        erb :"strains/new"
    end

    #create
    post "/strains" do

        if params[:name] == "" || params[:form] == "" || params[:thc] == "" || params[:cbd] == "" || params[:review] == ""
            redirect to "/strains/new"
        else 
            @strain = Strain.new(params[:strains])
            ## verify no SQL injection
            if @strain.save
              redirect to "/strains/#{@strain.id}"
            else 
              redirect to "/strains/new"
            end
        end   
    end

    #show
    get "/strains/:id" do
        @strain = Strain.find_by_id(params[:id])
        if @strain 
          erb :"/strains/show"
        else 
          redirect to "/strains"
        end 
    end

    #edit
    get "/strains/:id/edit" do
        @strain = Strain.find_by_id(params[:id])
        if @strain 
          erb :"/strains/edit"
        else 
          rediect to "/strains"
        end
    end

    #update
    patch "/strains/:id" do
        if params[:name] == "" || params[:form] == "" || params[:thc] == "" || params[:cbd] == "" || params[:review] == ""
            redirect to "/strains/#{params[:id]}/edit"
          else 
            @strain = Strain.find_by_id(params[:id])
            if @strain && @strain.update(params[:strains])
              redirect to "/strains/#{@strain.id}"
            else 
              redirect to "/strains/#{params[:id]}/edit"
            end
        end 
    end

    #delete
    delete "/strains/:id" do
        @strain = Strain.find_by_id(params[:id])
        if @strain 
          @strain.delete
        end
        redirect to "/strains"
    end
end



 
