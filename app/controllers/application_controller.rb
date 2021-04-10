require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
     ## gives access to patch/put and delete
     set :method_override, true
     enable :sessions
     set :session_secret, "some cool dope password"
  end

  get "/" do
    erb :welcome
  end

  get "/patients" do
    erb :patients
  end

  get "/strains" do
    erb :strains
  end

  # helpers do 
  #   def current_patient 
  #     @current_patient ||= Patient.find_by(id: session[:patient_id]) if session[:patient_id]
  #   end 

  #   def logged_in? 
  #     !!current_patient
  #   end 
  # end

end
