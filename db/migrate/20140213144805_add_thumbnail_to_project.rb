class AddThumbnailToProject < ActiveRecord::Migration
  def change
    add_column :projects, :thumbnail, :string
  end
end
