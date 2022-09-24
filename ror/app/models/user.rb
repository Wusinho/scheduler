class User < ApplicationRecord
  has_secure_password
  has_one :organization
  validates_uniqueness_of :email, :case_sensitive => true
  validates_format_of :email, with: /@/
  validates :password_digest, :username, :name, :last_name, presence: true

  before_save :add_first_sign_in_counter

  def add_first_sign_in_counter
    self.sign_in_count = 1
  end


end
