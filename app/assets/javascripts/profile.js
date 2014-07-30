$(document).ready(function() {

  ProfileApp.initializer();

});

  var ProfileApp = {

  deleteImage: function(event){
    Id = event.target.parentElement.parentElement.getAttribute('image-id');
    $.ajax({
      type: "DELETE",
      url: Routes.image_path(Id),
      dataType: 'json'
    })
    .done(event.target.parentElement.parentElement.remove());
    event.preventDefault();
  },

  deleteInterest: function(event){
    Id = event.target.parentElement.getAttribute('interest-id');
    $.ajax({
      type: "DELETE",
      url: Routes.interest_path(Id),
      dataType: 'json'
    })
    .done(event.target.parentElement.remove());
    event.preventDefault();
  },

  deleteFollow: function(event){
    Id = event.target.parentElement.getAttribute('follow-id');
    $.ajax({
      type: "DELETE",
      url: Routes.follow_path(Id),
      dataType: 'json'
    })
    .done(event.target.parentElement.parentElement.remove());
    event.preventDefault();
  },
  addCategory: function(event){
    value = $("#interest-form").val();
    requestObj = {category:  {description: value}};
    $.ajax({
      type: "POST",
      url: Routes.categories_path(),
      data: requestObj,
      dataType: 'json'
    })
    .done(this.addInterest.bind(this))
    .done(this.appendInterest.bind(this));
    $("#interest-form").val('');
    event.preventDefault();
  },
  addInterest: function(category){
    categoryId = category.category.id;
    requestObj = {interest:  {category_id: categoryId}};
    $.ajax({
      type: "POST",
      url: Routes.interests_path(),
      data: requestObj,
      dataType: 'json'
    })
    .done(this.appendInterestId.bind(this));
    event.preventDefault();
  },
  appendInterest: function(category){
    var button = "<button class ='tiny alert' id ='delete-button'>Delete</button>";
    var div = $('<div>').addClass('my-interests');
    var description = $('<p>').text(category.category.description);
    var interestDiv = div.append(description,button);
    $('#interest-container').append(interestDiv);
    event.preventDefault();
  },
  appendInterestId: function(interest){
    $('.my-interests').last().attr('interest-id',interest.id);
    event.preventDefault();
  },
  initializer: function(event){
    $('#my-images').on('click', '#delete-button',this.deleteImage.bind(this));
    $('.my-interests').on('click', '#delete-button',this.deleteInterest.bind(this));
    $('#followings').on('click', '#unfollow-button',this.deleteFollow.bind(this));
    $('#add-interest').on('click',this.addCategory.bind(this));


  }
};
