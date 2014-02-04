class AddNameAndMissionStatementToProject < ActiveRecord::Migration
  def change
    add_column :projects, :name, :string
    add_column :projects, :mission_statement, :string
  end
end
