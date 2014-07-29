var Akk = Akk || {};

// Constructor function
Akk.Comment = function(content, url, formElement){
  this.content = content;
  this.url = url;
  this.formElement = $(formElement);
};

Akk.Comment.prototype.remoteCreate = function(){
  $.ajax({
    url: this.url,
    type: 'POST',
    dataType: 'json',
    data: { comment: { content: this.content } },
  })
  .done(this.appendComment.bind(this))
  .fail(function() {
    console.log("error");
  });
};

Akk.Comment.prototype.appendComment = function(comment){
  // console.log(this.content);
  // this.formElement.append("<h3> Comment was " + this.content + " </h3>");
  // console.log(this);

  var appendix = $($(this.formElement).parents('.individual-comment')[0]).length !== 0 ? $($(this.formElement).parents('.individual-comment')[0]) : $('#image-comments');
  appendix.children('.individual-comment').show();
  appendix.append(HandlebarsTemplates.comment(comment));
};
