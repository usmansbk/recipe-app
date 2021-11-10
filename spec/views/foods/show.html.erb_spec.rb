require 'rails_helper'

RSpec.describe 'foods/show', type: :view do
  before(:each) do
    @food = assign(:food, Food.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
