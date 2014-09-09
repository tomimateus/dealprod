require 'spec_helper'

describe "clients_companies/show" do
  before(:each) do
    @clients_company = assign(:clients_company, stub_model(ClientsCompany,
      :client_id => 1,
      :company_id => 2,
      :weight => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
