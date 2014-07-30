$(document).ready(function() {

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
    Id = event.target.parentElement.parentElement.getAttribute('interest-id');
    $.ajax({
      type: "DELETE",
      url: Routes.interest_path(Id),
      dataType: 'json'
    })
    .done(event.target.parentElement.parentElement.remove());
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
    .done();
    event.preventDefault();
  },
  appendInterest: function(category){
    category = category.category.description;
    //append interest to end of interest list.
    event.preventDefault();
  },
  initializer: function(event){
    $('#my-images').on('click', '#delete-button',this.deleteImage);
    $('.my-interests').on('click', '#delete-button',this.deleteInterest);
    $('#followings').on('click', '#unfollow-button',this.deleteFollow);
    $('#add-interest').on('click',this.addCategory.bind(this));


  }
};

  ProfileApp.initializer();

});
