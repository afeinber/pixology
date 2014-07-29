$(document).ready(function() {

  var ImageApp = {

  deleteImage: function(event){
    Id = event.target.parentElement.parentElement.getAttribute('image-id');
    $.ajax({
      type: "DELETE",
      url: 'http://localhost:3000/images/' + Id,
      dataType: 'json'
    })
    .done(event.target.parentElement.parentElement.remove());
    event.preventDefault();
  }
};

  $('#my-images').on('click', '#delete-button',ImageApp.deleteImage);

});
