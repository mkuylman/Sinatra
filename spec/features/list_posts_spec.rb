require_relative '../spec_helper'
RSpec.describe 'listing posts' do 
	it "shows the posts from a particular user" do
		user1 = create_user('Kobe Bryant')
		post1 = user1.posts.create(content: 'Post 1')
		post2 = user1.posts.create(content: 'Post 2')
		user2 = create_user('Jahlil Okafor')
		post3 = user2.posts.create(content: 'Post 3')
		visit "/users/#{user1.id}"
		expect(page.status_code).to eq(200)
		expect(page).to have_text(post1.content)
		expect(page).to have_text(post2.content)
		expect(page).not_to have_text(post3.content)
	end
end
