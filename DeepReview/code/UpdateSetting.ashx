<%@ WebHandler Language="C#" Class="UpdateSetting" %>

using System;
using System.Web;
using System.Data;
public class UpdateSetting : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        try
        {
            DBCnn db = new DBCnn();
            string sql = "";
           
            
            //--------------------- Data
            string language = (context.Request["language"] != null) ? context.Request["language"] : "";
            string sampleNo = (context.Request["sampleNo"] != null) ? context.Request["sampleNo"] : "";
            string ratio = (context.Request["ratio"] != null) ? context.Request["ratio"] : "";

            sql = "update setting set sampleNo=N'" + sampleNo + "',language=N'" + language + "',ratio=" + ratio;
            bool result = db.Execute(sql);
            db.close();
            if (result)
            {
                context.Response.Write("1");
                context.Session["language"] = language;
                context.Session["sampleNo"] = sampleNo;
                context.Session["ratio"] = ratio;
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