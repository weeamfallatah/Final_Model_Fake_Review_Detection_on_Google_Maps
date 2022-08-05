<%@ WebHandler Language="C#" Class="Search" %>

using System;
using System.Web;
using System.Data;
public class Search : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        try
        {
            DBCnn db = new DBCnn();
            string sql = "";
           
            
            //--------------------- Data
            string Email = context.Session["userCode"].ToString();
            string searchAddress = (context.Request["searchAddress"] != null) ? context.Request["searchAddress"] : "";
            string currentRate = (context.Request["currentRate"] != null) ? context.Request["currentRate"] : "";
            string sampleRate = (context.Request["sampleRate"] != null) ? context.Request["sampleRate"] : "";
            string actualRate = (context.Request["actualRate"] != null) ? context.Request["actualRate"] : "";
            string totalReview = (context.Request["totalReview"] != null) ? context.Request["totalReview"] : "";
            string SampleReview = (context.Request["SampleReview"] != null) ? context.Request["SampleReview"] : "";
            string fakeReview = (context.Request["fakeReview"] != null) ? context.Request["fakeReview"] : "";


            sql = "insert into Search (email,searchAddress,currentRate,sampleRate,actualRate,totalReview,SampleReview,fakeReview) values('" + Email + "',N'" + searchAddress + "','" + currentRate + "','" + sampleRate + "','" + actualRate + "','" + totalReview + "','" + SampleReview + "','" + fakeReview + "') ";
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