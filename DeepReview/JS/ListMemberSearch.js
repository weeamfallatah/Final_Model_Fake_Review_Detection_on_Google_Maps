
$(function () {
    ListMemberSearch();
});
function ListMemberSearch() {
    try {

        $.ajax({
            type: "GET",
            url: "code/ListMemberSearch.ashx",
            data: {},
            success: function (text) {
                //alert(text);
                var data = "";
                if (text != "") {
                    var obj = JSON.parse(text);
                    if (obj.length > 0) {
                        for (var x = 0; x < obj.length; x++) {
                            data += "<div class='w3-row w3-border w3-round-large w3-margin-top w3-container'> ";
                            data += "<p class='w3-col w3-s12 m6 l6 w3-right '>تاريخ البحث" + obj[x].searchDate + "</p>";
                            data += "<p class='w3-col w3-s12 m6 l6 w3-right '>العنوان : " + obj[x].searchAddress + "</p>";
                            data += "<p class='w3-col w3-s12 m6 l6 w3-right'>التقيم الحالي : " + obj[x].currentRate + "</p>";
                            data += "<p class='w3-col w3-s12 m6 l6 w3-right'>تقيم العينة : " + obj[x].sampleRate + "</p>";
                            data += "<p class='w3-col w3-s12 m6 l6 w3-right'>التقيم الفعلي  : " + obj[x].actualRate + "</p>";
                            data += "<p class='w3-col w3-s12 m6 l6 w3-right'>اجمالي التعليفات   : " + obj[x].totalReview + "</p>";
                            data += "<p class='w3-col w3-s12 m6 l6 w3-right'>تعليقات العينة   : " + obj[x].SampleReview + "</p>";
                            data += "<p class='w3-col w3-s12 m6 l6 w3-right'>التعليقات المزيفة  : " + obj[x].fakeReview + "</p>";
                            data += "<p class='w3-col w3-s12 m6 l6 w3-right'>التعليقات الموثوقة  : " + obj[x].SampleReview + "</p>";
                            data += "</div>";
                        }
                    }
                }
                document.getElementById("data").innerHTML = data;
            },
            error: function (text) { showMessage(text); }
        });
    }
    catch (e) { showMessage(e); }
}

//---------------

