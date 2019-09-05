class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds
    #no need for instance variables since no longer using ERB
    #rendering to JSON
  end

  def show
    bird = Bird.find_by(id: params[:id])
    render json: bird
  end
end