App.chats = App.cable.subscriptions.create("ChatsChannel", {
    connected: function() {
        console.log("連上囉!")
    },
    disconnected: function() {
        console.log("斷線了!")
    },
    received: function(data) {
        console.log("收到資料: ");
        console.log(data);

        var userImg = data["user"]["fb_image"];
        var userId = data["user"]["id"];
        var love_count = data["chat"]["loves_count"]
        var chatId = data["chat"]["id"];
        var content = data["chat"]["content"];
        var c = data["chat"]["id"];

        var container = $("#table");
        var elm = "<tr>";
        elm += "<td id='count_chat_" + chatId + "'>" + "</td>";
        // elm += "<td id='count_chat_" + chatId + "'>" + love_count + "</td>";
        // if (current_user_id == userId) {
        //     elm += "<td class='live_talk_r'>";
        // } else {
        //     elm += "<td class='live_talk_l'>";
        // }
        elm += "<td class='live_talk_r'>";
        elm += "<img class='imggg2' src='" +userImg+ "'>";
        elm += "<span>" + " :  " + content + "</span>";

        elm += "</td>";
        elm += "<td></td>";
        // elm += "<td><button id='love_" + chatId + "'>love</button>";
        // elm += "<button id='unlove_" + chatId + "'>unlove</button></td>";
        elm += "</tr>";
        $("#live_talk_table").append(elm);

        $("#chat_content").val("");

        // $("#love_" + chatId).click(function(e) {
        //     e.preventDefault();
        //     var chatIds = chatId;
        //     var userId = userId;
        //     var chatroomId = chat_room_id;
        //     var love_counts = love_count;
        //     var chat_Id = c;
        //     setLove(chatIds, userId, chat_room_id, love_counts);
        // });
        // $("#unlove_" + chatId).click(function(e) {
        //     e.preventDefault();
        //     var chatIds = chatId;
        //     var userId = userId;
        //     var chatroomId = chat_room_id;
        //     setunLove(chatIds, userId, chatroomId);
        // });


    }
});
