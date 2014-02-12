class AddCompanyInfoToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :company_info, :text
  end
end
