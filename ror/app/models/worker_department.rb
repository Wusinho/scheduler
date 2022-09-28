class WorkerDepartment < ApplicationRecord
  belongs_to :department
  belongs_to :worker
end
