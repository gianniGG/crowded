class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :amount
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
