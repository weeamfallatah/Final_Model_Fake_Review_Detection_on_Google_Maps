<%@ WebHandler Language="C#" Class="UpdateMember" %>

using System;
using System.Web;
using System.Data;
public class UpdateMember : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        try
        {
            DBCnn db = new DBCnn();
            string sql = "";
           
            
            //--------------------- Data
            string Email = context.Session["userCode"].ToString();
            string password = (context.Request["pass"] != null) ? context.Request["pass"] : "";
            string name = (context.Request["name"] != null) ? context.Request["name"] : "";

            sql = "update Member set fullName=N'" + name + "'";
            if(password!="") sql+=",password=N'" + password + "'";
            sql+= " where  email='"+Email+"'";
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