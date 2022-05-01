class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render ({ :template => "/movie_templates/index.html.erb"})

  end

  def details
    @id = params.fetch("id").to_i
    @movie = Movie.where({ :id => @id}).at(0)
    render ({ :template => "/movie_templates/details.html.erb"})
  end

  def delete
    @id = params.fetch("id").to_i
    d = Movie.where( :id => @id).first
    d.destroy
    redirect_to ({ :action => "index"})
  end

end
