class PatientsController < ApplicationController

    get "/sign_up" do 
      erb :"/patients/new"
    end 
  
    post "/sign_up" do 
      if params[:patient][:password] == params[:patient][:password_confirmation] && params[:patient][:email] && params[:patient][:username]
        @patient = Patient.new(params[:patient])
        if @patient.save 
          session[:patient_id] = @patient.id
          redirect to "/strains"
        else 
          redirect to "/sign_up"
        end
      else 
        redirect to "/sign_up"
      end 
    end 
  
  end