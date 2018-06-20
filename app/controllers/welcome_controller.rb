class WelcomeController < ApplicationController

  def index
    if current_user
      redirect_to user_url(id: current_user.id)
    else
      render 'index'
    end
  end
end
