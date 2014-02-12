class ChangePointsColumnOnDonation < ActiveRecord::Migration
  def change
    change_column :donations, :points, :integer, default: 0
  end
end
