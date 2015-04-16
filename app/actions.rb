# Homepage (Root path)
helpers do
	def current_user
		@current_user = User.find_by(id: session[:user_id]) if session[:user_id]
	end
end

get '/' do
  erb :index
end

get '/login' do
    erb :login
end

get '/signup' do
    erb :signup
end

post '/login' do
	username = params[:username]
	password = params[:password]

	user = User.find_by(username: username)
	if user.password == password
		session[:user_id] = user.idredirect '/'
	else redirect '/login'
	end
end

post '/signup' do
	username = params[:username]
	password = params[:password]

	user = User.find_by(username: username)
	if user
		redirect '/signup'
	else
		user = User.create(username: username, password: passowrd)
		session[:user_id] = user.id
		redirect '/'
	end
end

get '/movies/new' do
	erb :new_movie
end

