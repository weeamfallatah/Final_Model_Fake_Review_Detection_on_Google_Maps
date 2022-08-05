

function testdata() {
    try {
        var email = document.getElementById("email").value;
        var pass = document.getElementById("password").value;
        var confirm = document.getElementById("confirm").value;
        var name = document.getElementById("name").value;
        if (name=="") {
            showMessage("ادخل اسم المستخدم ");
            return false;
        }
        if (email.indexOf(".") == -1 || email.indexOf("@") == -1) {
            showMessage("ادخل البريد الالكتروني بصورة صحيحة");
            return false;
        }
        if (pass != confirm) {
            showMessage("كلمتي المرور غير متطابقتين");
            return false;
        }
        $.ajax({
            type: "GET",
            url: "code/register.ashx",
            data: { email: email, pass: pass, name: name },
            success: function (text) {
                if (text == "1") {
                    showMessage("تمت عملية التسجيل بنجاح");
                   
                }
                else { showMessage('البريد الالكتروني مسجل من قبل  ', 'alert'); }
            },
            error: function (text) { showMessage(text); }
        });
    } catch (e) { showMessage(e, 'alert'); }
}

//==================
