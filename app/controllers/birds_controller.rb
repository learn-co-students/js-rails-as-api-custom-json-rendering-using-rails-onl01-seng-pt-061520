class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species] #For a list of objects, only will display the values of the keys passed in
    #render json: birds, except: [:created_at, :updated_at] does the same as above, but excludes what is passed in
   
    #render json: birds.to_json(except: [:created_at, :updated_at]) same as above
    #just w/o Rails magic
  end

  def show 
    bird = Bird.find_by(id: params[:id])
    #render json: {id: bird.id, name: bird.name, species: bird.species } same as below just WET
    if bird
      render json: bird.slice(:id, :name, :species) #great for 1 hash and RETURNS a new one with the keys passed in to slice
    else
      render json: {message: 'Bird not found'}
    end
  end
end