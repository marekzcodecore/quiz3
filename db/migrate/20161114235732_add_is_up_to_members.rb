class AddIsUpToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :is_up, :boolean
  end
end
