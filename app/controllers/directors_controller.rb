class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all
    render ({ :template => "director_templates/index.html.erb"})
  end

  def youngest
    render ({ :template => "director_templates/youngest.html.erb"})
  end

  def eldest
    render ({ :template => "director_templates/eldest.html.erb"})
  end

end
