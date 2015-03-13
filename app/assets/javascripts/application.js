//= require jquery
//= require jquery_ujs
//= require foundation
//= require_self
//= require_tree .
//= require updater
//= require status

// For Google+
(function() {
  var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
  po.src = 'https://apis.google.com/js/plusone.js';
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
})();
