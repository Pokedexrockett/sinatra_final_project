class SessionsController < ApplicationController

    get "/login" do 
      erb :"/patients/login"
    end 
  
    post "/login" do 
      @user = Patient.find_by(email: params[:email])
      if @patient && @patient.authenticate(params[:patient][:password])
        session[:patient_id] = @patient.id
        redirect to "/strains"
      else 
        redirect to "/login"
      end 
    end 
  
    get "/logout" do 
      session.destroy 
      redirect to "/sign_up"
    end 
  
  end