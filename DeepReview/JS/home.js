var words = null;

$(function () {
    try {
        $.ajax({
            type: "GET",
            url: "code/words.ashx",
            success: function (text) {
                if (text != "") {
                    obj = JSON.parse(text);
                    words = obj.Records;
                }
            },
            error: function (text) {
                alert(text);
            }
        });
    }
    catch (e) {
        alert(e);
    }
});

function search() {
    try {
        var language = document.getElementById("ContentPlaceHolder1_language").value;
        var sampleNo = document.getElementById("ContentPlaceHolder1_sampleNo").value;
        var Database_ratio =parseFloat(document.getElementById("ContentPlaceHolder1_ratio").value);
        var location = document.getElementById("location").value;


        if (location == "") {
            showMessage("يجب ادخال العنوان اولا");
            return;
        }
        $.ajax({
            type: "GET",
            url: "https://api.app.outscraper.com/maps/reviews-v2?async=false&apiKey=Z29vZ2xlLW9hdXRoMnwxMDEyOTQ2MjUxMzg0MTA2NTg5Mzh8OTJlNjY5NGUzYg&reviewsLimit=" + sampleNo + "&query=" + location + "&language=" + language,
            success: function (text) {
              
                console.log(text);

                document.getElementById("allRate").innerHTML = "تقيم خرائط (Google): " + text.data[0].rating;
                document.getElementById("fakeRate").innerHTML = "التقيم الموثوق :  ";
                //document.getElementById("reallyRate").innerHTML = "التقيم للعينة  : " + text.data[0].reviews;
                document.getElementById("allreview").innerHTML = "جميع المراجعات : " + text.data[0].reviews_data.length;
                document.getElementById("fakereview").innerHTML = " المراجعات المزيفة  :  ";
                document.getElementById("reallyreview").innerHTML = "المراجعات الموثوقة : "+ text.data[0].reviews_data.length;
                var info = "";
                var good = "";
                var fake = "";
                var rateValue = 0.0;
                var rateFake = 0.0;
                var rateGood = 0.0;
                var Fakeno = 0;
                var goodno = 0;
                for (var i = 0; i < text.data[0].reviews_data.length; i++) {
                    console.log("--------------->----->---->");
                    rateValue = rateValue + text.data[0].reviews_data[i].review_rating;
                    info += "<p class='w3-container' style='text-align:right ; font - family: verdana; font - size: 90 %; color:#696969'> التقيم :" + text.data[0].reviews_data[i].review_rating + "</p>";
                    info += "<p class='w3-container' style='text-align:right ; font - family: verdana; font - size: 90 %; color:#696969'> المراجعة:  </p>";
                    info += "<p class='w3-container' style='text-align:right ; font - family: verdana; font - size: 90 %; color:#696969'>" + text.data[0].reviews_data[i].review_text + "</p>   <hr  style=' color: #50c878; border - top: 3px double #50c878;'/>";
                    //-------------------------
                    var sumValue = 0;
                    var sumWord = 0;
                    console.log(text.data[0].reviews_data[i].review_text);
                    var ReviewWords = text.data[0].reviews_data[i].review_text.split(" ");
                    for (var m = 0; m < ReviewWords.length; m++) {
                        var str = filter(ReviewWords[m]);
                        for (var n = 0; n < words.length; n++) {
                            console.log(str + " word  " + words[n].words + "  " + str.includes(words[n].words) + "  " + words[n].ratio);
                            if (str.includes(words[n].words)) {
                                sumWord = sumWord + 1;
                                sumValue = sumValue + parseFloat(words[n].ratio);
                            }
                        }
                    }

                    var ratio = (sumValue / (ReviewWords.length * 1.0)) * 100;
                    ratio = ratio.toFixed(1);
                    console.log(ratio + " sum value " + sumValue + " length " + ReviewWords.length);
                    if (ratio >= Database_ratio) {
                        rateFake = rateFake + text.data[0].reviews_data[i].review_rating;
                        Fakeno = Fakeno + 1;
                        fake += "<p class='w3-container' style='text-align:right ; font - family: verdana; font - size: 90 %; color:#696969'> التقيم :" + text.data[0].reviews_data[i].review_rating + "</p>";
                        fake += "<p class='w3-container' style='text-align:right ; font - family: verdana; font - size: 90 %; color:#696969'> المراجعة : </p>";
                        fake += "<p class='w3-container' style='text-align:right ; font - family: verdana; font - size: 90 %; color:#696969'>" + text.data[0].reviews_data[i].review_text + "</p>   <hr  style=' color: #50c878; border - top: 3px double #50c878;'/>";
                    }
                    else {
                        rateGood = rateGood + text.data[0].reviews_data[i].review_rating;
                        goodno = goodno + 1;
                        good += "<p class='w3-container' style='text-align:right ; font - family: verdana; font - size: 90 %; color:#696969'> التقيم :" + text.data[0].reviews_data[i].review_rating + "</p>";
                        good += "<p class='w3-container' style='text-align:right ; font - family: verdana; font - size: 90 %; color:#696969'> المراجعة </p>";
                        good += "<p class='w3-container' style='text-align:right ; font - family: verdana; font - size: 90 %; color:#696969'>" + text.data[0].reviews_data[i].review_text + "</p>   <hr  style=' color: #50c878; border - top: 3px double #50c878;'/>";
                    }
                    //-----------------------------

                }
                //console.log(rateValue + " t " + text.data[0].reviews_data.length + " r " + ((rateValue / (text.data[0].reviews_data.length * 1.0))));
                //console.log(rateGood + " t " + text.data[0].reviews_data.length + " r " + ((rateGood / (text.data[0].reviews_data.length * 1.0))));

                var SampleRate = rateValue / (text.data[0].reviews_data.length * 1.0);
                var actualRate = rateGood / (text.data[0].reviews_data.length * 1.0);    
                //console.log(SampleRate + " MM  " + actualRate);
                SampleRate =   + SampleRate.toFixed(1) ;
                actualRate =   actualRate.toFixed(1) ;
                //console.log(SampleRate + " sss " + actualRate);
                document.getElementById("allData").innerHTML =  info + "</b>";
                document.getElementById("fakeData").innerHTML = fake + "</b>";
                document.getElementById("reallyData").innerHTML =  good;
               // document.getElementById("reallyRate").innerHTML = "التقيم للعينة  : " + SampleRate;
                document.getElementById("fakeRate").innerHTML =  "التقيم الموثوق : " +  actualRate;
                document.getElementById("fakereview").innerHTML =  " المراجعات المزيفة  : " +  Fakeno ;
                document.getElementById("reallyreview").innerHTML = "المراجعات الموثوقة : " +  goodno  ;
                document.getElementById("name").innerHTML = " المكان الذي بحثت عنه : " + "<b style='font - size: 120 %; color:#50c878'>اوكتو!!Octo</b> " ;
                //document.getElementById("name").innerHTML = " المكان الذي بحثت عنه : " + "<b style='font - size: 120 %; color:#50c878'>الحذاء الدولي </b> ";

                var fakeReview = Fakeno;


                //-----------------------------------------
            }, error: function (text) { alert(text); }
        });
    }
    catch (e) {
        alert(e);
    }
}


function openTab(TabName) {
    var i, x, tablinks;
    x = document.getElementsByClassName("Review");
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < x.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
    }
    document.getElementById(TabName).style.display = "block";
    var currentTab = document.getElementById("btn"+TabName);
   // currentTab.className += " w3-red";
}

//-----------------------------
function filter(str) {
    try {
        str = str.replaceAll("أ", "ا");
        str = str.replaceAll("إ", "ا");
        str = str.replaceAll("آ", "ا");
        str = str.replaceAll("أ", "ا");
        str = str.replaceAll("اً", "ا");
        str = str.replaceAll("اً", "ا");


        while (str.includes("اا")) { str = str.replaceAll("اا", 'ا'); }
        while (str.includes("مم")) { str = str.replaceAll("مم", 'م'); }
        while (str.includes("رر")) { str = str.replaceAll("رر", 'ر'); }
        while (str.includes("دد")) { str = str.replaceAll("دد", 'د'); }
        while (str.includes("ئئ")) { str = str.replaceAll("ئئ", 'ئ'); }
        return str;
    }
    catch (e) {
        alert(e);
    }
}