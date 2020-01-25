require 'rails_helper'

describe User, :model do
  context '(associations)' do
    it { should have_many :reviews }
  end

  context '(validations)' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_confirmation_of :password }
  end
  context '(encryption)' do
    it 'encrypts password' do
      User.destroy_all
      User.create!({email: 'email@address.com', password: 12345})
      user = User.authenticate('email@address.com', 12345)
      expect(user.password).to eq nil
    end
  end
end
