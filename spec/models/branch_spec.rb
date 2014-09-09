require 'spec_helper'

describe Branch do

  before(:each) do
    @branch = FactoryGirl.build(:branch)
  end

  it "is valid with valid attributes" do
    @branch.should be_valid
  end

  it "is not valid without a company" do
    @branch.company_id = nil
    @branch.should_not be_valid
  end

  it "is not valid without a name" do
    @branch.name = nil
    @branch.should_not be_valid
  end

  it "is not valid with a short name" do
    @branch.name = "na"
    @branch.should_not be_valid
  end



end