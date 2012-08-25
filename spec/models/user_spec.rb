require 'spec_helper'

describe User do

  describe "on validation" do
    it "should be valid" do
      build(:user).should be_valid
    end

    it "should validate login" do
      build(:user, :login => nil).should be_invalid
      build(:user, :login => 'me').should be_invalid
      build(:user, :login => '*'*16).should be_invalid
    end

    it "should have an unique login" do
      create :user do |user|
        build(:user, :login => user.login).should be_invalid
      end
    end

    it "should validate email" do
      build(:user, :email => nil).should be_valid
      build(:user, :email => 'invalid').should be_invalid
      create :user do |user|
        build(:user, :email => user.email).should be_invalid
      end
    end

    it "should validate password" do
      build(:user, :password => nil).should be_valid
      build(:user, :password => '*'*5).should be_invalid
      build(:user, :password => '*'*129).should be_invalid
    end
  end

end
