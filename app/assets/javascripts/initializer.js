var Akk = Akk || {};

Akk.initialize = function() {
  $(document).foundation();

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

  $('.comment-reply').click(function(event){
    event.preventDefault();
    $($(this).parents('.panel-footer')[0]).siblings('.comment-comment-form').toggleClass('hidden-form');
  });

  $('#new_comment').on('submit', function(event){

    var commentPath = $('#new_comment').attr('action');
    var content = $('#comment_content').val();

    $('#comment_content').val('');
    event.preventDefault();

    var newComment = new Akk.Comment(content,commentPath, event.target);
    newComment.remoteCreate();

  });

  $('.expand-comments').click(function(event){
    event.preventDefault();
    $($(this).parents('.individual-comment')[0]).children('.individual-comment').toggleClass('hidden-form');

  });
};

Akk.submitForm = function(formElement) {


  $.ajax({
    url: commentPath,
    type: 'POST',
    dataType: 'json',
    data: { comment: { content: content } },
  })
  .done(Akk.appendComment.bind(formElement))
  .fail(function() {
    console.log("error");
  });
};

Akk.appendComment = function(comment) {
  console.log(comment);
  console.log(this);
};
