class Department < ApplicationRecord
  belongs_to :organization
  has_many :worker_departments
  validates :name, :supervised_hrs, presence: true
  validate :empty_hrs_range, :supervised_hrs_range, :min_hrs_range

  after_save :crt_department_configuration

  def empty_hrs_range
    return unless supervised_hrs && supervised_hrs.first.empty?

    errors.add :supervised_hrs, 'Range hrs is empty'
  end

  def supervised_hrs_range
    return unless supervised_hrs && supervised_hrs.length > 2

    errors.add :supervised_hrs, 'Can only add up to 2 ranges'
  end

  def min_hrs_range
    return unless supervised_hrs
    return if supervised_hrs.first.empty? || min_hrs_check(supervised_hrs)

    errors.add :supervised_hrs, 'Ranges must be greater than 4 hrs'
  end

  def min_hrs_check(supervised_hrs)
    check_hrs = split_supervised_hrs(supervised_hrs)
    check_hrs.none? { |hr_range| hr_range < 4 }
  end

  def split_supervised_hrs(supervised_hrs)
    supervised_hrs.map do |range|
      range.split('-').map(&:to_i).reverse.reduce(&:-)
    end
  end

  def crt_department_configuration
    DepartmentConfiguration.create(department_id: self.id, organization_id: self.organization_id)
  end
end
