require 'rails_helper'

RSpec.describe "api/v1s/new", :type => :view do
  before(:each) do
    assign(:api_v1, Api::V1::Book.new(
      :title => "MyString",
      :description => "MyString",
      :author => nil,
      :user => nil
    ))
  end

  it "renders new api_v1 form" do
    render

    assert_select "form[action=?][method=?]", api_v1_books_path, "post" do

      assert_select "input#api_v1_title[name=?]", "api_v1[title]"

      assert_select "input#api_v1_description[name=?]", "api_v1[description]"

      assert_select "input#api_v1_author_id[name=?]", "api_v1[author_id]"

      assert_select "input#api_v1_user_id[name=?]", "api_v1[user_id]"
    end
  end
end
