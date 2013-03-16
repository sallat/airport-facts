class AddAltitudeToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :altitude, :integer
  end
end
