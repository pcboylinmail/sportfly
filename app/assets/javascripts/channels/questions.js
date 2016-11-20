App.questions = App.cable.subscriptions.create({channel:"QuestionsChannel"} , {
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
        var userCount = data["question"]["users_count"];
        // var like_count = data["question"]["likes_count"]
        var questionId = data["question"]["id"];

        var content = data["question"]["subject"];
        // var askingId = data["asking"]["id"];
        // var c = data["question"]["id"];
        var userName = data["user"]["fb_name"]
        var container = $("#table");
        var elm = "<tr>";
        // elm += "<td id='count_question_" + questionId + "'>" + "</td>";
        elm += "<td id='count_question_" + questionId + "'>"+userCount+"</td>";
        // if (current_user_id == userId) {
        //     elm += "<td class='live_talk_r'>";
        // } else {
        //     elm += "<td class='live_talk_l'>";
        // }
        elm += "<td class='live_talk_r'>";
        elm += "<img class='imggg2' src='" + userImg + "'>";
        elm += "<span>" + userName + "</span>";
        elm += "<span>" + " :  " + content + "</span>";

        elm += "</td>";
        // if ($("#like_" + questionId).click()) {
        //     elm += "<td><button id='unlike_" + questionId + "'>已按讚</button></td>";
        // }else{
        //     elm += "<td><button id='like_" + questionId + "'>讚</button></td>";
        // }

        // elm += "<td><button id='unlike_" + questionId + "'>已按讚</button>";

        elm += "<td><button id='like_" + questionId + "'>讚</button></td>";

        elm += "</tr>";
        elm += "$(#count_question_"+ questionId +").html(userCount);";
        $("#live_talk_table").append(elm);
        console.log('set_Like success!!', userCount);
        //$("#content").val("");
        
        $("#like_" + questionId).click(function(e) {
            e.preventDefault();
            var questionIds = questionId;
            var userIds = userId;
            var live_showId = live_show_id;
            var userCounts = userCount;
            setLike(questionIds, userIds, live_showId, userCounts);
            
        });
        // $("#like_" + questionId).click(function(e) {
        //     e.preventDefault();
        //     var questionIds = questionId;
        //     var userIds = userId;
        //     var live_showId = live_show_id;
        //     var like_counts = like_count;
        //     // var question_Id = c;
        //     setLike(questionIds, userIds, live_showId, like_counts);

        // });
        // $("#unlike_" + questionId).click(function(e) {
        //     e.preventDefault();
        //     var questionIds = questionId;
        //     var userIds = userId;
        //     var live_showId = live_show_id;
        //     var askingIds = askingId;
        //     console.log('askingIds=',askingIds);
        //     //var like_counts = like_count;
        //     setunLike(questionIds, userIds, live_showId, askingIds);
        // });


    }

});

function setLike(questionIds, userIds, live_showId, userCounts) {
    $.ajax({
        // /live_shows/:live_show_id/questions/:question_id/askings
        url: "/live_shows/" + live_showId + "/questions/" + questionIds + "/askings",
        data: { user: { id: userIds } },
        method: "post",
        dataType: "JSON",
        success: function(data) {
            console.log('set_Like success!!', data);

            // $(".like").addClass("select");
            
            $("#count_question_" + questionIds).html(userCounts);


        },
        error: function(message) {
            console.log('set_Like error!!', message);
            console.log('userCounts=', userCounts);
        }
    })
}

// function setunLike(questionIds, userIds, live_showId, askingIds) {
//     $.ajax({
//         url: "/live_shows/" + live_showId + "/questions/" + questionIds + "/asking"+askingIds,
//         data: { user: { id: userIds } },
//         method: "delete",
//         dataType: "JSON",
//         success: function(data) {
//             console.log('set_unLike success!!', data);
//             console.log('userIds=', userIds);
//             // $(".unlike").addClass("select");
//             // like_counts = like_counts - 1;
//             // if (like_counts < 0) {
//             //     like_counts = 0;
//             // }
//             // $("#count_question_" + questionIds).html(like_counts);
//         },
//         error: function(message) {

//         }
//     })
// }
