require 'spec_helper'

describe "clients_companies/index" do
  before(:each) do
    assign(:clients_companies, [
      stub_model(ClientsCompany,
        :client_id => 1,
        :company_id => 2,
        :weight => 3
      ),
      stub_model(ClientsCompany,
        :client_id => 1,
        :company_id => 2,
        :weight => 3
      )
    ])
  end

  it "renders a list of clients_companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
