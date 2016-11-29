$(function() {
  function buildHTML(data) {
    var chat =
    console.log(data.name)
      data.filter
      '<ul class="chat-message">' +
        '<li class = "chat-message__header">' +
          '<p class = "chat-message__name">' +
            data.name +
          '</p>' +
          '<p class = "chat-message__time">' +
            data.created_at +
          '</p>' +
        '</li>' +
        '<li class = "chat-message__body">' +
            data.body +
        '</li>' +
      '</ul>' ;
    return chat ;
  }

  $('.new-message').on('submit', function(e) {
    e.preventDefault();
    var message = $("textarea").val();
    var new_url = $("#new_message").attr("action");
    var new_url_for_json = new_url+".json";
    $.ajax({
      type: 'POST',
      url: new_url_for_json,
      data: {message: {body: message}},
      dataType: 'json'
    })
    .done(function(data) {
      html = buildHTML(data);
      $('.chat-body').append(html);
      $("#message_body").val("");
    })
    .fail(function() {
      alert('error');
    });
  });
});
