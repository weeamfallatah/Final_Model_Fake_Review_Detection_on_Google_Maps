<%@ WebHandler Language="C#" Class="register" %>

using System;
using System.Web;
using System.Data;
public class register : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        try
        {
            DBCnn db = new DBCnn();
            string sql = "";
           
            
            //--------------------- Data
            string Email = (context.Request["email"] != null) ? context.Request["email"] : "";
            string password = (context.Request["pass"] != null) ? context.Request["pass"] : "";
            string name = (context.Request["name"] != null) ? context.Request["name"] : "";

            sql = "insert into Member (email,fullName,password) values('" + Email + "',N'" + name + "',N'" + password + "') ";
            bool result = db.Execute(sql);
            db.close();
            if (result)
            {
                context.Response.Write("1");
            }
            else
            {
                context.Response.Write("2");
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