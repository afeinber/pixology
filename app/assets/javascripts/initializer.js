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
  $('#new_comment').on('submit', function(event){
    event.preventDefault();
    Akk.submitForm(event.target);
    // $.proxy(Akk.submitForm, this);
  });
};

Akk.submitForm = function(formElement) {
  var commentPath = $('#new_comment').attr('action');
  var content = $('#comment_content').val();
  $('#comment_content').val('');

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
