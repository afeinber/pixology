$(document).ready(function() {

  var ProfileApp = {

  deleteImage: function(event){
    Id = event.target.parentElement.parentElement.getAttribute('image-id');
    $.ajax({
      type: "DELETE",
      url: 'http://localhost:3000/images/' + Id,
      dataType: 'json'
    })
    .done(event.target.parentElement.parentElement.remove());
    event.preventDefault();
  },

  initializer: function(event){
    $('#my-images').on('click', '#delete-button',ProfileApp.deleteImage);
  }
};

  ProfileApp.initializer();

});
