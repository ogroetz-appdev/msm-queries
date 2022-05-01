class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all
    render ({ :template => "director_templates/index.html.erb"})
  end

  def youngest
    @list_of_directors = Director.all
    @directors = Director.order('dob ASC')

    @youngest = @directors[-1]
    @youngest_name = @youngest.name
    @youngest_date = (@youngest.dob).strftime("%b %e, %Y")

    render ({ :template => "director_templates/youngest.html.erb"})
  end

  def eldest
    @list_of_directors = Director.all
    @directors = Director.order('dob ASC')

    x = 0
    while @directors[x].dob == nil 
      x += 1
    end
    @eldest = @directors[x]
    @eldest_name = @eldest.name
    @eldest_date = (@eldest.dob).strftime("%b %e, %Y")
    render ({ :template => "director_templates/eldest.html.erb"})
  end

  def details

    @id = params.fetch("id").to_i
    director = Director.all.where({ :id => @id})
    @director = director[0]

    @films = Movie.all
    @director_films = Movie.all.where( :director_id => @director.id)
    p @director_films.count
    render ({ :template => "director_templates/details.html.erb"})
  end

end
