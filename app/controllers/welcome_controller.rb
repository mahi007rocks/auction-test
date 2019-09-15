class WelcomeController < ApplicationController
  def index
  	if params[:recent_projects].present?
  		@products = Product.order(:name).page(params[:page] || 1).per(3)
  	elsif params[:category_asc].present?
  		@products = Product.joins(:category).order("category.name ASC")
  	elsif params[:username_asc].present?
  		@products = Product.joins(:users).order("user.username ASC")
  	elsif params[:project_tite].present?
  		@products = Product.order(:title)
  	else 
  		@products = Product.page(params[:page] || 1).per(3)
  	end
  	respond_to do |format|
	    format.js
	    format.html
	end
  end
end
