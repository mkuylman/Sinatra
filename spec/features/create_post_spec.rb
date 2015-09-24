require_relative '../spec_helper'
RSpec.describe 'creating post' do
	it 'creates a new post and display the post on the
	profile page' do
		user = create_user('Kobe Bryant')
		sign_in(user)
		visit "/users/#{user.id}"
		fill_in 'Content', with: 'This is my post to you'
		click_button 'Create Post'
		expect(current_path).to eq("/users/#{user.id}")
		expect(page).to have_text('This is my post to you')
	end
end