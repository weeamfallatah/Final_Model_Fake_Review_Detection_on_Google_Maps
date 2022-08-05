<%@ WebHandler Language="C#" Class="ListSearch" %>

using System;
using System.Web;
using System.Data;
public class ListSearch : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        try
        {
            DBCnn db = new DBCnn();
            string sql = "";
           
            
            //--------------------- Data
            string Email = context.Session["userCode"].ToString();


            sql = "select * from SearchInfo order by searchID desc";
            DataTable tb = db.GetTable(sql);
            db.close();
            context.Response.Write(Json.json(tb));
            
        }
        catch (Exception ex) { context.Response.Write(ex.Message); }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}