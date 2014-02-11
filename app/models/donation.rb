class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :companies, through: :project
end
