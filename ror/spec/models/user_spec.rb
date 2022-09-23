require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'validate presence of required fields' do
      should validate_presence_of(:username)
      should validate_presence_of(:name)
      should validate_presence_of(:last_name)
      should validate_presence_of(:password_digest)
    end

    it 'validate relations' do
      should have_one(:organization)
    end

  end
end
