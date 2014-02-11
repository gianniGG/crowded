class ChangePointsOnProject < ActiveRecord::Migration
  def change
    change_column :projects, :funds, :integer, default: 0
  end
end
