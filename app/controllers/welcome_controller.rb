class WelcomeController < ApplicationController
  def index
  	@products = Product.page(params[:page] || 1).per(3)
  	respond_to do |format|
	    format.js
	    format.html
	end
  end
end
