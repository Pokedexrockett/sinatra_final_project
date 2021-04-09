class StrainsController < ApplicationController

    #index 
    get "/strains" do 
      if current_patient 
      @strains = current_patient.strains
      erb :"strains/index"
      end 
    end 
  
    #new 
    get "/strains/new" do 
      if logged_in
      erb :"strains/new"
      elseredirect to "/sign_up"
    end
  
    #create 
    post "/strains" do 
      ## validate the params 
  
      ## for your projects feel free to use model vals if you know what they are. 
      if !logged_in? && params[:name] == "" || params[:type] == "" || params[:form] == "" || params[:thc] == "" || params[:cbd] == "" || params[:review] == ""
        redirect to "/strain/new"
      else 
        @strain = strain.new(params[:strains])
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
      @post = Strain.find_by_id(params[:id])
      if logged_in?
      if @strain 
        erb :"/strains/show"
      else 
        redirect to "/strains"
      end
      end 
    end 
  
    #edit 
    get "/strains/:id/edit" do 
      if logged_in?
        @strain = Strain.find_by_id(params[:id])
        if logged_in? && @strain.patient == current_patient
        if @strain  && @strain.patient == current_patient
          erb :"/strains/edit"
        else 
          rediect to "/strains"
        end
      else 
        rediect to "/sign_up"
      end 
    end 
  
    #update 
    patch "/strains/:id" do 
      if !logged_in? && params[:name] == "" || params[:type] == "" || params[:form] == "" || params[:thc] == "" || params[:cbd] == "" || params[:review] == ""
        redirect to "/strains/#{params[:id]}/edit"
      else 
        @post = Strain.find_by_id(params[:id])
        if @strain && @strain.update(params[:strains])
          redirect to "/strains/#{@strain.id}"
        else 
          redirect to "/strains/#{params[:id]}/edit"
        end
      end 
    end 
  
    #delete
    #delete "/strains/:id"
    delete "/strains/:id/delete" do 
      @strain = Strain.find_by_id(params[:id])
      if @strain 
        @strain.delete
      end
      redirect to "/strains"
    end 
  end 