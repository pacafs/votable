class TransactionsController < ApplicationController
  	before_action :set_movie
    before_filter :authenticate_user!
  	
    def new
      @client_token = Braintree::ClientToken.generate(:customer_id => current_user.customer_id)
      respond_to do |format|
        format.html
      end
  	end

  	def create
      respond_to do |format|
        # create Braintree customer if still not created
        unless current_user.customer_id
          result = Braintree::Customer.create( 
            :email => current_user.email, 
            :payment_method_nonce => params[:payment_method_nonce] 
          )
          if result.success?
            current_user.update(customer_id: result.customer.id)
          else
            p result.errors
            format.html {redirect_to purchase_movie_path, notice: "Error creating customer account"}
          end
        end

        # Perform transaction for the current customer
        result = Braintree::Transaction.sale(
          :customer_id => current_user.customer_id,
          :amount => @movie.price
        )

        if result.success?
          format.html {redirect_to movies_path, notice: "Movie successfully purchased"} 
        else
          p result.errors
          format.html {redirect_to purchase_movie_path, notice: "Error performing transaction"}
        end        
      end      
  	end

  	private

  	def set_movie
  		@movie = Movie.find(params[:id])
	end
end
