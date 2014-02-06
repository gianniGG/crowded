class Project < ActiveRecord::Base
  has_and_belongs_to_many :users

  before_save { self.name = name.downcase }

  validates :name, presence: true
  validates :mission_statement, presence: true

end
