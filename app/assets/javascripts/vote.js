var Akk = Akk || {};

Akk.makeVote = function(event) {
  event.preventDefault();
  if($(this).attr('disabled')) { return; }
  var is_upvote = $(this).hasClass('upvote');
  var isOnImage = $(this).parents('.individual-comment').length === 0;
  var votable_id = $(this).parents('.individual-comment').data('id') || $(this).parents('#image-stats').data('id');
  var isDelete = $(this).hasClass('success') || $(this).hasClass('alert');
  $(this).attr('disabled', 'true');
  $(this).siblings('.vote').attr('disabled', 'true');


  $.ajax({
    url: (isOnImage ? Routes.image_votes_path(votable_id) : Routes.comment_votes_path(votable_id)),
    type: (isDelete ? 'DELETE' : 'POST'),
    dataType: 'json',
    data: {vote: {is_upvote: is_upvote}},
    context: {element: this, isDelete: isDelete, is_upvote: is_upvote}
  })
  .done(function(data) {
    $(this.element).removeAttr('disabled');
    $(this.element).siblings('.vote').removeAttr('disabled');
    if(this.isDelete) {
      $(this.element).removeClass('success').removeClass('alert').addClass('secondary');
    } else {
      if(this.is_upvote) {
        $(this.element).addClass('success').removeClass('secondary');
        $(this.element).siblings('.downvote').removeClass('alert').addClass('secondary');
      } else {
        $(this.element).addClass('alert').removeClass('secondary');
        $(this.element).siblings('.upvote').removeClass('success').addClass('secondary');
      }
    }
  })
  .fail(function(a, b, c, d) {
    console.log("error");
    $(this.element).removeAttr('disabled');
    $(this.element).siblings('.vote').removeAttr('disabled');
  })
  .always(function() {
    console.log("complete");
  });

};
