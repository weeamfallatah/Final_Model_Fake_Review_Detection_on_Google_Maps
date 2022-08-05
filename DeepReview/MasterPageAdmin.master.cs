using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPageAdmin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userCode"].ToString() == "" ||  Session["userType"] != "1")
        {
            Response.Redirect("~/login.aspx");
        }
    }
}
