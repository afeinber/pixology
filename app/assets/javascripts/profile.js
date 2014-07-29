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

  initializer: function(event){
    $('#my-images').on('click', '#delete-button',this.deleteImage);
    $('.my-interests').on('click', '#delete-button',this.deleteInterest);
    $('#followings').on('click', '#unfollow-button',this.deleteFollow);

  }
};

  ProfileApp.initializer();

});
