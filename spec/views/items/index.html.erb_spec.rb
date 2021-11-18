require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(),
      Item.create!()
    ])
  end

  it "renders a list of items" do
    render
  end
end
