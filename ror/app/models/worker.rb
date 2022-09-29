class Worker < ApplicationRecord
  has_many :worker_departments
  belongs_to :organization
  validates :email, :name, :last_name, presence: true
  validates_uniqueness_of :email, case_sensitive: true
  validates_format_of :email, with: /@/
end
