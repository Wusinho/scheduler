class User < ApplicationRecord
  has_secure_password
  has_one :organization
  has_many :department, dependent: :destroy

  validates_uniqueness_of :email, case_sensitive: true
  validates_format_of :email, with: /@/
  validates :password_digest, :username, :name, :last_name, presence: true

  validate :password_complexity
  before_save :add_sign_in_counter
  before_save :capitalize_name

  accepts_nested_attributes_for :organization
  def add_sign_in_counter
    self.sign_in_count += 1
  end

  def capitalize_name
    self.name = name.capitalize
    self.last_name = last_name.capitalize
  end

  def password_complexity
    return unless password.present? && !password.match(/^(?=.*[A-Za-z])(?=.*\d).{8,}$/)

    errors.add :password, 'Password must be at least 8 characters long and contain at least 1 number, 1 uppercase character and 1 lowercase character.'
  end
end
