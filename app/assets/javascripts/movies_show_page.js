$(() => {
  bindClickHandlers();
})


const bindClickHandlers = () => {

  $('#all_movies').on('click', (e) => {
    e.preventDefault();
    history.pushState(null, null, "movies");
    getMovies();
    sortMovies();

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


$(document).on('click','.next', function(){
 
  let nextMovieID = parseInt($(".next").attr("data-id")) + 1;
     
    fetch(`/movies/${nextMovieID}/next`)
      .then(response => response.json())
      .then(data => {
          $('.replaceNext').html('');
          let singleMovie = new Movie(data);
          let movHTML = singleMovie.showMovie();
          $('.replaceNext').append(movHTML);
          $('#imagedisplay').html("<img src=" + data.url + "" + data.name + ">")

      $('.next').attr("data-id", data["id"]);
    });
    
    })

}

const sortMovies = () => {

  $('.sorting').on('click', function(){

     alert('heey');

    fetch('/movies.json')
     .then(res => res.json())
     .then(movies => {
     
      $('body > div.container').html('')
       // movies.forEach(movie =>

       movies.sort(function(a, b) {
        var movieA = a.title.toUpperCase() // ignore upper and lowercase
        var movieB = b.title.toUpperCase() // ignore upper and lowercase
          if (movieA < movieB) {
            return -1;
          }
          if (movieA > movieB) {
            return 1;
          }

          return 0;
        }) //closes movies.sort

        movies.forEach(movie => {
                  let newMovie = new Movie(movie);
                  let movHTML = newMovie.showMovie();
                  $('body > div.container').append(movHTML);

          
                })
                
          }) //closes movies
        }); 


}

const getMovies = () => {

    fetch('/movies.json')
      .then(res => res.json())
      .then(movies => {
        console.log(movies);
          $('body > div.container').html('')
          movies.forEach(movie => {
            let newMovie = new Movie(movie);
            let movHTML = newMovie.showMovie();
            let sortButton =  `<button class="sorting"> Sort Movies </button>`
            $('body > div.container').append(movHTML);

    
          })
        })

}


class Movie {
  constructor(movie) {
    this.id = movie.id 
    this.title = movie.title 
    this.description = movie.description
    this.year = movie.year 
    this.genres = movie.genres.map(m => ' ' + m.name);
    this.user_id = movie.user_id 
    this.comments = movie.comments.map(m => ' ' + m.text);  
  }
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
     <div class="replaceNext">
     <h1>${this.title} </a></h1> 
     <h3>${this.description}</h2> 

     </div>
     <button class="next" data-id="${this.id}"> Next Movie </button> 
    `
    return movieHTML 
  }