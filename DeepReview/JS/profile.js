

function testdata() {
    try {
        var pass = document.getElementById("ContentPlaceHolder1_password").value;
        var name = document.getElementById("ContentPlaceHolder1_name").value;
        if (name=="") {
            showMessage("ادخل اسم المستخدم ");
            return false;
        }
      
        
        $.ajax({
            type: "GET",
            url: "code/UpdateMember.ashx",
            data: {  pass: pass, name: name },
            success: function (text) {
                if (text == "1") {
                    showMessage("تمت التعديل  بنجاح");
                   
                }
                else { showMessage('فشلت عملية التعديل  ', 'alert'); }
            },
            error: function (text) { showMessage(text); }
        });
    } catch (e) { showMessage(e, 'alert'); }
}

//==================
