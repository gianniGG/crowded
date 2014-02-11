class CreateJoinTableDonationUser < ActiveRecord::Migration
  def change
    create_join_table :donations, :users do |t|
      # t.index [:donation_id, :user_id]
      # t.index [:user_id, :donation_id]
    end
  end
end
