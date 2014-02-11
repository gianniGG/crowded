class AddFundsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :funds, :integer
  end
end
