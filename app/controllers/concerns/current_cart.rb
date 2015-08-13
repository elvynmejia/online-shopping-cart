#Prevents Rails from ever making set_cart available as an action on the controller
#Allows to share common code between controllers
module CurrentCart
	extend ActiveSupport::Concern

	private 
		#Returns a cart
		def set_cart
			@cart = Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
			@cart = Cart.create
			session[:cart_id] = @cart.id
		end 
end 