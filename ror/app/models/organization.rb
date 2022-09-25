class Organization < ApplicationRecord
  belongs_to :user
  has_many :departments
  validates :name, presence: true

end
