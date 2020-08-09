class PhotosController < ActionController::Base
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:username=>:asc})
    render({ :template => "photos_templates/index.html.erb"})
  end
  def show
    url_photo = params.fetch("path_id")
    matching_photos = Photo.where({:id => url_photo})
    @the_photo = matching_photos.at(0)
    if @the_photo == nil
      redirect_to("/404")
    else
      render({ :template => "photos_templates/show.html.erb"})
    end
  end

  def delete
    url_photo = params.fetch("path_id")
    matching_photos = Photo.where({:id => url_photo})
    @the_photo = matching_photos.at(0)
    @the_photo.destroy
    redirect_to("/photos")
  end

  def create
    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    input_owner_id = params.fetch("input_owner_id")
    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id
    a_new_photo.save
    redirect_to("/photos/"+a_new_photo.id.to_s)
  end

  def update
    the_id = params.fetch("modify_id")
    matching_photos = Photo.where({:id => the_id})
    the_photo = matching_photos.at(0)
    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    the_photo.image = input_image
    the_photo.caption = input_caption
    the_photo.save
    redirect_to("/photos/"+the_photo.id.to_s)
  end

  def create_comment
    a_new_comment = Comment.new
    input_photo_id = params.fetch("input_photo_id")
    input_author_id = params.fetch("input_author_id")
    input_body = params.fetch("input_body")
    a_new_comment.author_id = input_author_id
    a_new_comment.photo_id = input_photo_id
    a_new_comment.body = input_body
    a_new_comment.save
    redirect_to("/photos/"+input_photo_id.to_s)
  end

end