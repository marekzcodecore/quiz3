class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.boolean :is_up
   	  t.references :user, foreign_key: true, index: true
      t.references :idea, foreign_key: true, index: true
      t.timestamps
    end
  end
end
