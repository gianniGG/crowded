class Project < ActiveRecord::Base
  has_and_belongs_to_many :users

  before_save { self.name = name.downcase }

  validates :name, presence: true, length: { in: 4..30 }
  validates :mission_statement, presence: true, length: { in: 4..140 }

end
