require 'rails_helper'

RSpec.describe 'foods/new', type: :view do
  before(:each) do
    assign(:food, Food.new)
  end

  it 'renders new food form' do
    render

    assert_select 'form[action=?][method=?]', foods_path, 'post' do
    end
  end
end
