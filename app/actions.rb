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
		user = User.create(username: username, password: password)
		session[:user_id] = user.id
		redirect '/'
	end
end

get '/movies/new' do
	erb :new_movie
end

get '/movies/:id' do
	@movie = Movie.find(params[:id])
	erb :movie_show
end


post '/movies/create' do
	title = params[:title]
    director = params[:director]
    release_date = params[:release_date]
    genre = params[:genre]
    run_time = params[:run_time]

   
    
    movie = Movie.find_by(title: title)
	if movie
		redirect '/movies'
	else
		new_movie = current_user.movies.create title: title, director: director, release_date: release_date, genre: genre, run_time: run_time
    redirect "/movies/#{new_movie.id}"

	end
end

get '/profile/edit' do
	current_user
	erb :profile
end

post '/profile/edit/' do
	username = params[:username]
	#first_name = params[:first_name]
	#last_name = params[:last_name]
	#age = params[:age]
	#gender = params[:gender]
	email = params[:email]
	password = params[:password]

	current_user.update username: username, email: email, password: password #first_name: first_name, last_name: last_name, age: age, gender: gender
end 


# post '/movies/:id/reviews/new' do
# 	title = params[:title]
# 	review = params[:review]
#     user_rating = params[:user_rating]

#     current_user.reviews.create title: title, review: review, user_rating: user_rating
#     new_review = current_user.reviews.create title: title, review: review, user_rating: user_rating
#     redirect "reviews/#{new_review.id}"

#      review = Review.find_by(title: title user_id: user_id)
# 	if review
# 		Print "You've already reviewed this movie"
# 		redirect '/movies'
# 	else
# 		review = Review.create(title: title, review: review, user_rating: user_rating)
# 		session[:user_id] = user.id
# 		redirect 'new_review'
	# end
# end


