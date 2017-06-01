require 'rails_helper'
require 'support/login_helper.rb'

RSpec.feature "User log in", :type => :feature do

  scenario 'Registered user try to create card' do
    user = FactoryGirl.create(:user)
    login("test@example.com","123654")
    visit new_card_path
    fill_in "Title:", with: "Title"
    fill_in 'Decision', with: "Decision"
    click_on 'Create card'

    expect(page).to have_content 'Title'
    expect(current_path).to eq cards_path
  end

  scenario 'Unregistered user try to create card' do
  
    visit root_path
    click_on 'New card'
    expect(page).to have_content 'First login to access this page'
    expect(current_path).to eq '/login'
  end
end

