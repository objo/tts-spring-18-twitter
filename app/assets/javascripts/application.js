// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap
//= require_tree .

function createAlert() {
  $('#create_tweet_btn').click(function() {
    alert("Hello Joe, you tweeted!")
  });
}
$(document).ready(createAlert);

function changeBackgroundColor() {
  $('#left_side_div').click(function() {
    $(this).toggleClass('blue-background');
  });
}
// $(document).ready(changeBackgroundColor);

function changeButton() {
  $('#follow_btn').click(function() {
    $(this).fadeOut();
    $('#unfollow_btn').delay(400).fadeIn();
  });
  $('#unfollow_btn').click(function() {
    $(this).fadeOut();
    $('#follow_btn').delay(400).fadeIn();
  });
}
$(document).ready(changeButton);

function deleteMessage(id) {
  console.log("Deleting message " + id);
  $.ajax({
      url: '/message/' + id,
      type: 'DELETE',
      data: { authenticity_token: $('[name="csrf-token"]')[0].content},
      success: function(result) {
        $('#message_' + id).fadeOut(500);
      }
  });
}
