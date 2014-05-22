require 'spec_helper'

describe Showing do
  
  describe :create_showing_name do
    before do
      @user = FactoryGirl.create :user 
      @client = FactoryGirl.create :client, assignee_id: @user.id
    end

    it "should assign the showing name to be the clients first and last name" do
      @showing = FactoryGirl.create :showing, contact_id: @client.id, user: @user
      @showing.name.should eq @client.full_name
    end
  end

  
end