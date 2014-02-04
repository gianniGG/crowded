class AddCreatorAndDonorsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :donors, :string
  end
end
