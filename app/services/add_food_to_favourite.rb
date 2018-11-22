class AddFoodToFavourite
  attr_accessor :params

  def initialize(params)
    @user = params[:user]
    @fooditem = params[:fooditem]
  end

  def create
    @favourite = @fooditem.favourites.find_by(user_id: @user.id)
    if @favourite
      @favourite.delete
    else
      @fooditem.favourites.find_or_create_by(user_id: @user.id)
    end
  end
end
