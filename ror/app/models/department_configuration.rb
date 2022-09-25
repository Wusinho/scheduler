class DepartmentConfiguration < ApplicationRecord
  belongs_to :department
  belongs_to :organization
end
