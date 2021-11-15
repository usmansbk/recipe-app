require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validates' do
    subject { FactoryBot.build :food }

    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have a measurement unit' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end

    it 'should have a price' do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'should have price greater than zero' do
      subject.price = 0
      expect(subject).to_not be_valid
    end
  end
end
