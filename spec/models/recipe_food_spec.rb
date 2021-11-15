require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'validates' do
    subject { FactoryBot.build :recipe_food }

    it 'should have a quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'should have a quantity greater than zero' do
      subject.quantity = 0
      expect(subject).to_not be_valid
    end
  end
end
