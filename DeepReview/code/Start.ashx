<%@ WebHandler Language="C#" Class="Start" %>

using System;
using System.Web;
using System.Data;
public class Start : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        try
        {
            DBCnn db = new DBCnn();
            string sql = "";
           
           
            sql = "Select * from setting";
            DataRow row = db.GetRow(sql);
            if (row != null)
            {
                context.Session["language"] = row["language"].ToString();
                context.Session["sampleNo"] = row["sampleNo"].ToString();
                context.Session["ratio"] = row["ratio"].ToString();
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