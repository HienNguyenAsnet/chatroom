class HomeController < ApplicationController
  def index
    @rooms = Room.paginate(page: params[:page], per_page: 11)
  end
end
