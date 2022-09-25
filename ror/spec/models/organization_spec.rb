require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe 'validations' do
    it 'validate presence of required fields' do
      should validate_presence_of(:name)
    end

    it 'validate relations' do
      should belong_to(:user)
    end
  end

end
