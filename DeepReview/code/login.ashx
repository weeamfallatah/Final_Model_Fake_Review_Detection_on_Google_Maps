<%@ WebHandler Language="C#" Class="login" %>

using System;
using System.Web;
using System.Data;
public class login : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        try
        {
            DBCnn db = new DBCnn();
            string sql = "";
           
            
            //--------------------- Data
            string id = (context.Request["id"] != null) ? context.Request["id"] : "";
            string pass = (context.Request["pass"] != null) ? context.Request["pass"] : "";
            
            
            sql = "Select adminName as name,adminCode as ucode, 'adminhome' as pagename  from admin where adminCode=N'" + id + "' and password ='" + pass + "' ";
            DataTable tb = db.GetTable(sql);
            db.close();
            if (tb != null && tb.Rows.Count > 0)
            {
                context.Session["userCode"] = id;
                context.Session["userName"] = tb.Rows[0]["name"].ToString();
                context.Session["password"] = pass;
                context.Session["userType"] = "1";
                context.Response.Write("adminhome.aspx");
            }
            else
            {
                sql = "Select fullName as name ,email as ucode, 'memberHome' as pagename  from Member where active=1 and  Email='" + id + "' and Password ='" + pass + "' ";
                tb = db.GetTable(sql);
                db.close();
                if (tb != null && tb.Rows.Count > 0)
                {
                    context.Session["userCode"] = id;
                    context.Session["userName"] = tb.Rows[0]["name"].ToString();
                    context.Session["password"] = pass;
                    context.Session["userType"] = "2";
                    context.Response.Write("memberHome.aspx");
                }
                else
                {
                    context.Response.Write("");
                }
            }
           
           
        }
        catch (Exception ex) { context.Response.Write(ex.Message); }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}