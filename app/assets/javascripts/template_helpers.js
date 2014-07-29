var Akk = Akk || {};

Handlebars.registerHelper('nestedClass', function(type) {
  if(type === 'Image') {
    return '';
  }
  else {
    return 'nested-comment';
  }
});

Handlebars.registerHelper('timeSince', function(date) {
    date = new Date(date);

    var seconds = Math.floor((new Date() - date) / 1000);

    var interval = Math.floor(seconds / 31536000);

    if (interval > 1) {
        return interval + " years";
    }
    interval = Math.floor(seconds / 2592000);
    if (interval > 1) {
        return interval + " months";
    }
    interval = Math.floor(seconds / 86400);
    if (interval > 1) {
        return interval + " days";
    }
    interval = Math.floor(seconds / 3600);
    if (interval > 1) {
        return interval + " hours";
    }
    interval = Math.floor(seconds / 60);
    if (interval > 1) {
        return interval + " minutes";
    }
    return "Less than a minute";
});
