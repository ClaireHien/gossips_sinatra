require_relative 'gossip'
require_relative 'comment'

class ApplicationController < Sinatra::Base

  #afficher page index
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  
  #afficher page nouveau gossip
  get '/gossips/new/' do
    erb :new_gossip
  end

  #lancer le nouveau gossip
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  #afficher page d'un gossip
  get '/gossips/:id' do
    id = params['id'].to_i
    puts "numero ID : #{id}"
    Gossip.new("01", "02").find(id)
    erb :show, locals: {gossips: Gossip.all, comments: Comment.all}
  end

  #afficher page edit d'un gossip
  get '/gossips/:id/edit/' do
    erb :edit, locals: {gossips: Gossip.all}
  end

  #lancer l'édition d'un gossip
  post '/gossips/:id/edit' do
    id = params['id'].to_i
    Gossip.new(" "," ").update(params["gossip_author"], params["gossip_content"], id)
    redirect '/'
  end

  #lancer un commentaire de gossip
  post '/gossips/:id' do
    id = params[:id].to_i
    puts "numero ID : #{id} !!!"
    Comment.new(params["comment_author"], params["comment_content"], id).save
    redirect '/'
  end

end