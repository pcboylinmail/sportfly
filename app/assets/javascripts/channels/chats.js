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
        var like_count = data["chat"]["likes_count"]
        var chatId = data["chat"]["id"];
        var content = data["chat"]["content"];
        var c = data["chat"]["id"];

        var container = $("#table");
        var elm = "<tr>";
        // elm += "<td id='count_chat_" + chatId + "'>" + "</td>";
        elm += "<td id='count_chat_" + chatId + "'>" + like_count + "</td>";
        // if (current_user_id == userId) {
        //     elm += "<td class='live_talk_r'>";
        // } else {
        //     elm += "<td class='live_talk_l'>";
        // }
        elm += "<td class='live_talk_r'>";
        elm += "<img class='imggg2' src='" + userImg + "'>";
        elm += "<span>" + " :  " + content + "</span>";

        elm += "</td>";
        // if (setLike) {
        //     elm += "<td><button id='unlike_" + chatId + "'>已按讚</button></td>";
        // }else{
        //     elm += "<td><button id='like_" + chatId + "'>讚</button></td>";
        // }

        elm += "<td><button id='unlike_" + chatId + "'>已按讚</button>";

        elm += "<button id='like_" + chatId + "'>讚</button></td>";

        elm += "</tr>";
        $("#live_talk_table").append(elm);

        $("#chat_content").val("");

        $("#like_" + chatId).click(function(e) {
            e.preventDefault();
            var chatIds = chatId;
            var userId = userId;
            var live_showId = live_show_id;
            var like_counts = like_count;
            // var chat_Id = c;
            setLike(chatIds, userId, live_showId, like_counts);
        });
        $("#unlike_" + chatId).click(function(e) {
            e.preventDefault();
            var chatIds = chatId;
            var userId = userId;
            var live_showId = live_show_id;
            var like_counts = like_count;
            setunLike(chatIds, userId, live_showId, like_counts);
        });


    }
});

function setLike(chatIds, userId, live_showId, like_counts) {
    $.ajax({
        url: "/live_shows/" + live_showId + "/chats/" + chatIds + "/like",
        data: { user: { id: userId } },
        method: "post",
        dataType: "JSON",
        success: function(data) {
            console.log('set_Like success!!', data);
            // $(".like").addClass("select");
            like_counts++;
            $("#count_chat_" + chatIds).html(like_counts);
            console.log('like_counts=', like_counts);


        },
        error: function(message) {
            console.log('set_Like error!!', message);
        }
    })
}

function setunLike(chatIds, userId, live_showId, like_counts) {
    $.ajax({
        url: "/live_shows/" + live_showId + "/chats/" + chatIds + "/unlike",
        data: { user: { id: userId } },
        method: "post",
        dataType: "JSON",
        success: function(data) {
            console.log('set_unLike success!!', data);
            // $(".unlike").addClass("select");
            like_counts = like_counts - 1;
            if (like_counts < 0) {
                like_counts = 0;
            }
            $("#count_chat_" + chatIds).html(like_counts);
        },
        error: function(message) {
            console.log('set_unLike error!!', message);
        }
    })
}
