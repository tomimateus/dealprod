require 'spec_helper'

describe AdminUser do

  before(:each) do
    @admin_user = FactoryGirl.build(:admin_user)
  end

  it "is valid with valid attributes" do
     @admin_user.should be_valid
  end

  it "is not valid without an email" do
     @admin_user.email = nil
     @admin_user.should_not be_valid
  end

  it "is not valid without a password" do
     @admin_user.password = nil
     @admin_user.should_not be_valid
  end

end