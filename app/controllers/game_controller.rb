require 'pry'
class GameController < ApplicationController

    get '/games/new' do 
        if logged_in?
            erb :'/games/new'
        else 
            flash[:alert] = "Please login to post a game"
            redirect "/users/login"
        end 
    end 

    post '/games' do 
        @game = Game.create(
            title: params[:title], 
            release_date: params[:release_date], 
            description: params[:description]
        )
        current_user.games << @game
        redirect "/games/#{@game.id}"
    end  

    get '/games/:id' do 
        @game = Game.find(params[:id])
        erb :'/games/show'
    end 

    get '/games' do 
        @games = Game.all  
        erb :'/games/index'
    end 

    get '/games/:id/edit' do 
        @game = Game.find(params[:id])
        erb :'/games/edit'
    end 

    post '/games/:id' do 
        @game = Game.find(params[:id])
        @game.update(
            title: params[:title], 
            release_date: params[:release_date], 
            description: params[:description]
        )
        redirect "/games/#{@game.id}"
    end 

    delete '/games/:id' do
        @game = Game.find(params[:id])
        @game.delete
        redirect '/games'
    end  
end