require 'rails_helper'

RSpec.describe 'foods/edit', type: :view do
  before(:each) do
    @food = assign(:food, Food.create!)
  end

  it 'renders the edit food form' do
    render

    assert_select 'form[action=?][method=?]', food_path(@food), 'post' do
    end
  end
end
