class AddIdeaRefToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :idea, foreign_key: true
  end
end
