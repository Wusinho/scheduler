class User < ApplicationRecord
  has_secure_password
  has_one :organization
  validates_uniqueness_of :email, :case_sensitive => true
  validates_format_of :email, with: /@/
  validates :password_digest, :username, :name, :last_name, presence: true

  before_save :add_first_sign_in_counter
  before_save :capitalize_name

  def add_first_sign_in_counter
    self.sign_in_count = 1
  end

  def capitalize_name
    self.name = name.capitalize
    self.last_name = last_name.capitalize
  end

end
