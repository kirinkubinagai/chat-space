$(function() {
  $(document).on("turbolinks:load",function(){
    function buildHTML(data) {
      var chat =
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
      '</ul>'
      var html = chat;

      if(data.image.image.url != null){
        var image_data = data.image.image.url;
        var alt_data = image_data.replace(/\.jpg/,"");
        var new_alt_data = alt_data.replace(/_/g," ");
        var new_alt_data = new_alt_data.replace(/\/uploads\//,"");
        var images =
            '<div class= "chat_message_image">' +
              '<img src ="' + image_data + '"' + ' alt ="' + new_alt_data +'" class ="chat_img">'
            '</div>'
        var context = $(chat).find(".chat-message").append(images)
        var html = $(chat).append(images);
      }

    return html;
    }

    $('#message_submit').on('click', function(e) {
      e.preventDefault();
      var form = $("#new_message").get()[0];
      var formData = new FormData(form);
      var message = $("textarea").val();
      var new_url = $("#new_message").attr("action");
      var new_url_for_json = new_url+".json";
      $.ajax({
        type: 'POST',
        url: new_url_for_json,
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data) {
        $('.chat-body').append(buildHTML(data));
        $("#message_body").val("");
        return false;
      })
      .fail(function() {
        alert('error');
      });
    });
  });
});
// 複数の画像を投稿した時の条件分岐ができてない
