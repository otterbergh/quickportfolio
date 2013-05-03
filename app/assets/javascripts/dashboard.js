$(function() {
  $('a#delete-portfolio-btn').click(function(e){
    $('a#delete-portfolio-confirm-btn').attr('href', $(this).attr('href'));
    $('div#delete-portfolio-modal').modal('show');
    e.preventDefault();
    e.stopImmediatePropagation();
  });
  
  $('delete-portfolio-btn-confirm').click(function(e){
    $('delete-portfolio-modal').modal('hide');
  });  
});

$(function() {
  $('i.icon-chevron-down').click(function(e){
    var test = $(this).attr("class");
    if(test == "icon-chevron-down") {
      var row = 'tr#portfolio-details-' + $(this).attr("id");
      var url = '/portfolios/details/' + $(this).attr("id");
      $(this).attr("class", "icon-chevron-up");
      $(row).load(url, function() {
        $(row).show();
      });
    } else {
      $(this).attr("class", "icon-chevron-down");
      var row = 'tr#portfolio-details-' + $(this).attr("id");
      $(row).hide();
    }
  }); 
});