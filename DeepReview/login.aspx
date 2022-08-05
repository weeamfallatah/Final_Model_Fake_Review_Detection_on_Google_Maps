<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="JS/login.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <div class="w3-row w3-right-align  w3-container w3-margin-top " >
  <div class="w3-quarter w3-container " >
      
    </div>
    <div class="w3-half w3-border w3-round-xlarge w3-card  " >
          <div class="w3-border-blue  w3-card-8 w3-round-xlarge "  >
          <div class="w3-container w3-transparent  "  >
                    <p id='header' class=" w3-large w3-center  ">   <b style="font-family:verdana;font-size:150%; color:#696969" > <label  id='lid'> تسجيل الدخول </label>  </b></p> 
         </div>
              <hr />
          <div class=" w3-padding-16 hfont w3-large " style="padding:10px;">
               <div class="w3-group " style="font-family:Fantasy;" >      
                   <label  id='lid' >  <b style="font-family:courier;font-size:110%;" > البريد الالكتروني </b> </label>
                   <input  class="w3-input w3-border w3-transparent w3-round-xlarge  w3-right-align dir2" id="loginid" type="text" title='User name ' value=""/>
               </div>
                <div class="w3-group " style="font-family:verdana;" >      
                   <label   id='lpass'>  <b style="font-family:courier;font-size:110%" > كلمة المرور </b>  </label>
                   <input class="w3-input w3-border w3-transparent w3-round-xlarge  w3-right-align dir2" id="loginpass" type="password"/>
                  <p   id='lpass'>  <b style="color:#4169E1;font-family:courier;"> <a href="register.aspx">  نسيت كلمة المرور ؟ </a> </b>  </p>
            
                    </div>
               <div class="w3-center" >      
                    <div onclick="testdata()" id='btnlogin' class="w3-btn w3-block w3-large w3-section w3-round-xlarge w3-center w3-hover-white  w3-card-4 w3-theme  animated fadeInleft ">دخــــول</div>    
               </div>
              <hr />
              <span class="w3-center" style="font-family:verdana;"> 
                 <p >   <b style="font-family:verdana;font-size:110%" > ليس لديك حساب ؟ </b>  <a href="register.aspx"> <b style="color:#4169E1;font-family:courier;"> إنشاء حساب جديد  </b>  </a> </p>
              </span>
               
         </div>
       </div>     
    </div>
    <div class="w3-quarter w3-container " >
              
    </div>

    
 
</div>

      
 

</asp:Content>

