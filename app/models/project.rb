class Project < ActiveRecord::Base

  belongs_to :company
  has_many :donations

  before_create { self.name = name.downcase }

  validates :name, presence: true
  validates :mission_statement, presence: true

end
