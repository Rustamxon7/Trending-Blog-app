require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.feature 'Users Page' do
  feature 'shows users' do
    background do
      visit new_user_session_path
      @user1 = User.create(name: 'Rustamjon', bio: 'Rustamjon is Full-Stack developer',
                           photo: 'photo', email: 'good@gmail.com', confirmed_at: Time.now, password: '123456')
      @user2 = User.create(name: 'Ahmad', bio: 'Ahmad is Full-Stack developer',
                           photo: 'photo', email: 'great@gmail.com', confirmed_at: Time.now, password: '123456')

      within 'form' do
        fill_in 'Email', with: @user1.email
        fill_in 'Password', with: @user1.password
      end
      click_button 'Log in'
    end

    scenario 'I can see the username of all other users' do
      visit users_path
      expect(page).to have_content(@user2.name)
    end

    scenario 'I can see the profile picture for each user' do
      visit users_path
      expect(page).to have_css('img')
    end

    scenario 'I can see the number of posts each user has written' do
      Post.create(title: 'test', text: 'test', author_id: @user1.id)
      visit users_path
      expect(page).to have_content('Number of posts: 1')
    end

    scenario 'When I click on a user, I am redirected to that user\'s show page' do
      visit users_path
      click_link @user2.name
      expect(page).to have_content(@user2.name)
    end
  end
  # rubocop:enable Metrics/BlockLength
end
