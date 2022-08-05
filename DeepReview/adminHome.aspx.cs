using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblname.Text = Session["userName"].ToString();
    }
}