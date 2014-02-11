class Project < ActiveRecord::Base
  belongs_to :company
  has_many :donations

  before_save { self.name = name.downcase }
  before_save { self.funds = 0 }

  validates :name, presence: true
  validates :mission_statement, presence: true

end
