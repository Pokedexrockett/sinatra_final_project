class StrainsController < ApplicationController

    #index
    get "/strains" do
        erb :"strains/index"
    end

    #new
    get "/strains/new" do
        erb :"strains/new"
    end

    #create
    post "/strains" do

    end

    #show
    get "/strains/:id" do
         erb :"/strains/show"
    end

    #edit
    get "/strains/:id/edit" do
        erb :"strains/edit"
    end

    #update
    patch "/strains/:id" do

    end

    #delete
    delete "/strains/:id" do

    end



    
end