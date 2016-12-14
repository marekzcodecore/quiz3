class Idea < ApplicationRecord
  belongs_to :user
  # belongs_to :likes

  has_many :members, dependent: :destroy
  has_many :users, through: :members


  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  has_many :comments, dependent: :destroy
  has_many :commentors, through: :comments, source: :user

 def like_for(user)
    likes.find_by(user: user)
 end

 def member_for(user)
   members.find_by(user: user)
 end

def comment_for(user)
	comments.find_by(user: user)
end


 def like_value
   likes.up.count - likes.down.count
 end

 def member_value
 	members.up.count - members.down.count
 end

private


end
