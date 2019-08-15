$(document).ready(function() {
 



  $(function () {
    $('#new_movie').submit(function(event) {
      event.preventDefault();
      
      // var values = $(this).serialize(); 
      // var posting = $.post('/movies', values);

      var formData = new FormData(this);
      // //var posting = $.post('/movies', formData);
      
      
    $.ajax({
                type: 'POST',
                url: $(`/movies`).attr('action'),
                data:formData,
                cache:false,
                contentType: false,
                processData: false,
                success: function(data) {
                    $('#imagedisplay').html("<img src=" + data.url + "" + data.name + ">");
                },
                error: function(data) {
                    $('#imagedisplay').html("<h2>this file type is not supported</h2>");
                }
                });


      // posting.done(function(data) {
      //   var movie = new Movie(data);
      //   var htmlOfMovie =  movie.showMovie();
      //   $('body > div.container').html('');
      //   $('body > div.container').append(htmlOfMovie); 


        
      }

      );
    
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
    
      $(".next-movie").attr("data-id", data["id"]);
    });
  });
});




});