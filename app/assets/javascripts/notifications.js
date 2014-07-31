var Akk = Akk || {};

Akk.deleteNotification = function() {
  deleteId = $(this).parents('.noti-cell').data('id');
  $.ajax({
    url: Routes.notification_path(deleteId),
    type: 'DELETE',
    dataType: 'json',
    context: this
  })
  .done(function() {
    $(this).parents('.noti-cell').remove();
  })
  .fail(function() {
    console.log("error");
  });
};
