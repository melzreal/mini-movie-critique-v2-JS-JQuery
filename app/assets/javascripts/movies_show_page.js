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

  $(document).on('click','a.show_movie', function(e){
    e.preventDefault();
    let movieID =  $(this).attr('data-id');
    fetch(`/movies/${movieID}.json`)
    .then(res => res.json())
    .then(movie => {
     $('body > div.container').html('')
      let nMovie = new Movie(movie);
      let mHTML = nMovie.showIndividualMovie();
     $('body > div.container').append(mHTML); 

    })
  })
}



  function Movie(movie){
  	this.id = movie.id 
  	this.title = movie.title 
  	this.description = movie.description
  	this.year = movie.year 
  	this.genres = movie.genres
  	this.user_id = movie.user_id 
  	this.comments = movie.comments 
  
  }

  Movie.prototype.showMovie = function(){
  	let movieHTML = `
  	 <h1><a href="/movies/${this.id}" data-id="${this.id}" class="show_movie"> ${this.title} </a></h1> 
  	 <h3>${this.description}</h2> 
  	 <h3>${this.year}</h2> 
  	 <h3>${this.genres}</h2> <br> 
  	 <h3>${this.comments}</h2> <br> 
  	`
  	return movieHTML 
  }


    Movie.prototype.showIndividualMovie = function(){
    let movieHTML = `
     <h1>${this.title} </a></h1> 
     <h3>${this.description}</h2> 
    `
    return movieHTML 
  }
