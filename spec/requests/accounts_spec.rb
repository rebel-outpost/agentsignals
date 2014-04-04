require 'spec_helper'

describe "Accounts" do
    describe "Account Admin" do
      describe 'with free account' do
        before do
          @account = FactoryGirl.create :account
          @admin_user = FactoryGirl.create :account_admin, account: @account
        end

        it 'has account dashboard' do

        end

        it "can edit account settings"
      end

      describe 'with paid account' do

        it "can add new user"
        it "sets user role"
        it "cannot add more than max allowed users"
      end

    end
end
