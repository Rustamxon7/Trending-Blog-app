require 'rails_helper'
RSpec.feature 'Logins', type: :feature do
  background { visit new_user_session_path }

  scenario 'I can see the username and password inputs and the "Submit" button' do
    expect(page).to have_field('Email')
    expect(page).to have_field('Password')
    expect(page).to have_button('Log in')
  end

  scenario ' I get a detailed error' do
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password')
  end

  scenario ' I get a detailed error' do
    fill_in 'Email', with: 'rustamjon@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password')
  end

  scenario 'I am redirected to the root page' do
    fill_in 'Email', with: 'rustamjon@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    expect(page).to have_content('Log in')
  end
end
