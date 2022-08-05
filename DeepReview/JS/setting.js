var loading;
var isOpen = false;

$(document).ready(function () {
    try {
            $(document).ajaxStart(function () {
                loading = new showLoad();
                setTimeout(function () { loading.hideLoad(); }, 30000);
            })
       .ajaxStop(function () {
           loading.hideLoad();
       });
    }
   catch (e) { showMessage(e); }
});


//------------------------------------

var showMessage = function (message, type) {
    $("#Attiah_message").remove();
    var color = 'w3-theme';
    if (type == 'success') {
        color = ' w3-green';
    }
    else if (type == 'alert') {
        color = ' w3-red ';
    }
    else {
        color = ' w3-theme ';
    }
    var msg = ' <div id="Attiah_message" class="w3-modal" style="display:none; ">';
    msg += ' <div style=" width:500px; height:60px;" class=" w3-modal-content  w3-display-container w3-card w3-round-xlarge w3-animate-opacity ' + color + '">';
    msg += ' <span onclick="document.getElementById(\'Attiah_message\').style.display = \'none\';"';
    msg += ' class="w3-button ' + color + ' w3-xlarge w3-display-left " style="padding-left:10px;">&times;</span>';
    msg += ' <p style="padding-top:10px;" class="w3-center w3-large ">' + message + '</p>';
    msg += ' </div></div> '; $('body').append(msg);
    document.getElementById('Attiah_message').style.display = 'block';
    setTimeout(function () {
        document.getElementById('Attiah_message').style.display = 'none';
    }, 1500);
};
//---------------------------------------------
var showLoad = function () {
    $("#Attiah_Load").remove();
    var color = 'w3-theme';
    var msg = ' <div id="Attiah_Load" class="w3-modal" style="display:none; "> <div style=" width:350px; height:50px;" class=" w3-modal-content w3-center w3-padding w3-large w3-display-container w3-card w3-round-xlarge w3-animate-opacity ' + color + '"> جاري التحميل من فضلك انتظر ...  &nbsp; <img  src="Images/sb_loading.gif" /> </div></div> ';
    $('body').append(msg); document.getElementById('Attiah_Load').style.display = 'block';
    this.hideLoad = function () {
        document.getElementById('Attiah_Load').style.display = 'none';
    };
};


//------------------------
function openMenu() {
        document.getElementById("mySidebar").style.display = "block";
}

function closeMenu() {
    document.getElementById("mySidebar").style.display = "none";
}


function saveSetting() {
    try {
        var sampleNo = document.getElementById("ContentPlaceHolder1_sampleNo").value;
        var language = document.getElementById("ContentPlaceHolder1_language").value;
        var ratio = document.getElementById("ContentPlaceHolder1_ratio").value;

        if (sampleNo == "") {
            showMessage("حدد عدد التقيمات المطلوبة");
            return;
        }
        if (language == "") {
            showMessage("يجب تحديد اللغه ");
            return;
        }

        $.ajax({
            type: "GET",
            url: "code/UpdateSetting.ashx",
            data: { language: language, sampleNo: sampleNo, ratio: ratio },
            success: function (text) {
                if (text == "1") {
                    showMessage('تم حفظ التغيرات بنجاح');
                }
                else { showMessage('فشلت عملية حفظ التغيرات '); }
            },
            error: function (text) { showMessage(text); }
        });
    } catch (e) { showMessage(e, 'alert'); }
}