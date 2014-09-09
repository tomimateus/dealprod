require 'spec_helper'

describe Company do

  before(:each) do
    @company = FactoryGirl.build(:company)
  end

  it "is valid with valid attributes" do
    @company.should be_valid
  end

  it "is not valid without a user" do
    @company.user_id = nil
    @company.should_not be_valid
  end

  it "is not valid without a name" do
    @company.name = nil
    @company.should_not be_valid
  end

end