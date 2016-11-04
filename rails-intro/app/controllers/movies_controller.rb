class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
		@all_ratings = Movie.all_ratings		# Initialise the variable so that it can be accessed by the view
		# If there is no history saved, init selected_ratings to default value declared in the movie model
		@selected_ratings = session[:ratings].nil? ? Movie.selected_ratings : session[:ratings]
		# If there is no history saved, init selected_sort to default value declared in the movie model
		@selected_sort = session[:sort].nil? ? Movie.selected_sort : session[:sort]
		@redirect = false		# Initialise redirect flag to false

		# If sorting parameter isn't mention, use the last used value
		@sort = params[:sort]
		if not @sort.nil?
			session[:sort] = @sort
			@selected_sort = @sort
		else
			session[:sort] = @selected_sort
		end

		# If rating parameters aren't mentioned, use the last used values and raise redirect flag
		@ratings = params[:ratings]
		if not @ratings.nil?
			@ratings = @ratings.keys if @ratings.is_a? Hash
			session[:ratings] = @ratings
			@selected_ratings = @ratings
		else
			session[:ratings] = @selected_ratings
			@redirect = true
		end

#		debugger
		if @redirect
			redirect_to movies_path(:sort => session[:sort], :ratings => session[:ratings])		# Redirect to RESTful URI
		else
			@movies = Movie.order(session[:sort]).where(:rating => session[:ratings])		# Sort according to specs
		end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
