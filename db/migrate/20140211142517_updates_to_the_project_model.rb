class UpdatesToTheProjectModel < ActiveRecord::Migration
  def change
    rename_column :projects, :mission_statement, :headline
    add_column :projects, :target, :integer
    add_column :projects, :duration, :integer
    add_column :projects, :project_info, :text
    rename_column :projects, :funds, :funds_raised
    add_column :projects, :hit_target, :boolean
    add_column :projects, :approved, :boolean
    add_column :projects, :company_editable, :boolean
  end
end
