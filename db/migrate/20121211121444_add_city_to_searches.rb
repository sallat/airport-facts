class AddCityToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :city, :string
  end
end
