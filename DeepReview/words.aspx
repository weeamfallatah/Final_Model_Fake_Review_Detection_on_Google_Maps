<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="words.aspx.cs" Inherits="words" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="JS/word.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<!-- Start CONTENT -->
<!-- <a href="javascript:add()" id="myBtn" class="" ><i class="fa fa-pencil w3-button w3-red w3-center w3-round w3-xxlarge"></i></a>
-->
  <div class=" w3-right-align  w3-text-theme w3-container w3-round-large "  style=' '>
  <p class=" w3-large w3-center " id='pheader'><b>بيانات الكلمات</b>   </p>
    <a class="w3-button  w3-theme w3-round-large" href="javascript:add()"><i class="fa fa-pencil w3-large " ></i></a>
    <a class="w3-button  w3-theme w3-round-large" href="javascript:showinfo('')"><i class="fa fa-refresh w3-large " ></i></a>
<!--<button class="w3-button  w3-theme w3-round-large" onclick="getchk('')"><i class="fa fa-refresh w3-large " ></i></button>-->
 </div>
   <div class=" w3-right-align  w3-container"  style=' margin-bottom:65px; margin-left:0px; margin-left:0px; '>
     <ul id="sdata" class=' w3-ul w3-border w3-margin-top  w3-round-large w3-hoverable ' style="" > </ul> 
  </div>     

  
    <!-- Main Data -->
    <div id="data" class="w3-modal">
    <div class="w3-modal-content w3-animate-opacity w3-card-4 w3-text-theme w3-light-gray w3-round-xlarge" style='z-index:15;' >
    <header class="w3-container w3-theme"> 
        <span onclick="document.getElementById('data').style.display='none'" 
        class="w3-button w3-display-topleft">&times;</span>
        <h4 id="lheader" class=''>بيانات الكلمات </h4>
      </header>
          <div class="w3-border-blue-grey w3-round-xlarge w3-large" style="padding:10px;" >
            
              <div class="w3-group w3-right-align" >      
                   <label id="lename" class=" w3-left-align w3-right "> الكلمة  </label>
                   <input class="   w3-right-align w3-input w3-border w3-round-xlarge w3-white" id="name" type="text"/>
               </div>
                <div class="w3-group w3-right-align" >      
                   <label id="Label7" class=" w3-left-align w3-right "> القيمة  </label>
                   <input class="   w3-right-align w3-input w3-border w3-round-xlarge w3-white" id="value" type="number"/>
               </div>
               
             <div class="w3-center" style="" >      
                    <div id="btnsave" onclick="testinput()" class=" w3-btn w3-large w3-section w3-round-xlarge w3-center w3-card-4 w3-theme  animated fadeIn" >حفظ</div>     
                    <div id="btndelete" onclick="del()" class=" w3-btn w3-large w3-section w3-round-xlarge w3-center w3-card-4 w3-red  animated fadeIn" >حذف</div>           
                    <div id="btnclose" onclick="document.getElementById('data').style.display='none'" class=" w3-btn w3-large w3-section w3-round-xlarge w3-center w3-card-4 w3-theme  animated fadeIn" >إغلاق</div>          
               </div>
             
       </div>     
    </div>
  </div>


<input id="id" type="hidden" />
<input id="mode" type="hidden" />
</asp:Content>

