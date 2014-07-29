var Akk = Akk || {};

Akk.initialize = function() {
  $(document).foundation();

  $('#image-comments').on('click', '.expander', function(event) {
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

  $('#image-comments').on('click', '.comment-reply', function(event){
    event.preventDefault();
    $($(this).parents('.panel-footer')[0]).siblings('.comment-comment-form').toggle();
  });

  //Hide all nested comments when the page loads.
  $('.nested-comment').hide();
  $('.comment-comment-form').hide();


  $('#image-comments').on('submit', '.new_comment_form', function(event) {
    event.preventDefault();
   Akk.createComment(event.currentTarget);
   $(this).parents('.comment-comment-form').hide();
 });

  $('#new_image_comment_form').on('submit', function(event) {
    event.preventDefault();
   Akk.createComment(event.currentTarget);
 });

  $('#image-comments').on('click', '.expand-comments', function(event){
    event.preventDefault();
    $($(this).parents('.individual-comment')[0]).children('.individual-comment').toggle();
    $(this).children('i').toggleClass('fa-angle-double-down');
    $(this).children('i').toggleClass('fa-angle-double-up');

  });
};
Akk.createComment = function(target) {

  var commentPath = $(target).attr('action');
  var content = $(target).children('#comment_content').val();

  $(target).children('#comment_content').val('');

  var newComment = new Akk.Comment(content,commentPath, target);
  newComment.remoteCreate();
};

