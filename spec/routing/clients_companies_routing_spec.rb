require "spec_helper"

describe ClientsCompaniesController do
  describe "routing" do

    it "routes to #index" do
      get("/clients_companies").should route_to("clients_companies#index")
    end

    it "routes to #new" do
      get("/clients_companies/new").should route_to("clients_companies#new")
    end

    it "routes to #show" do
      get("/clients_companies/1").should route_to("clients_companies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/clients_companies/1/edit").should route_to("clients_companies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/clients_companies").should route_to("clients_companies#create")
    end

    it "routes to #update" do
      put("/clients_companies/1").should route_to("clients_companies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/clients_companies/1").should route_to("clients_companies#destroy", :id => "1")
    end

  end
end
