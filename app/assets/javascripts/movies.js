$(document).ready(function() {
 

  $(function () {
    $('#new_movie').submit(function(event) {
      event.preventDefault();

      var values = $(this).serialize(); 
      var posting = $.post('/movies', values);
      
 
      posting.done(function(data) {
        var movie = data;
        $("#movieTitle").text(movie["title"]);
        $("#movieDescription").text(movie["description"]);
        $("#movieYear").text(movie["year"]);
       // $("#movieYear").img(movie["image"]);
        
      });
    
    });
  });
});