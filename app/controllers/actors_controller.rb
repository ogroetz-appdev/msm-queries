class ActorsController < ApplicationController
  def index
    @actors = Actor.all
    render ({ :template => "/actor_templates/index.html.erb"})
  end

  def details
    @id = params.fetch("id")
    @actor = Actor.where({ :id => @id }).at(0)

    @actor_characters = Character.where({ :actor_id => @id})
p @actor_characters

    # @actor_films = []
    @actor_characters.each do |character|
      # @actor_films.push(Movie.where( :id => character.movie_id).at(0))
    end

    render ({ :template => "/actor_templates/details.html.erb"})
  end

  def delete
    @id = params.fetch("id").to_i
    d = Actor.where( :id => @id).first
    d.destroy
    # flash[:notice] = "Actor was deleted."
    redirect_to ({ :action => "index"}), :notice => "Actor Deleted"
  end

end
