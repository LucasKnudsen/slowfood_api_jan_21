require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :uid }
  end

  describe 'email registration' do
    it 'model should not save if email is blank' do
      resource = build(:user, email: nil)

      refute resource.save
      expect(resource.errors.messages[:email].first).to eq "can't be blank"
    end
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :email }

    it { is_expected.not_to allow_value('hey @.com').for(:email) }

    it { is_expected.to allow_value("user@email.com").for(:email) }
  end
end
