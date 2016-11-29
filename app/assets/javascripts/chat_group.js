$(function(e){
  function buildHTML(data) {
    var user_data = []

    for(var i=0 ;i < data.length;i++){
      html =
        '<div class = "chat-group-user clearfix" id = "chat-group-user-' + data[i].id + '">' +
          data[i].name +
          '<a class= "user_add" data_user_name="'+data[i].name +'"data_user_id="' + data[i].id +'">' +
            '追加' +
          '</a>' +
        '</div>'
        user_data.push(data[i])
      $("#chat-group-users").append(html)
      }

      $(".user_add").on("click",function(data){
        var user_data = $(this).context
        name = $(user_data).attr("data_user_name")
        id = $(user_data).attr("data_user_id")

      html =
        '<div class = "chat-group-user clearfix" id = "' + id + '">' +
        name +
          '<a class= "user_add" >' +
            '削除' +
          '</a>' +
        '</div>'
      $("#chat-group-users-added").append(html)

      $(".user_add").on("click",function(){
        var remove_data = $(this).parent()
        remove_data.remove()
      })

      })
    e.preventDefault;
  }


  $("#user-search-field").on("keyup",function(e){
    e.preventDefault();
    var input = $("#user-search-field").val();
    var params = {name: input}
    $.ajax({
      type: "get",
      url: "/users/search",
      data: params,
      dataType: "json"
    })
    .done(function(data){
      buildHTML(data);
    })
  })
})

