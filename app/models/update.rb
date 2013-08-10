class Update < ActiveRecord::Base
  attr_accessible :link, :myupdate
  belongs_to :user 
end
