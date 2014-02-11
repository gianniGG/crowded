class AddOmniColumnsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :provider, :string
    add_column :companies, :uid, :string
  end
end
