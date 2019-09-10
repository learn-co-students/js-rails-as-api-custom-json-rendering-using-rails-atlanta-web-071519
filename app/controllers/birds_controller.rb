class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, except: [:created_at, :updated_at]
  end

  def show
    # find_by returns nil which allows us to specify our own error messages
    bird = Bird.find_by(params[:id])
    if(bird)
      render json: {id: bird.id, name: bird.name, species: bird.species}
    else
      # if try to make request to a /birds/whatever API that does not exist
      # then the error message below will be returned to json 
      render json: {message: 'Bird not found'}
    end
  end
end