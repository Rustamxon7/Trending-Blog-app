require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.feature 'Posts #Show', type: :feature do
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

  scenario 'show post title.' do
    Post.create(title: 'test', text: 'test', author_id: @user1.id)
    visit post_path(Post.last)
    expect(page).to have_content('test')
  end

  scenario 'I can see who wrote the post' do
    Post.create(title: 'test', text: 'test', author_id: @user1.id)
    visit post_path(Post.last)
    expect(page).to have_content(@user1.name)
  end

  scenario 'I can see how many comments it has' do
    Post.create(title: 'test', text: 'test', author_id: @user1.id)
    Comment.create(text: 'Wow really amazing post 😊👏', author_id: @user1.id, post_id: Post.last.id)
    visit post_path(Post.last)
    expect(page).to have_content('Comments 1')
  end

  scenario 'I can see how many likes it has' do
    Post.create(title: 'test', text: 'test', author_id: @user1.id)
    Like.create(author_id: @user1.id, post_id: Post.last.id)
    visit post_path(Post.last)
    expect(page).to have_content('Likes 1')
  end

  scenario 'I can see the post body' do
    Post.create(title: 'test', text: 'test', author_id: @user1.id)
    visit post_path(Post.last)
    expect(page).to have_content('test')
  end

  scenario 'I can see the username of each commentor' do
    Post.create(title: 'test', text: 'test', author_id: @user1.id)
    Comment.create(text: 'Wow really amazing post 😊👏', author_id: @user1.id, post_id: Post.last.id)
    visit post_path(Post.last)
    expect(page).to have_content(@user1.name)
  end

  scenario 'I can see the comment each commentor left' do
    Post.create(title: 'test', text: 'test', author_id: @user1.id)
    Comment.create(text: 'Wow really amazing post 😊👏', author_id: @user1.id, post_id: Post.last.id)
    visit post_path(Post.last)
    expect(page).to have_content('Wow really amazing post 😊👏')
  end
  # rubocop:enable Metrics/BlockLength
end