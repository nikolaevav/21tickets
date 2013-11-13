jQuery(document).ready(function(){
  // $('input, textarea').placeholder();
  
  $.mask.definitions['~'] = "[+-]";
  $(".iphone").mask("8 (999) 999-99-99");


  $( "a.lp-link, a.lp-logo" ).hover(
    function() { $( "a.lp-link, a.lp-logo" ).toggleClass( "selected" ); }, 
    function() { $( "a.lp-link, a.lp-logo" ).toggleClass( "selected" ); }
  );


  $(document).on("scroll", function() {
    if ( $(document).scrollTop() > $(".clear").offset().top + $(".clear").outerHeight() )
      $("#menu").addClass("menu-fixed");
    else
      $("#menu").removeClass("menu-fixed");
  });
  
  $('a.smooth').bind('click.smoothscroll',function (e) {
    e.preventDefault();
 
    var target = this.hash,
    $target = $(target);
 
    $('html, body').stop().animate({
      'scrollTop': $target.offset().top
    }, 900, 'swing', function () {
      window.location.hash = target;
    });
  });
  
  $.validate();
});