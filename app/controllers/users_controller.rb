class UsersController < ApplicationController
  def index
    @user = current_user
  end 

  def friends
    @user = current_user
    @friendfinder = User.findfriends(current_user.id)
    @friendarray  = []
    @friendupdates = Update.where("user_id" => @friendarray)
    @friendarray << @friendfinder

    if current_user == nil
      redirect_to root_path, notice: "Sign up or login first!"
    elsif current_user.provider == "facebook"
      @graph = Koala::Facebook::API.new("CAACEdEose0cBAPl7or37ljeIRnZCLLjTf421dDs0hYCuUwnM2yC3UoNJt6eOhZATuSatTrOfEiHGfDdZBwnJD9ZCxR5O8G0Exr4gIDkZA83wlD53mFtTxAlVujwwlHG1BIDteJ6CiGlXp1zRZARsB0nZCnXYKxNUnEZD")

      @profile = @graph.get_object("me")
      @friends = @graph.get_connections("me", "friends")
      @registered_friends = Friend.where("user_id" => current_user.id)
      @updates = Update.where("user_id" => current_user.id)

      
      #@graph.put_connections("me", "feed", :message => "I am writing on my wall!")

      # three-part queries are easy too!
      #@graph.get_connections("me", "mutualfriends/#{friend_id}")

      # you can even use the new Timeline API
      # see https://developers.facebook.com/docs/beta/opengraph/tutorial/
      #@graph.put_connections("me", "namespace:action", :object => object_url)
    end
  end 
end
