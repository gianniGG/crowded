class AddProjectIdToDonation < ActiveRecord::Migration
  def change
    add_reference :donations, :project, index: true
  end
end
