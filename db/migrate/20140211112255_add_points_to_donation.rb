class AddPointsToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :points, :integer
  end
end
