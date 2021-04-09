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
        redirect to "/posts/new"
      else 
        @post = Post.new(params[:posts])
        ## verify no SQL injection
        if @post.save
          redirect to "/posts/#{@post.id}"
        else 
          redirect to "/posts/new"
        end
      end 
    end 
  
    #show 
    get "/posts/:id" do 
      @post = Post.find_by_id(params[:id])
      if logged_in?
      if @post 
        erb :"/posts/show"
      else 
        redirect to "/posts"
      end
      end 
    end 
  
    #edit 
    get "/posts/:id/edit" do 
      if logged_in?
        @post = Post.find_by_id(params[:id])
        if logged_in? && @post.user == current_user
        if @post  && @post.user == current_user
          erb :"/posts/edit"
        else 
          rediect to "/posts"
        end
      else 
        rediect to "/sign_up"
      end 
    end 
  
    #update 
    patch "/posts/:id" do 
      if !logged_in? && params[:title] == "" || params[:subject] == "" || params[:content] == ""
        redirect to "/posts/#{params[:id]}/edit"
      else 
        @post = Post.find_by_id(params[:id])
        if @post && @post.update(params[:posts])
          redirect to "/posts/#{@post.id}"
        else 
          redirect to "/posts/#{params[:id]}/edit"
        end
      end 
    end 
  
    #delete
    #delete "/posts/:id"
    delete "/posts/:id/delete" do 
      @post = Post.find_by_id(params[:id])
      if @post 
        @post.delete
      end
      redirect to "/posts"
    end 
  end 