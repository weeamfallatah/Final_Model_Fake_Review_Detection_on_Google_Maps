using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPageMember : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userCode"].ToString() == "" || Session["userType"] != "2")
        {
            Response.Redirect("~/login.aspx");
        }
    }
}
