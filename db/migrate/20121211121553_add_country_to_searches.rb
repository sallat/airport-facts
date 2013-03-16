class AddCountryToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :country, :string
  end
end
