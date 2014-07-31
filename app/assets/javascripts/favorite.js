
var FavoriteApp = {


  deleteFavorite: function(event){
    Id = event.target.getAttribute('favorite-id');
    $.ajax({
      type: "DELETE",
      url: Routes.favorite_path(Id),
      dataType: 'json'
    })
    .done();
    event.preventDefault();
  },
  addFavorite: function(event){
    imageId = event.target.getAttribute('image-id');
    requestObj = { favorite:  {image_id: imageId}};
    $.ajax({
      type: "POST",
      url: Routes.favorites_path(),
      data: requestObj,
      dataType: 'json'
    })
    .done(this.appendInterestId.bind(this));
    event.preventDefault();
  },
    appendInterestId: function(favorite){
    //Get interest id and append it to interest added in above function.
    $('#unfavorite-button').attr('favorite-id',favorite.id);
    event.preventDefault();
  },
  change: function(favorite){
   if (this.textContent==="UnFavorite") {
      this.textContent = "Favorite";
      this.id = "favorite-button";
      this.className = " ";
   }
   else {
      this.textContent = "UnFavorite";
      this.id = "unfavorite-button";
      this.className = "alert";
    }
  },
  initializer: function(event){
    $('#image-favorite').on('click','#unfavorite-button',this.deleteFavorite.bind(this));
    $('#image-favorite').on('click','#favorite-button',this.addFavorite.bind(this));

    $('#image-favorite').on('click','#unfavorite-button',this.change);
    $('#image-favorite').on('click','#favorite-button',this.change);

  }
};

