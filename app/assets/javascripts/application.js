// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require foundation
//= require turbolinks
//= require_tree .
//= require cocoon

// $(document).on("page:fetch", function(){
//   $('.content').on('click', function (event) {
//     event.preventDefault();

//   });
// });

$(document).foundation();

$(document).ready(function() {
  $('.expander').on('click', function(event) {
    event.preventDefault();
    $(this).parents('.accordion-head').siblings('.content').toggleClass('active');
    if($(this).parents('.accordion-head').siblings('.content').hasClass('active')) {
      $(this).children('i').removeClass('fa-angle-double-down');
      $(this).children('i').addClass('fa-angle-double-up');
    } else {
      $(this).children('i').removeClass('fa-angle-double-up');
      $(this).children('i').addClass('fa-angle-double-down');
    }
  });

  }
  $('#category')
      .on('cocoon:before-insert', function(e,category_to_be_added) {
        category_to_be_added.fadeIn('slow');
      })
      .on('cocoon:before-remove', function(e, category) {
        // allow some time for the animation to complete
        $(this).data('remove-timeout', 1000);
        category.fadeOut('slow');
      });
      .on('cocoon:before-insert', function(e,category_to_be_added) {
        category_to_be_added.submit();
        $.ajax({
          url: '/images/:image_id/categories',
          type: 'POST',
          dataType: 'json',
          data: {param1: 'value1'},
        })
        .done(function() {
          console.log("success");
        })
        .fail(function() {
          console.log("error");
        })
        .always(function() {
          console.log("complete");
        });
        
      })
      
});

