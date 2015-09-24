class UsersController < ApplicationController
	get '/' do
		@title = 'All Users'

		erb :main_layout do
			@users = User.all
			erb :"users/index"
		end	
	end

	get '/new' do
		erb :main_layout do
			erb :"users/new"
		end
	end

	post '/' do
		user = User.new
		user.email = params[:email]
		user.first_name = params[:first_name]
		user.last_name = params[:last_name]

		password_salt = BCrypt::Engine.generate_salt
		password_hash = BCrypt::Engine.hash_secret('password', password_salt)

		user.salt = password_salt
		user.encrypted_password = password_hash
		user.save

		redirect '/users'
	end

	get '/:id' do
		erb :main_layout do
			@user = User.find(params[:id])
			erb :'users/show'
		end	
	end 

	get '/:id/edit' do
		erb :main_layout do
			@user = User.find(params[:id])
			erb :'users/edit'
		end
	end

	patch '/:id' do
		user = User.find(params[:id])
		user.update(first_name: params[:first_name], last_name:
			params[:last_name], email: params[:email])
		redirect '/users'
	end

	delete '/:id' do 
		user = User.find(params[:id])
		user.destroy
		redirect '/users'
	end
end
















