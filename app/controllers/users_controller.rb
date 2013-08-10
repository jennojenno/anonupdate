class UsersController < ApplicationController
  def index
  end 

  def friends
    @user = current_user
    if current_user.provider == "facebook"
      @graph = Koala::Facebook::API.new("CAACEdEose0cBADZBXtu5Ak6p7oeaC8JIEYnTh5eUUww49dQ2Fnq0jJWUwiBbMKZAOXO8AoVpqQAoiziJSwKmVOX4ZCutzgGohXu5m5sSFDZCf3QvAINGz1sIqfhT6leJXuzvTKYwN2UZC1Alb8671L66uvyhslCgZD")

      @profile = @graph.get_object("me")
      @friends = @graph.get_connections("me", "friends")
      @registered_friends = Friend.where("user_id" => current_user.id)
      @updates = Update.where("user_id" => current_user.id)

      @friendupdates = Update.where("user_id" => @friendarray)
      #@graph.put_connections("me", "feed", :message => "I am writing on my wall!")

      # three-part queries are easy too!
      #@graph.get_connections("me", "mutualfriends/#{friend_id}")

      # you can even use the new Timeline API
      # see https://developers.facebook.com/docs/beta/opengraph/tutorial/
      #@graph.put_connections("me", "namespace:action", :object => object_url)
    end
  end 
end
