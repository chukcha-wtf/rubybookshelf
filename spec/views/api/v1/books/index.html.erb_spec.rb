require 'rails_helper'

RSpec.describe "api/v1s/index", :type => :view do
  before(:each) do
    assign(:api_v1_books, [
      Api::V1::Book.create!(
        :title => "Title",
        :description => "Description",
        :author => nil,
        :user => nil
      ),
      Api::V1::Book.create!(
        :title => "Title",
        :description => "Description",
        :author => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of api/v1s" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
