
$(function () {
    ListMemberSearch();
});
function ListMemberSearch() {
    try {

        $.ajax({
            type: "GET",
            url: "code/ListMember.ashx",
            data: {},
            success: function (text) {
                //alert(text);
                var data = "";
                if (text != "") {
                    var obj = JSON.parse(text);
                    if (obj.length > 0) {
                        for (var x = 0; x < obj.length; x++) {
                            data += "<div class='w3-row w3-border w3-round-large w3-margin-top w3-container'> ";
                            data += "<p class='w3-col w3-s12 m6 l6 w3-right '> ألاسم :" + obj[x].fullName + "</p>";
                            data += "<p class='w3-col w3-s12 m6 l6 w3-right '>البريد الالكتروني : " + obj[x].email + "</p>";
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

