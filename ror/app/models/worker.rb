class Worker < ApplicationRecord
  has_many :departments, dependent: :destroy

  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: true
  validates_format_of :email, with: /@/
end
