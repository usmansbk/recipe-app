require 'rails_helper'

RSpec.describe 'recipes/show', type: :view do
  before(:each) do
    @recipe = assign(:recipe, Recipe.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
