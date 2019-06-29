


// 仮置き

$(document).on('turbolinks:load', function() {
  $('.button').click(function () {
    $('.signup-container--first').hide();
    $('.signup-container--second').show();
  });  
});
