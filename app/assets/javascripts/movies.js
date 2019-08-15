$(document).ready(function() {
 

  $(function () {
    $('#new_movie').submit(function(event) {
      event.preventDefault();

      var values = $(this).serialize(); 
      var posting = $.post('/movies', values);
      
 
      posting.done(function(data) {
        var movie = new Movie(data);
        var htmlOfMovie =  movie.showMovie();
        $('body > div.container').html('');
        $('body > div.container').append(htmlOfMovie); 
        // $("#movieTitle").text(movie["title"]);
        // $("#movieDescription").text(movie["description"]);
        // $("#movieYear").text(movie["year"]);
        // $("#movieImage").img(movie["movie_img"]);
        
      });
    
    });
  });

 $(function () {
  event.preventDefault()
  $(".next-movie").on("click", function() {
  	
    var nextID = parseInt($(".next-movie").attr("data-id")) + 1;
  
    $.get("/movies/" + nextID + ".json", function(data) {
      $('.display').html('');
      $('.display').append(`
      ${data.title} <br>
      ${data.description}  <br>
      ${data.year} <br>
      `);
      // $(".movieDescription").text(data["description"]);
      //$(".movieGenres").text(data["movie"]["genres"]);
      $(".next-movie").attr("data-id", data["id"]);
    });
  });
});



class Movie {
  constructor(movie) {
        this.title = movie.title 
    this.description = movie.description
    this.year = movie.year 
    this.genres = movie.genres.map(m => ' ' + m.name);
    this.user_id = movie.user_id 
    this.comments = movie.comments.map(m => ' ' + m.text); 
  }
}



  // function Movie(movie){
  // 	this.title = movie.title 
  // 	this.description = movie.description
  // 	this.year = movie.year 
  // 	this.genres = movie.genres.map(m => ' ' + m.name);
  // 	this.user_id = movie.user_id 
  
  // }

  Movie.prototype.showMovie = function(){
  	let movieHTML = `
  	<h1>${this.title}</h1>
  	<h2>${this.description}</h2>
  	<h2>${this.year}</h2>
  	<h2>${this.genres}</h2>
  	`
  	return movieHTML 
  }

});