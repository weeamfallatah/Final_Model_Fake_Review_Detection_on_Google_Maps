<%@ WebHandler Language="C#" Class="words" %>

using System;
using System.Web;
using System.Data;

public class words : IHttpHandler, System.Web.SessionState.IRequiresSessionState
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
            
            //--------------------- Data
            string id = (context.Request["id"] != null) ? context.Request["id"] : "";
            string name = (context.Request["name"] != null) ? context.Request["name"] : "";
            string value = (context.Request["value"] != null) ? context.Request["value"] : "";
            string mode = (context.Request["mode"] != null) ? context.Request["mode"] : "";
          
            string msg = "";
            //------------ Add data
            if (mode == "add")
            {
                sql = "Insert into searchWord(words,ratio,adminCode) Values(N'" + name + "'," + value + ",'" + context.Session["userCode"].ToString() + "')";
                if (db.Execute(sql))
                {
                    msg = "  تم اضافة السجل بنجاح";
                   
                }
                else
                {
                    msg = " فشلت عملية الاضافة";
                    
                }
            }
            //------------ Edit data
            if (mode == "edit")
            {
                sql = "Update  searchWord set words=N'" + name + "' ,ratio='" + value + "' where wordID='" + id + "'";
                if (db.Execute(sql))
                {
                    msg = " تمت عملية التعديل بنجاح";
                    
                }
                else
                {
                    msg = "فشلت عملية التعديل ";
                  
                }
            }
            //------------ Edit data
            if (mode == "delete")
            {
                sql = "Delete From   searchWord  where wordID='" + id + "'";
                if (db.Execute(sql))
                {
                    msg = " تم حذف السجل بنجاح";
                
                }
                else
                {
                    msg = " فشلت عملية الحذف ";
                    
                }
            }


            sql = " SELECT * FROM  searchWord ";
            DataTable tb = db.GetTable(sql);

            //------------------------------
            db.close();
            context.Response.Write(Json.json(tb, msg));
           
           
        }
        catch (Exception ex) { context.Response.Write(ex.Message); }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}