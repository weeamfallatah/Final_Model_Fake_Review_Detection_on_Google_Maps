<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="JS/home.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div class="w3-container w3-center" style="width:100%">


       <div class="w3-margin-top ">  <p id='header' class=" w3-xlarge w3-center w3-container " style="width:100%"> 
      <div class="w3-margin-top ">

      <img src =" Deselect.png" width =" 600" height=" 260" style="   " />
  
          </p> 

       </div>

        <span class="w3-large" >  <b style="color:#1b1818;font-family:courier;">  
            <p> 
           يحلل مراجعات خرائط Google  
            </p>
               <p> 
 ويصفي المراجعات التي تكتشف خوارزميتنا انها غير طبيعية 
            </p>
             </b> </span>

        <div class=" w3-padding-16 hfont w3-large  " style="  border-radius: 9px;  margin-right: 290px;padding:30px;background-color: #F5F5F5; width:50%">
        <span>
            <input type="text" id="location" name ="location" class="w3-input w3-round-large w3-border" value="" placeholder="مثال : فلامنجو بارك "  />
                   <a class="w3-btn w3-theme w3-large w3-round-large w3-block w3-margin-top" href="javascript:search()"> بحث </a> 
        </span>
        </div>

        <span class="w3-large"  style="color:#1b1818;font-family:courier;"> 
            الصق اي رابط او اسم المكان من خرائط Google  (مطاعم - فنادق - صيدليات - محل..)</span>
     </div>

 
     <div class="w3-large"  style="  position: absolute;  top: 599px; left: 0;  right: 666px;">
         <img src ="arrow-cliparts-30.png"width =" 66" height=" 66" />
            </div>
      <hr  style="      border: 0;  height: 1px; background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0)); "/>
    
     <div class="w3-container w3-transparent  "  >
                    <p id='header' class=" w3-large w3-center  ">   <b style="font-family:verdana;font-size:200%; color:#696969" > <label  id='lid'> التقرير</label>  </b></p> 
         </div>
       <hr  style=" color: #50c878;   	border-top: 3px double #50c878; "/>


            <div class=" w3-border w3-round-xlarge w3-card-8 w3-round-xlarge "  style="padding:10px;  border-radius: 9px; ;background-color: #F5F5F5; " >
          <div class="w3-container w3-transparent  ">
                  
         </div>

          <div class=" w3-padding-16 hfont w3-large  " style="padding:10px;">
             <p style="text-decoration: underline;" class="w3-large"><b style="font-family:courier;font-size:150%; color:#696969">معلومات التقرير</b> </p>
             
         

    <div class=" w3-row w3-padding">
      <span id="name" class="w3-col s4 m4 l4 w3-right"  ></span>
       <span id="allRate"  class="w3-col s4 m4 l4 w3-right"></span> 
      <span id="fakeRate" class="w3-col s4 m4 l4 w3-right"  ></span>
      <span id="allreview" class="w3-col s4 m4 l4 w3-right"  ></span>
      <span id="fakereview" class="w3-col s4 m4 l4 w3-right"  ></span>
      <span id="reallyreview" class="w3-col s4 m4 l4 w3-right"  ></span>
    </div>   
         </div>
       </div>     
 


     <div class="w3-bar w3-row w3-right-align " style="width:100%">
        <a class="w3-bar-item w3-button tablink  w3-col l4 m4 s4 w3-right w3-white" id="btnall" href="javascript:openTab('all')"> <img src =" Google.png"width =" 50" height=" 60" /> <b style="font-family:verdana;font-size:130%; color:#696969" >    جميع المراجعات</b> </a>
        <a class="w3-bar-item w3-button tablink  w3-col l4 m4 s4 w3-right w3-white" id="btnfake" href="javascript:openTab('fake')">  <img src =" Iq3.png" width =" 60" height=" 60" />  <b style="font-family:verdana;font-size:130%; color:#696969" >  المراجعات المزيفة</b></a>
        <a class="w3-bar-item w3-button tablink  w3-col l4 m4 s4 w3-right" id="btnreally" href="javascript:openTab('really')"> <img src =" logo.ico"width =" 60" height=" 60" />  <b style="font-family:verdana;font-size:130%; color:#696969" > المراجعات الموثوقة</b></a>
    </div>
  
      <div id="all" class=" w3-border Review"   >
             <div class="w3-container w3-transparent  " style="  border: solid 10px; color:#fff; " >
                    <p id='header' class=" w3-large w3-center  "> 
                        <h2 style="font-family:courier;font-size:150%; color:#696969" > 
                            <label  id='lid'> جميع المراجعات </label>  </h2></p> 
         </div>
         <span id="allData"  ></span>
      </div>

      <div id="fake" class=" w3-border Review" style="display:none" >
           <h2 style="font-family:courier;font-size:150%; color:#c23d3d" >المراجعات المزيفة </h2>
               <span id="fakeData"></span>
      </div>

      <div id="really" class=" w3-border Review" style="display:none">
           <h2 style="font-family:courier;font-size:150%; color:#50c878">المراجعات الموثوقة</h2>
         <span id="reallyData"></span>
      </div>
 

          <hr  style=" color: #50c878;   	border-top: 3px double #50c878; "/>
        </div>

<input runat="server" id="sampleNo" type="hidden" />
<input runat="server" id="language" type="hidden" />
<input runat="server" id="ratio" type="hidden" />
</asp:Content>

