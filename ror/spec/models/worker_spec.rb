require 'rails_helper'

RSpec.describe Worker, type: :model do
  describe 'validations' do
    it 'validate presence of required fields' do
      should validate_presence_of(:email)
      should validate_presence_of(:name)
      should validate_presence_of(:last_name)
    end

    it 'validate relations' do
      should have_many(:departments)
    end

  end
end
