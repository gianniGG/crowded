class RemoveCreator < ActiveRecord::Migration
  def change
    remove_column :projects, :creator
  end
end
