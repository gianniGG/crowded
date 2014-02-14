class Project < ActiveRecord::Base

  belongs_to :company
  has_many :donations
  has_many :users, through: :donations

  before_create { self.name = name.capitalize }

  validates :name, presence: true

  def donations_total
    donations.sum(:amount)
  end

  def recent_five
    donations.last(5)
  end

end
