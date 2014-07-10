$(function(){

  $("#new_greeting").submit(function(){
    $.post(
      "/greetings",
      $("#new_greeting").serialize())
      return false;
  });

  var pusher = new Pusher(window.PUSHER);
  var channel = pusher.subscribe(window.CHANNEL);

  channel.bind("new_greeting", function(data){
    $("#greetings-list").prepend(data.greeting);
    return false;
  });
});
