
document.addEventListener("touchstart", function() {},false);


$(function() {
    // Since there's no list-group/tab integration in Bootstrap
    $('.list-group-item').on('click',function(e){
     	  var previous = $(this).closest(".list-group").children(".active");
     	  previous.removeClass('active'); // previous list-item
     	  $(e.target).addClass('active'); // activated list-item
   	});

  $('.faq-list a').on('click', function (e) {
    const target = $(this).attr('href');
    $('.tab-pane').hide();
    $(target).show();
  });  

});
