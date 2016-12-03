$(function() {
  $(document).on("turbolinks:load",function(){
    function buildHTML(data) {
      var image_data = data.image||data.image.image.url
      var images =
        '<div class= "chat_message_image">' +
          '<img src ="' + image_data + '"' +
        '</div>';
        //imageの定義決め

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
      '</ul>';
      var html = chat;
      //htmlイメージがない場合のhtmlの追加


      if(data.image.image.url != null){
        console.log(data)
        // var image_data = data.image||data.image.image.url
        //SQLから出て来る値のurlの取り出しかたとformからの取り出し方は違うので2つともimage_dataとして取り扱うようにする。
        var alt_data = image_data.replace(/\.jpg/,"");
        var new_alt_data = alt_data.replace(/_/g," ");
        var new_alt_data = new_alt_data.replace(/\/uploads\//,"");
        var html = $(chat).append(images);
      }

      // if(data.instanceof Array){        //getmessagesのときの場合配列として戻って来るので配列のときはこれが呼ばれる
      //   for (var i=0;i<data.length;i++){
      //   var data = data[i]
      //     var html = chat
      //     if (data.image !== null){              //中でも画像がある場合
      //       var html = chat.append(images)
      //     }
      //     var html += html                      //htmlに足していく
      //   }
      // }
      return html;
      console.log(data)
    }

    function getMessages(){
      var href = window.location.href;
      $.ajax({
        type: "get",
        url: href,
        dataType: "json"
      })

      .done(function(data){
        $('.chat-body').append(buildHTML(data));
      })

      .fail(function(a_data){
        alert("error")
      })
    }
    //メッセージ全部取得して表示する

    setInterval(getMessages,10000)
    //時間ごとにgetMessagesの処理を行う

    $('#message_submit').on('click', function(e) {
      e.preventDefault();
      var new_url = $("#new_message").attr("action");
      var new_url_for_json = new_url+".json";
      // urlの取得

      var form = $("#new_message").get()[0];
      var formData = new FormData(form);
      // console.log(formData)
      //formデータの取得

      $.ajax({
        type: 'POST',
        url: new_url_for_json,
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      //createアクションのjson指定のデータを取得する

      .done(function(data) {
        // console.log(data)

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
