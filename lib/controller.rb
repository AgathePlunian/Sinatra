$:.unshift File.expand_path("./../lib", __FILE__)
require 'gossip' 

class ApplicationController < Sinatra::Base
	get '/' do
		erb :index, locals: {variable: Gossip.all}
	end

	get '/gossips/new/' do
		erb :new_gossip
	end
	
	post '/gossips/new/' do
		Gossip.new(params["gossip_author"], params["gossip_content"]).save
		redirect '/'
	end

	get '/gossips/:id/' do 
		found = Gossip.find(params['id'].to_i)
		erb :show, locals: {variable: params['id'], auteur: found.author, gossip: found.content}
	end
	
end
