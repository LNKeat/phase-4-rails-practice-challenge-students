class Student < ApplicationRecord
  belongs_to :instructor

  validates :name, presence: true
  validates :age, comparison: { greater_than: 18 }

  
end
