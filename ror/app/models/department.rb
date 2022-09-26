class Department < ApplicationRecord
  belongs_to :organization
  validate :supervised_hrs_range
  validate :min_hrs_range

  # after_save :crt_department_configuration

  def supervised_hrs_range
    return unless self.supervised_hrs.length > 2

    errors.add :supervised_hrs, 'Can only add up to 2 ranges'
  end

  def min_hrs_range
    return if min_hrs_check(self.supervised_hrs)

    errors.add :supervised_hrs, 'Ranges must be greater than 4 hrs'
  end

  def min_hrs_check(supervised_hrs)
    check_hrs = spliting_supervised_hrs(supervised_hrs)
    ans = check_hrs.none? { |hr_range| hr_range < 4 }
    p '*'*100
    p ans
    p '*'*100

    ans
  end

  def spliting_supervised_hrs(supervised_hrs)
    supervised_hrs.map do |range|
      range.split('-').map(&:to_i).reverse.reduce(&:-)
    end
  end

  def crt_department_configuration
    DepartmentConfiguration.create(department_id: self.id, organization_id: self.organization_id)
  end
end
