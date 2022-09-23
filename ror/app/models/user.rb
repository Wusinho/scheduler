class User < ApplicationRecord
  has_secure_password
  has_one :organization
  validates_uniqueness_of :email, :case_sensitive => true
  validates_format_of :email, with: /@/
  validates :password_digest, :username, :name, :last_name, presence: true
end
