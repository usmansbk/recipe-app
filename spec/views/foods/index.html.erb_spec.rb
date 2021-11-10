require 'rails_helper'

RSpec.describe 'foods/index', type: :view do
  before(:each) do
    assign(:foods, [
             Food.create!,
             Food.create!
           ])
  end

  it 'renders a list of foods' do
    render
  end
end
