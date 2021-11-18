require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
