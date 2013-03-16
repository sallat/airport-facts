class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.float :rating
      t.text :review
      t.integer :user_id
      t.integer :airfield_id

      t.timestamps
    end
  end
end
