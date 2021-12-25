require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.feature 'User #Show', type: :feature do
  background do
    visit new_user_session_path
    @user1 = User.create(name: 'Rustamjon', bio: 'Rustamjon is Full-Stack developer',
                         photo: 'photo', email: 'good@gmail.com', confirmed_at: Time.now, password: '123456')
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
  end

  scenario 'I can see the user\'s profile picture' do
    visit user_path(@user1)
    expect(page).to have_css('img')
  end

  scenario 'I can see the user\'s username' do
    visit user_path(@user1)
    expect(page).to have_content(@user1.name)
  end

  scenario 'I can see the number of posts the user has written' do
    Post.create(title: 'test', text: 'test', author_id: @user1.id)
    visit user_path(@user1)
    expect(page).to have_content('Number of posts: 1')
  end

  scenario 'I can see the user\'s bio' do
    visit user_path(@user1)
    expect(page).to have_content(@user1.bio)
  end

  scenario 'I can see the user\'s first 3 posts' do
    Post.create(title: 'test', text: 'test', author_id: @user1.id)
    Post.create(title: 'test', text: 'test', author_id: @user1.id)
    Post.create(title: 'test', text: 'test', author_id: @user1.id)
    visit user_path(@user1)
    expect(page).to have_content('test')
  end

  scenario 'I can see a button that lets me view all of a user\'s posts' do
    visit user_path(@user1)
    expect(page).to have_link('All posts', href: user_posts_path(@user1))
  end

  scenario 'When I click a user\'s post, it redirects me to that post\'s show page' do
    Post.create(title: 'test', text: 'test', author_id: @user1.id)
    visit user_path(@user1)
    click_link 'test'
    expect(page).to have_content('test')
  end

  scenario 'When I click to see all posts, it redirects me to the user\'s post\'s index page' do
    Post.create(title: 'test', text: 'test', author_id: @user1.id)
    visit user_path(@user1)
    click_link 'All posts'
    expect(page).to have_content('test')
  end
  # rubocop:enable Metrics/BlockLength
end
