class SessionsController < ApplicationController
	get '/new' do 
		erb :main_layout do
			erb :"sessions/new"
		end
	end
	post '/' do
		user = User.find_by(email: params[:email])
		if user && user.encrypted_password == BCrypt::Engine.hash_secret(params[:password], user.salt)
			session[:user_id] = user.user_id
			redirect "/users/#{user.id}"
		else
			session[:errors] = 'Invalid email/password combination'
			redirect '/sessions/new'
		end
	end

	delete '/' do
		session[:user_id] = nil
		redirect '/sessions/new'
	end
end
