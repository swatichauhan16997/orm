class ImagesController < ApplicationController
before_action :set_restaurant

  def create
    add_more_images(images_params[:images])
    flash[:error] = "Failed uploading images" unless @restaurant.save
    @restaurant = Restaurant.find(params[:restaurant_id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting image" unless @restaurant.save
    @restaurant = Restaurant.find(params[:restaurant_id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def add_more_images(new_images)
    images = @restaurant.images # copy the old images 
    images += new_images # concat old images with new ones
    @restaurant.images = images # assign back
  end

  def remove_image_at_index(index)
    remain_images = @restaurant.images # copy the array
    deleted_image = remain_images.delete_at(index) # delete the target image
    deleted_image.try(:remove!) # delete image from S3
    @restaurant.images = remain_images # re-assign back
  end

  def images_params
    params.require(:restaurant).permit({images: []}) # allow nested params as array
  end
end
