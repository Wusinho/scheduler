class WorkerAvailableHr < ApplicationRecord
  belongs_to :worker, dependent: :destroy
end
