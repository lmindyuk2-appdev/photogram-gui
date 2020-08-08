Rails.application.routes.draw do
  get("/",{ :controller => "users",:action => "index"})
  get("/users",{ :controller => "users",:action => "index"})
  get("/users/:username",{ :controller => "users",:action => "show"})

  get("/photos",{ :controller => "photos",:action => "index"})
  get("/photos/:path_id",{ :controller => "photos",:action => "show"})


  get("/delete_photo/:path_id",{ :controller => "photos",:action => "delete"})
  get("/insert_photos/",{ :controller => "photos",:action => "create"})
end
