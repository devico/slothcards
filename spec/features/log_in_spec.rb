require 'rails_helper'

RSpec.feature "User log in", :type => :feature do

  scenario 'Registered user try to sign in' do
    User.create!(email: 'user@test.com', password: '12345678', password_confirmation: '12345678')

    visit new_session_path
    fill_in 'Email', with: 'user@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content 'Logged in!'
    expect(current_path).to eq root_path
  end

  scenario 'Unregistered user try to sign in' do
  
    visit new_session_path
    fill_in 'Email', with: 'user@user.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content 'Email or password was invalid'
    expect(current_path).to eq '/sessions'
  end

  scenario 'Register new user' do
    visit signup_path
    fill_in 'Email:', with: 'user@qwerty.com'
    fill_in 'Password:', with: '12345678'
    fill_in 'Password confirmation:', with: '12345678'
    click_on 'Create user'

    expect(page).to have_content 'Signed up!'
    expect(current_path).to eq root_path
  end
end
