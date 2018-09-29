/**
 *
 */

$(document).ready(function(){
  $('table.statuses tbody').prepend('').fadeIn();

  $('input.maybe').click(function(event) {
     alert("Thanks for visiting!");
   });

  $('td a.delete').click(function(event) {
     //alert("Thanks for visiting!");
     $(this).parent().parent().remove();
   });
});
