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
        elm += "<img class='imggg2' src='" + userImg + "'>";
        elm += "<span>" + " :  " + content + "</span>";

        elm += "</td>";
        elm += "<td><button id='like_" + chatId + "'>讚</button>";
        elm += "<button id='unlike_" + chatId + "'>已按讚</button></td>";
        elm += "</tr>";
        $("#live_talk_table").append(elm);

        $("#chat_content").val("");

        $("#like_" + chatId).click(function(e) {
            e.preventDefault();
            var chatIds = chatId;
            var userId = userId;
            var live_showId = live_show_id;
            // var love_counts = love_count;
            var chat_Id = c;
            setLike(chatIds, userId, live_showId);
        });
        $("#unlike_" + chatId).click(function(e) {
            e.preventDefault();
            var chatIds = chatId;
            var userId = userId;
            var live_showId = live_show_id;
            setunLike(chatIds, userId, live_showId);
        });


    }
});

function setLike(chatIds, userId, live_showId) {
    $.ajax({
        url: "/live_shows/" + live_showId + "/chats/" + chatIds + "/like",
        data: { user: { id: userId } },
        method: "post",
        dataType: "JSON",
        success: function(data) {
            console.log('set_Like success!!', data);
            // $(".like").addClass("select");
            // love_counts++;
            // $("#count_message_" + messageIds).html(love_counts);
            // console.log('love_counts=', love_counts);


        },
        error: function(message) {
            console.log('set_Like error!!', message);
        }
    })
}

function setunLike(chatIds, userId, live_showId) {
    $.ajax({
        url: "/live_shows/" + live_showId + "/chats/" + chatIds + "/unlike",
        data: { user: { id: userId } },
        method: "post",
        dataType: "JSON",
        success: function(data) {
            console.log('set_unLove success!!', data);
            // $(".like").addClass("select");
            // love_counts--;
            // $("#count_message_" + messageIds).html(love_counts);
        },
        error: function(message) {
            console.log('set_unLove error!!', message);
        }
    })
}
