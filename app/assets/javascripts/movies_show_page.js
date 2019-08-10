$(() => {
	bindClickHandlers();
})

const bindClickHandlers = () => {

	$('#all_movies').on('click', (e) => {
		e.preventDefault();
		history.pushState(null, null, "movies");

		fetch('/movies.json')
			.then(res => res.json())
			.then(movies => {
					$('body > div.container').html('')
					movies.forEach(movie => {
						let newMovie = new Movie(movie);
						let movHTML = newMovie.showMovie();
						$('body > div.container').append(movHTML);
					})
				})
	});

}



  function Movie(movie){
  	this.title = movie.title 
  	this.description = movie.description
  	this.year = movie.year 
  	this.genres = movie.genres
  	this.user_id = movie.user_id 
  	this.comments = movie.comments 
  
  }

  Movie.prototype.showMovie = function(){
  	let movieHTML = `
  	<h1>${this.title}</h1>
  	<h2>${this.description}</h2>
  	<h2>${this.year}</h2>
  	<h2>${this.genres}</h2>
  	<h2>${this.comments}</h2>
  	`
  	return movieHTML 
  }
