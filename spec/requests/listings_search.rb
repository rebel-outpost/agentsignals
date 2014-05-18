# require 'spec_helper'

# describe "Listings Search" do
#   before do
#     @p1 = create(:listing, title: "Property 1", description: 'pet friendly')
#     @p2 = create(:listing, title: "Property 2", description: '24 hr gym pet friendly')
#     @p3 = create(:listing, title: "Property 3", state: 'California')
#     ThinkingSphinx::Test.index
#     @user   = create :user
#     @account = create :account
#     @account.users << @user
#     login_as @user
#     visit listings_path
#   end

#   it 'finds listings with pet friendly', js: true do
#     fill_in 'query', with: 'pet friendly'
#     click_button 'Search Listings'
#     expect(page).to have_content 'Property 1'
#     expect(page).to have_content 'Property 2'
#     expect(page).not_to have_content 'Property 3'
#   end

#   it 'finds listing with 24 hour gym' do
#     fill_in 'query', with: '24 hr gym'
#     click_button 'Search Listings'
#     expect(page).to have_content 'Property 2'
#     expect(page).not_to have_content 'Property 1'
#     expect(page).not_to have_content 'Property 3'
#   end

#   it 'finds listings in California' do
#     fill_in 'query', with: 'California'
#     click_button 'Search Listings'
#     expect(page).to have_content 'Property 3'
#     expect(page).not_to have_content 'Property 1'
#     expect(page).not_to have_content 'Property 2'
#   end

# end