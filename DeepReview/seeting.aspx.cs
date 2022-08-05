using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class seeting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            language.Value = Session["language"].ToString();
            sampleNo.Value = Session["sampleNo"].ToString();
            ratio.Value = Session["ratio"].ToString();
        }
    }
}