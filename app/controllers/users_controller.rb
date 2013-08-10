class UsersController < ApplicationController
  def index
    @user = current_user
  end 

  def friends
    @user = current_user

    if current_user == nil
      redirect_to root_path, notice: "Sign up or login first!"
    elsif current_user.provider == "facebook"
      @graph = Koala::Facebook::API.new("CAACEdEose0cBAGrZAGUsTZAUXW9zkqHgtM4ZBrHB1XgGwyXyZAyRAyO6Nuf20ilDotR5BVGZBnpGitOw7vPmCDv5wr3kEF51cMxA9wCv3rB0EJB3EVMsJGix97UAOVqCPconjgUr3kjko8p2dLGqerQ20rsz5nO0ZD")

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
