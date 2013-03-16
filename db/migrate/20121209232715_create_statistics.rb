class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.string :name
      t.text :decription
      t.integer :airfield_id

      t.timestamps
    end
  end
end
