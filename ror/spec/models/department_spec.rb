require 'rails_helper'

RSpec.describe Department, type: :model do
  describe 'validations' do
    it 'validate presence of required fields' do
      should validate_presence_of(:name)
    end

    it 'validate relations' do
      should belong_to(:organization)
      should have_many(:worker_departments)
    end
  end
end
