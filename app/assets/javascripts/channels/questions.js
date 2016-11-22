App.questions = App.cable.subscriptions.create({ channel: "QuestionsChannel"}, {
    connected: function() {
        console.log("連上囉!")
    },
    disconnected: function() {
        console.log("斷線了!")
    },
    received: function(data) {
        console.log("收到資料: ");
        console.log("------");
        console.log(data);
        console.log("------");
        $.getScript("/ccc/js/progress-ring.js", function() {
            if (data["type"] === "submit_comment") {
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

                //elm += "<td id='count_question_" + questionId + "'>"+userCount+"</td>";
                elm += "<td id='count_question_" + questionId + "'><div class='progress-ring' data-percent='" + userCount + "'></div></td>";
                console.log(userCount);
                elm += "<td class='live_talk_r'>";
                elm += "<img class='imggg2' src='" + userImg + "'>";
                elm += "<span>" + userName + ":" +"</span><br>";
                elm += "<p>"+ content + "</p>";

                elm += "</td>";

                elm += "<td id=td_like_" + questionId + "><p id='like_" + questionId + "' class='glyphicon glyphicon-plus'></p></td>";
                //elm += "<script src='/ccc/js/progress-ring.js'></script>";
                elm += "<script> $('.progress-ring').loadingRing(); </script>";


                elm += "</tr>";

                $("#live_talk_table").append(elm);
                //submit comment action
            } else if (data["type"] === "add_like") {
                var jqueryDomId = data["question"]["id"] //1770
                var count = data["question"]["users_count"]
                var askingId = data["asking"]["id"]

                console.log(count);
                $("#count_question_" + jqueryDomId).html("<div class='progress-ring' data-percent='" + count + "'></div><script> $('.progress-ring').loadingRing(); </script>");
            }
            $("#like_" + questionId).click(function(e) {
                e.preventDefault();
                var questionIds = questionId;
                var userIds = userId;
                var live_showId = live_show_id;
                var userCounts = userCount;
                setLike(questionIds, userIds, live_showId, userCounts);

            });
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
        });

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
            console.log('set_Like success!!', questionIds);
            $("#td_like_" + questionIds).html("");
        },
        error: function(message) {
            console.log('set_Like error!!', message);
        }
    })
}