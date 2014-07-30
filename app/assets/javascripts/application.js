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
//= require handlebars.runtime
//= require jquery.form
//= require cocoon
//= require turbolinks
//= require_tree .

//= require js-routes

$(document).ready(Akk.initialize);
$(document).on('page:load', Akk.initialize);

$('#category')
    .on('cocoon:before-insert', function(e,category_to_be_added) {
      category_to_be_added.fadeIn('slow');
    })
    .on('cocoon:before-remove', function(e, category) {
      // allow some time for the animation to complete
      $(this).data('remove-timeout', 1000);
      category.fadeOut('slow');
    });

$(window).bind("load", function () {
    var footer = $("#footer");
    var pos = footer.position();
    var height = $(window).height();
    height = height - pos.top;
    height = height - footer.height();
    if (height > 0) {
        footer.css({
            'margin-top': height + 'px'
        });
    }
});
