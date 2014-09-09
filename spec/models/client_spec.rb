require 'spec_helper'

describe Client do

  before(:each) do
    @client = FactoryGirl.build(:client)
  end

  it "is valid with valid attributes" do
    @client.should be_valid
  end

  it "is not valid without a user" do
    @client.user_id = nil
    @client.should_not be_valid
  end

end