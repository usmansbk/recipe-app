require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new())
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do
    end
  end
end
