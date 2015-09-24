class PostsController < ApplicationController
	post '/' do
		erb :main_layout do
			user = User.find(params[:user_id])
			user.posts.create(content: params[:content])
			redirect "/users/#{user.id}"
		end
	end

	delete '/:id' do
		erb :main_layout do 
			user = User.find(params[:user_id])
			post = Post.find(params[:id])
			post.destroy
			redirect "users/#{user.id}"
		end
	end
end