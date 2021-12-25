require 'rails_helper'
RSpec.feature 'Posts #Index', type: :feature do
  background do
    visit new_user_session_path
    @user1 = User.create(name: 'Rustamjon', bio: 'Rustamjon is Full-Stack developer', photo: 'photo', email: 'good@gmail.com', confirmed_at: Time.now, password: '123456')
    within 'form' do
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
    end
    click_button 'Log in'
  end

  scenario 'show user\'s profile picture.' do
    visit posts_path
    expect(page).to have_css('img')
  end

  scenario 'user\'s username' do
    visit posts_path
    expect(page).to have_content(@user1.name)
  end

  scenario 'number of posts the user has written' do
    Post.create(title: 'test', text: 'test', author_id: @user1.id)
    visit posts_path
    expect(page).to have_content('Number of posts: 1')
  end

  scenario 'post\'s title' do
    Post.create(title: 'test', text: 'test', author_id: @user1.id)
    visit posts_path
    expect(page).to have_content('test')
  end

  scenario 'post\'s body' do
    Post.create(title: 'test', text: 'test', author_id: @user1.id)
    visit posts_path
    expect(page).to have_content('test')
  end

  scenario 'first comments on a post' do
    Post.create(title: 'test', text: 'test', author_id: @user1.id)
    Comment.create(text: 'Wow really amazing post 😊👏', author_id: @user1.id, post_id: Post.last.id)
    visit posts_path
    expect(page).to have_content('Wow really amazing post 😊👏')
  end

  scenario 'how many comments a post has' do
    Post.create(title: 'test', text: 'test', author_id: @user1.id)
    Comment.create(text: 'Wow really amazing post 😊👏', author_id: @user1.id, post_id: Post.last.id)
    visit posts_path
    expect(page).to have_content('Comments 1')
  end

  scenario 'how many likes a post has' do
    Post.create(title: 'test', text: 'test', author_id: @user1.id)
    Like.create(author_id: @user1.id, post_id: Post.last.id)
    visit posts_path
    expect(page).to have_content('Likes 1')
  end

  scenario 'section for pagination if there are more posts than fit on the view' do
    Post.create(title: 'test', text: 'test', author_id: @user1.id)
    visit posts_path
    expect(page).to have_content('All posts')
  end

  scenario 'it redirects me to that post\'s show page' do
    Post.create(title: 'test', text: 'test', author_id: @user1.id)
    visit posts_path
    click_link 'test'
    expect(page).to have_content('test')
  end
end
