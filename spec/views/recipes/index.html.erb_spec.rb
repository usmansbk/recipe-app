require 'rails_helper'

RSpec.describe 'recipes/index', type: :view do
  before(:each) do
    assign(:recipes, [
             Recipe.create!,
             Recipe.create!
           ])
  end

  it 'renders a list of recipes' do
    render
  end
end
