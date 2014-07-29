var Akk = Akk || {};

Handlebars.registerHelper('nestedClass', function(type) {
  if(type === 'Image') {
    return '';
  }
  else {
    return 'nested-comment';
  }
});
