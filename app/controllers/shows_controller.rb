class ShowsController < ApplicationController

  def new
    @show = Show.new
  end

  def create
    @show = Show.new(show_params)
    if @show.save
      flash[:notice] = "A New Venue has been created!"
      redirect_to shows_path
    else
      flash[:notice] = "Venue was not created"
      render :new
    end
  end

  def index

  end

  private
    def show_params
    binding.pry
    end

end
