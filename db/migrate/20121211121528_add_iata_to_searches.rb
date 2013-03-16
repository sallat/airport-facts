class AddIataToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :iata, :string
  end
end
