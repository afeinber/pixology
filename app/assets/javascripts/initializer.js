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

  $('.expander').on('click', function(event) {
    event.preventDefault();
    $(this).parents('.accordion-head').siblings('.content').toggleClass('active');
    $(this).children('i').toggleClass('fa-angle-double-down');
    $(this).children('i').toggleClass('fa-angle-double-up');
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
    $($(this).parents('.individual-comment')[0]).children('.individual-comment').slideToggle(200);
    $(this).children('i').toggleClass('fa-angle-double-down');
    $(this).children('i').toggleClass('fa-angle-double-up');

  });

  $('#uploadForm input').change(function(){
   $(this).parent().ajaxSubmit({
    beforeSubmit: function(a,f,o) {
     o.dataType = 'json';
     $('img#thumb').attr('src', '/assets/C36.gif');
    },
    complete: function(XMLHttpRequest) {
      $('#image-add-tags-form').attr('action', Routes.image_path(XMLHttpRequest.responseJSON.id));
      $('img#thumb').attr('src', XMLHttpRequest.responseJSON.thumb_url);
      $('#image-add-tags-form .disabled').removeAttr('disabled');
      $('#image-add-tags-form .disabled').removeClass('disabled');
    },
   });
  });
};

$('#categories').on('click', '.input-text', function(){
  $(this).val('#');
});
Akk.createComment = function(target) {

  var commentPath = $(target).attr('action');
  var content = $(target).find('#comment_content').val();

  $(target).find('#comment_content').val('');

  var newComment = new Akk.Comment(content,commentPath, target);
  newComment.remoteCreate();
};

