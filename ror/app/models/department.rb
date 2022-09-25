class Department < ApplicationRecord
  belongs_to :organization

  after_save :crt_department_configuration

  def crt_department_configuration
    DepartmentConfiguration.create(department_id: self.id, organization_id: self.organization_id)
  end
end
