require 'spec_helper'

describe Title do              

  before(:each) do
    @title = FactoryGirl.build(:title)
  end

  it "is valid with valid attributes" do
    @title.should be_valid
  end

  it "is not valid without a name" do
    @title.name = nil
    @title.should_not be_valid
  end

  it "is not valid with a short name" do
    @title.name = "h"
    @title.should_not be_valid
  end

  it "is not valid with a long name" do
    @title.name = "long long long long long long long long long long preference name"
    @title.should_not be_valid
  end

end