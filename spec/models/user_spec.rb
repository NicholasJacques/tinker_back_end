require 'rails_helper'

RSpec.describe User, type: :model do

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  let(:user) { build(:user) }

  describe 'attributes' do
    it { expect(user).to respond_to(:email) }
    it { expect(user).to respond_to(:password) }
  end

  describe 'ActiveModel validations' do
    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_uniqueness_of(:email).case_insensitive }
    it { expect(user).to allow_value('test@test.com').for(:email) }
    it { expect(user).to_not allow_value('test123').for(:email) }
  end

  context 'callbacks' do
    let(:user) { create(:user) }

    it { expect(user).to callback(:downcase_email).before(:save) }
  end

end
