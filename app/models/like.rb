class Like < ApplicationRecord
  belongs_to :user
  belongs_to :idea

  validates :idea_id, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, presence: true

  #validates :is_up, inclusion: { in: [true, false]}

  #def is_down?
  # is_up == false
  #end

  #def self.up
  #  where(is_up: true)
  #end

  #def self.down
  #  where(is_up: false)
  #end

end
