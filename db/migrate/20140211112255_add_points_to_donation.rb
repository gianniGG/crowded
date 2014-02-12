class AddPointsToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :points, :integer, default: 0
  end
end
