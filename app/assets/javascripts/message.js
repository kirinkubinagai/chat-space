$(function() {
  function buildHTML(data) {
    var chat =
      '<ul class="chat-message">'
        '<li class = "chat-message__header">'
          '<p class = "chat-message__name">'
            data.name
          '</p>'
          '<p class = "chat-message__time">'
            data.created_at
          '</p>'
        '</li>'
        '<li class = "chat-message__body">'
            data.body
        '</li>'
      '</ul>'
    $("<div class='chat_body'>").append(chat)
  }

  $('.new-message').on('submit', function(e) {
    e.preventDefault();
    var text_field = $("textarea")
    var message = text_field.val();
    var new_url = $("#new_message").attr("action")
    var new_url_for_json = new_url+".json"
    $.ajax({
      type: 'POST',
      url: new_url_for_json,
      data: {message: {body: message}},
      dataType: 'json'
    })
    .done(function(data) {
      buildHTML(data);
      $("#message_body").val("")
    })
    .fail(function() {
      alert('error');
    });
  });
});
