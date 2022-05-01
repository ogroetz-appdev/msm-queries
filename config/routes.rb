Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "homepage" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/youngest", { :controller => "directors", :action => "youngest" })
  get("/directors/eldest", { :controller => "directors", :action => "eldest" })
  get("/directors/:id", { :controller => "directors", :action => "details" })
  get("/delete_director/:id", { :controller => "directors", :action => "delete" })

  get("/movies", { :controller => "movies", :action => "index"})
  get("/movies/:id", { :controller => "movies", :action => "details" })
  get("/delete_movie/:id", { :controller => "movies", :action => "delete" })

  get("/actors", { :controller => "actors", :action => "index"})
  get("/actors/:id", { :controller => "actors", :action => "details" })
  get("/delete_actor/:id", { :controller => "actors", :action => "delete" })
end
