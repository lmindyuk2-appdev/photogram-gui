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
end