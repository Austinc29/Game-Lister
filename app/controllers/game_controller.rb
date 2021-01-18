class GameController < ApplicationController

    get '/games/new' do 
        if logged_in?
            erb :'/games/new'
        else 
            flash[:alert] = "Please login to place an order"
            redirect "/users/login"
        end 
    end 

    post '/games' do 
        @game = Game.create(
            order_date: params[:order_date], 
            food_item: params[:food_item], 
            quantity: params[:quantity],
            total: params[:item_price].to_i * params[:quantity].to_i
        )
        current_user.games << @game 
        redirect "/games/#{@game.id}"
    end 

    get '/games/:id' do 
        @games = Game.find(params[:id])
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
            address: params[:address], 
            item: params[:item], 
            item_price: params[:item_price], 
            total: params[:total]
        )
        redirect "/games/#{@game.id}"
    end 

    delete '/games/:id' do
        @game = Game.find(params[:id])
        @game.delete
        redirect '/games'
    end  
end