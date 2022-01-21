class HomeController < ApplicationController
  def index
  	@victories = Victory.all
  end
  def about
  end
end
