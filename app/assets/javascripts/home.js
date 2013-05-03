$(function(){
  $('.carousel').carousel({
    interval: 4000
  });
});

$(function(){
  setTimeout(function(){
    $("p.notice").fadeOut("slow");
    $("p.alert").fadeOut("slow");
  },2000);
});