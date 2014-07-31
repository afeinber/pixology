
var ProfileApp = {


  deleteImage: function(event){
    Id = event.target.parentElement.parentElement.getAttribute('image-id');
    $.ajax({
      type: "DELETE",
      url: Routes.image_path(Id),
      dataType: 'json'
    })
    .done(event.target.parentElement.parentElement.remove());
    $('a[href="#my-images"]').text('My images (' + $('.my-images').length +')');
    event.preventDefault();
  },
  deleteFavorite: function(event){
    Id = event.target.parentElement.parentElement.getAttribute('image-id');
    $.ajax({
      type: "DELETE",
      url: Routes.favorite_path(Id),
      dataType: 'json'
    })
    .done(event.target.parentElement.parentElement.remove());
    $('a[href="#my-favorites"]').text('Favorites (' + $('.my-favorites').length +')');
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
    $('a[href="#followings"]').text('Followings (' + $('.my-follows').length +')');
    event.preventDefault();
  },
  deleteProfileFollow: function(event){
    Id = event.target.getAttribute('follow-id');
    $.ajax({
      type: "DELETE",
      url: Routes.follow_path(Id),
      dataType: 'json'
    })
    .done();
    event.preventDefault();
  },
  addFollow: function(event){
    Id = event.target.getAttribute('user-id');
    requestObj = {follow:  {followee_id: Id}};
    $.ajax({
      type: "POST",
      url: Routes.follows_path(),
      data: requestObj,
      dataType: 'json'
    })
    .done(this.appendFollowId.bind(this));
    event.preventDefault();
  },
  //appending follow-id to delete button in order to delete.
  appendFollowId: function(follow){
    $('#profile #unfollow-button').attr('follow-id',follow.id);
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
    //Get category description and append as interest.
    var button = "<button class ='tiny alert' id ='delete-button'>Delete</button>";
    var div = $('<div>').addClass('my-interests');
    var description = $('<p>').text(category.category.description);
    var interestDiv = div.append(description,button);
    $('#interest-container').append(interestDiv);
    event.preventDefault();
  },
  appendInterestId: function(interest){
    //Get interest id and append it to interest added in above function.
    $('.my-interests').last().attr('interest-id',interest.id);
    event.preventDefault();
  },
  change: function(){
   if (this.textContent==="UnFollow") {
      this.textContent = "Follow";
      this.id = "follow-button";
      this.className = "tiny";
   }
   else {
      this.textContent = "UnFollow";
      this.id = "unfollow-button";
      this.className = "tiny alert";
    }
  },
  initializer: function(event){
    $('#my-images').on('click', '#delete-button',this.deleteImage.bind(this));
    $('#interest-container').on('click', '#delete-button',this.deleteInterest.bind(this));
    $('#followings').on('click', '#unfollow-button',this.deleteFollow.bind(this));
    $('#add-interest').on('click',this.addCategory.bind(this));
    $('#my-favorites').on('click', '#unfavorite-button',this.deleteFavorite.bind(this));


    $('#profile').on('click','#unfollow-button',this.deleteProfileFollow.bind(this));
    $('#profile').on('click','#follow-button',this.addFollow.bind(this));

    $('#profile').on('click','#follow-button',this.change);
    $('#profile').on('click','#unfollow-button',this.change);



  }
};

