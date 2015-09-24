require_relative '../spec_helper'

RSpec.describe 'new post' do 
	it 'displays correct fields to create new post' do
		user = create_user('Kobe Bryant')
		visit "/users/#{user.id}"

		expect(page).to have_field('Content')
	end
end