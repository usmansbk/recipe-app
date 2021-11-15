require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validates' do
    subject { FactoryBot.build :recipe }

    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have a cooking time' do
      subject.cooking_time = nil
      expect(subject).to_not be_valid
    end

    it 'should have a preparation time' do
      subject.preparation_time = nil
      expect(subject).to_not be_valid
    end

    it 'should have description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end
  end
end
