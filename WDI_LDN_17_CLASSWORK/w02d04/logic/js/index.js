$(document).ready(function() {
  $('[type="button"]').on("click", function(){
    var message = $('[type="text"]').val();
    var el = '<input type="text" value="'+ message +'">';
    $(".boxContainer").append(el);
  });
});