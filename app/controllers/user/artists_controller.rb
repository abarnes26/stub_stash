class User::ArtistsController < ApplicationController

  def index
  end

  def show
    unless current_user
      render_404
    end
  end

end