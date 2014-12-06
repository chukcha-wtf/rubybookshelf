require 'rails_helper'

RSpec.describe "api/v1s/show", :type => :view do
  before(:each) do
    @api_v1 = assign(:api_v1, Api::V1::Book.create!(
      :title => "Title",
      :description => "Description",
      :author => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
