class ChangeColumnTargetToProject < ActiveRecord::Migration
  def change
    change_column :projects, :target, :integer, default: 2000
  end
end
