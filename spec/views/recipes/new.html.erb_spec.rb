require 'rails_helper'

RSpec.describe 'recipes/new', type: :view do
  before(:each) do
    assign(:recipe, Recipe.new)
  end

  it 'renders new recipe form' do
    render

    assert_select 'form[action=?][method=?]', recipes_path, 'post' do
    end
  end
end
