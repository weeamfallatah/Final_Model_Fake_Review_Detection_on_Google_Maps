var obj
$(function () {
    showinfo('list');
});


//==================
function showinfo(mode) {

    try {
        var name = document.getElementById('name').value;
        var id = document.getElementById('id').value;
        var value = document.getElementById('value').value;
        $.ajax({
            type: "GET",
            url: "code/words.ashx",
            data: { id: id, name: name, value: value, mode: mode },
            success: function (text) {
                if (text != "") {
                    obj = JSON.parse(text);
                    if (obj.Result != '') showMessage(obj.Result);
                    var data = "";
                    for (var x = 0; x < obj.Records.length; x++) {
                        data += " <li   class=' w3-padding w3-right-align' onclick='showdata(\"" + x + "\")'>";
                        data += " <div class='w3-row'>";
                        data += "<p class='w3-col l6 s12 m12 w3-right-align w3-right'>";
                        data += " <b>" + obj.Records[x].words + "</b> </p> ";
                        data += " <p class='w3-col l6 s12 m12 w3-right-align w3-right'><b>" + obj.Records[x].ratio + "</b></p>";
                        data += "</div></li>";
                    }
                    document.getElementById("sdata").innerHTML = data;
                }
            },
            error: function (text) { showMessage(text); }
        });
    } catch (e) { showMessage(e, 'alert');}

}

function testinput()
{
 try {
        var name =document.getElementById('name').value ;
        var value = document.getElementById('value').value;
       
        if (name == "") {
            showMessage("ادخل الكلمة");
            return;
        }
        if (value == "") {
            showMessage("ادخل الفيمة");
            return;
        }
        
        document.getElementById('data').style.display = 'none';
        showinfo(document.getElementById('mode').value);
    }
    catch (e) { showMessage(e); }
}
function add() {
    try {
        document.getElementById('name').value = "";
        document.getElementById('value').value = "";
        document.getElementById('id').value = "";
        document.getElementById('data').style.display = 'block';
        
        var x = document.getElementById('btndelete');
        if (x.className.indexOf("w3-hide") == -1) {
            x.className += " w3-hide";
        }
        document.getElementById('mode').value = "add";
    }
    catch (e) { showMessage(e); }
}

function showdata(no) {
    try {
        //if (chk == true) {chk = false;  return; }
        document.getElementById('name').value = obj.Records[no].words;
        document.getElementById('value').value = obj.Records[no].ratio;
        document.getElementById('id').value = obj.Records[no].wordID;
        document.getElementById('data').style.display = 'block';
        var x = document.getElementById('btndelete');
        if (x.className.indexOf("w3-hide") != -1) {
            x.className = x.className.replace(" w3-hide", "");
        }
        document.getElementById('mode').value = "edit";
    }
    catch (e) {showMessage(e);}
}
function del(no) {
    try {
        ans = confirm("هل انت متاكد");
        if (ans) {
            document.getElementById('mode').value = "delete";
            document.getElementById('data').style.display = 'none';
            showinfo('delete');
        }
    }
    catch (e) { showMessage(e); }
}


//---------------

