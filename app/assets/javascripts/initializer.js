var Akk = Akk || {};

Akk.initialize = function() {
  $(document).foundation();

  ProfileApp.initializer();
  FavoriteApp.initializer();

  $('.gallery-item').hover( function() {
    $(this).find('.img-title').fadeIn(300);
  }, function() {
    $(this).find('.img-title').fadeOut(100);
  });

  $('.search-banner').hide();
  $('.smile-tab').click( function() {
    $('.search-banner').slideToggle();
  });

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

  //This is the AJAX call when an image is uploaded.
  $('#uploadForm input').change(function(){
   $(this).parent().ajaxSubmit({
    beforeSubmit: function(a,f,o) {
     o.dataType = 'json';
     //render the loading .gif
     $('img#thumb').attr('src', 'https://s3.amazonaws.com/akk-imgshare/permanent+images/C36.gif');
   },
   complete: function(XMLHttpRequest) {
      //change the action on the form do that the post request will go to the correct image.
      $('#image-add-tags-form').attr('action', Routes.image_path(XMLHttpRequest.responseJSON.id));
      //render the new image on the page.
      $('img#thumb').attr('src', XMLHttpRequest.responseJSON.thumb_url);
      $('#image-add-tags-form .disabled').removeAttr('disabled');
      $('#image-add-tags-form .disabled').removeClass('disabled');
    },
  });
 });

  $('#image-stats .upvote').click(Akk.makeVote);
  $('#image-stats .downvote').click(Akk.makeVote);
  $('#image-comments').on('click', '.upvote', Akk.makeVote);
  $('#image-comments').on('click', '.downvote', Akk.makeVote);
  $('#search_query').click(function(){
    if($(this).parents('form').find('#search_search_type').val() === 'Images') {
      $(this).val('#');
    }
  });

  //sets the category text field to a hash to encourage users to type hashtags
  $('#categories').on('click', '.input-text', function(){
    $(this).val('#');
  });

  $('.notification-delete').click(Akk.deleteNotification);
};


Akk.createComment = function(target) {
  var commentPath = $(target).attr('action');
  var content = $(target).find('#comment_content').val();

  $(target).find('#comment_content').val('');

  var newComment = new Akk.Comment(content,commentPath, target);
  newComment.remoteCreate();
};


