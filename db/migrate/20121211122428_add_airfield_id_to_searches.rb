class AddAirfieldIdToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :airfield_id, :integer
  end
end
