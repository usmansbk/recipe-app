require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates' do
    subject { FactoryBot.build :user }

    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end
end
