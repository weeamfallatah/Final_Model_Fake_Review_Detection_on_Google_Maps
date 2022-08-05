
function testdata() {
    try {
        var id = document.getElementById("loginid").value;
        var pass = document.getElementById("loginpass").value;

        if (id == "") {
            showMessage("ادخل البريد الالكتروني ");
            return;
        }
        if (pass == "") {
            showMessage("ادخل كلمة المرور ");
            return;
        }

        $.ajax({
            type: "GET",
            url: "code/Login.ashx",
            data: { id: id, pass: pass },
            success: function (text) {
                //alert(text);
                document.getElementById("loginid").value = "";
                document.getElementById("loginpass").value = "";
                if (text != "") {
                    window.location = text;
                }
                else { showMessage('الايميل الالكتروني او كلمة المرور غير صحيحة ', 'alert'); }
            },
            error: function (text) { showMessage(text); }
        });
    } catch (e) { showMessage(e, 'alert'); }
}

//==================


function shortPath() {
    try {

        console.log("Hello world!");
        $.ajax({
            type: "GET",
            url: "code/shortPath.ashx",
            data: { },
            success: function (text) {
                alert(text);
               
            },
            error: function (text) { alert(text); }
        });
    } catch (e) { alert(e); }
}
