$(function(){
  function buildHTML(data) {
    var exit_user_data = $("#chat-group-users").children();
    exit_user_data.remove();
    //表示がのこっているもの削除

    for( var i = 0; i < data.length; i++ ){
      html =
      '<div class="chat-group-user clearfix" id="chat-group-user-' + data[i].id + '">' +
        data[i].name +
        '<a class= "user_add" data_user_name="'+data[i].name +'"data_user_id="' + data[i].id +'">' +
          '追加' +
        '</a>' +
      '</div>';
    $("#chat-group-users").append(html);
    }
    //リストを表示

    $(".user_add").on("click",function(data){
      var name = $(this).attr("data_user_name");
      var id = $(this).attr("data_user_id");

      html =
        '<div class="chat-group-user clearfix" id = "' +id + '">' +
          name +
          '<a class="user_delete" >' +
            '削除' +
          '</a>' +
          '<input type="hidden" name="chat_group[user_ids][]" value="' +id + '">' +
        '</div>'
      $("#chat-group-users-added").append(html);
      var added_user = $(this).parent();
      added_user.remove();
      //追加を押した時に下に名前を表示、追加が押された時にそのリストも消す

      $(".user_delete").on ("click",function(){
        var delete_name = $(this).parent();
        delete_name.remove();
      })
      //削除を押して削除する

    })
  }

  $("#user-search-field").on("keyup",function(e){
    e.preventDefault();
    var input = $("#user-search-field").val();
    var params = {name: input};
    $.ajax({
      type: "get",
      url: "/users/search",
      data: params,
      dataType: "json"
    })
    .done(function(data){
      buildHTML(data);
    });
  });
});

