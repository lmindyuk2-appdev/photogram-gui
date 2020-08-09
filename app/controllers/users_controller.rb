class UsersController < ActionController::Base
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:username=>:asc})
    render({ :template => "user_templates/index.html.erb"})
  end

  def show
    url_username = params.fetch("username")
    matching_usernames = User.where({:username => url_username})
    @the_user = matching_usernames.at(0)
    if @the_user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/show.html.erb"})
    end
  end

  def create
    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    input_owner_id = params.fetch("input_owner_id")
    a_new_photo = User.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id
    a_new_photo.save
    redirect_to("/photos/"+a_new_photo.id.to_s)
  end

  def update
    the_id = params.fetch("modify_id")
    matching_users = User.where({:id => the_id})
    the_user = matching_users.at(0)
    input_username = params.fetch("input_username")
    the_user.username = input_username
    the_user.save
    redirect_to("/users/"+the_user.username)
  end

end
