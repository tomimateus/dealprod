require 'spec_helper'

describe "clients_companies/new" do
  before(:each) do
    assign(:clients_company, stub_model(ClientsCompany,
      :client_id => 1,
      :company_id => 1,
      :weight => 1
    ).as_new_record)
  end

  it "renders new clients_company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", clients_companies_path, "post" do
      assert_select "input#clients_company_client_id[name=?]", "clients_company[client_id]"
      assert_select "input#clients_company_company_id[name=?]", "clients_company[company_id]"
      assert_select "input#clients_company_weight[name=?]", "clients_company[weight]"
    end
  end
end
