require 'rails_helper'

RSpec.describe Department, type: :model do
  describe 'validations' do
    it 'validate presence of required fields' do
      should validate_presence_of(:name)
      should validate_presence_of(:supervised_hrs)
    end

    it 'validate relations' do
      should belong_to(:organization)
    end
  end
end
