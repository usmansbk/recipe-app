require 'rails_helper'

RSpec.describe 'recipes/edit', type: :view do
  before(:each) do
    @recipe = assign(:recipe, Recipe.create!)
  end

  it 'renders the edit recipe form' do
    render

    assert_select 'form[action=?][method=?]', recipe_path(@recipe), 'post' do
    end
  end
end
