$('#category')
    .on('cocoon:before-insert', function(e,category_to_be_added) {
      category_to_be_added.fadeIn('slow');
    })
    .on('cocoon:before-remove', function(e, category) {
      // allow some time for the animation to complete
      $(this).data('remove-timeout', 1000);
      category.fadeOut('slow');
    });


