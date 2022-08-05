<%@ Page Title="الملف الشخصي" Language="C#" MasterPageFile="~/MasterPageMember.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="JS/profile.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <div class="w3-row w3-right-align  w3-container w3-margin-top " >
  <div class="w3-quarter w3-container " >
      
    </div>
    <div class="w3-half w3-border w3-round-xlarge w3-card   " >
          <div class="w3-border-blue  w3-card-8 w3-round-xlarge "  >
          <div class="w3-container w3-transparent  ">
                  <p id='header' class=" w3-large w3-center read "><b> بياناتي </b></p>
         </div>
          <div class=" w3-padding-16 hfont w3-large " style="padding:10px;">
               <div class="w3-group " >      
                   <label  id='Label1'>البريد الالكتروني</label>
                   <label runat="server"   class="w3-input w3-border w3-transparent w3-round-xlarge  w3-right-align" id="email">  </label>
               </div>
               <div class="w3-group " >      
                   <label  id='lid'>  الاسم </label>
                   <input runat="server" class="w3-input w3-border w3-transparent w3-round-xlarge  w3-right-align" id="name" type="text" title='User name ' value="admin"/>
               </div>
                <div class="w3-group " >      
                   <label   id='lpass'>كلمة المرور </label>
                   <input runat="server" class="w3-input w3-border w3-transparent w3-round-xlarge  w3-right-align" id="password" type="password"/>
               </div>
              
               <div class="w3-center" >      
                    <div onclick="testdata()" id='btnlogin' class="w3-btn w3-block w3-large w3-section w3-round-xlarge w3-center w3-hover-white  w3-card-4 w3-theme  animated fadeInleft read" >تعديل</div>    
               </div>
              
              
         </div>
       </div>     
    </div>
    <div class="w3-quarter w3-container " >
              
    </div>
</div>

</asp:Content>

