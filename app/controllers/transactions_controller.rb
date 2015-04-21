class TransactionsController < ApplicationController
  	before_action :set_movie

  	def new
  		@client_token = Braintree::ClientToken.generate
  	end

  	def create
  	end

  	private

  	def set_movie
  		@movie = Movie.find(params[:id])
	end
end
