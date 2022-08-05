using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.Script.Serialization;
using System.Collections;

/// <summary>
/// Summary description for Json
/// </summary>
public class Json
{
    public static void redirect()
    {
        string url = "~/default.aspx";
        if (HttpContext.Current != null)
            HttpContext.Current.Response.Redirect("~/default.aspx");

    }

    public Json()
    {

    }
    public static string json(string[,] data,DataTable dt)
    {

        StringBuilder JsonString = new StringBuilder();
        JsonString.Append("{");
        for (int x = 0; x < data.Length/2; x++)
        {
            JsonString.Append("\""+data[x,0]+"\":\"" + data[x,1] + "\"");
            if (x < data.Length / 2 - 1) JsonString.Append(",");
        }
        
        //Exception Handling
        if (dt != null && dt.Rows.Count > 0)
        {
           
            JsonString.Append(",\"data\":[");

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                JsonString.Append("{ ");
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    if (j < dt.Columns.Count - 1)
                    {
                        JsonString.Append("\"" + dt.Columns[j].ColumnName.ToString() +
                              "\":" + "\"" +
                              dt.Rows[i][j].ToString() + "\",");
                    }
                    else if (j == dt.Columns.Count - 1)
                    {
                        JsonString.Append("\"" +
                           dt.Columns[j].ColumnName.ToString() + "\":" +
                           "\"" + dt.Rows[i][j].ToString() + "\"");
                    }
                }

                /*end Of String*/
                if (i == dt.Rows.Count - 1)
                {
                    JsonString.Append("} ");
                }
                else
                {
                    JsonString.Append("},");
                }
            }

            JsonString.Append("]}");
            return JsonString.ToString();
        }
        else
        {
            JsonString.Append("}");
            return JsonString.ToString();
        }
    }
    
    public static string json(DataTable dt, string total)
    {

        StringBuilder JsonString = new StringBuilder();

        //Exception Handling
        if (dt != null && dt.Rows.Count > 0)
        {
            JsonString.Append("{\"Result\":\"" + total + "\",");
            JsonString.Append("\"Records\":[");

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                JsonString.Append("{ ");
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    if (j < dt.Columns.Count - 1)
                    {
                        JsonString.Append("\"" + dt.Columns[j].ColumnName.ToString() +
                              "\":" + "\"" +
                              dt.Rows[i][j].ToString() + "\",");
                    }
                    else if (j == dt.Columns.Count - 1)
                    {
                        JsonString.Append("\"" +
                           dt.Columns[j].ColumnName.ToString() + "\":" +
                           "\"" + dt.Rows[i][j].ToString() + "\"");
                    }
                }

                /*end Of String*/
                if (i == dt.Rows.Count - 1)
                {
                    JsonString.Append("} ");
                }
                else
                {
                    JsonString.Append("},");
                }
            }

            JsonString.Append("]}");
            return JsonString.ToString();
        }
        else
        {
            return null;
        }
    }
    public static string json(string sql)
    {
        DBCnn db = new DBCnn();
        DataTable dt = db.GetTable(sql);
        StringBuilder JsonString = new StringBuilder();

        //Exception Handling
        if (dt != null && dt.Rows.Count > 0)
        {
           
            JsonString.Append("{\"rows\":[");

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                JsonString.Append("{ ");
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    if (j < dt.Columns.Count - 1)
                    {
                        JsonString.Append("\"" + dt.Columns[j].ColumnName.ToString() +
                              "\":" + "\"" +
                              dt.Rows[i][j].ToString() + "\",");
                    }
                    else if (j == dt.Columns.Count - 1)
                    {
                        JsonString.Append("\"" +
                           dt.Columns[j].ColumnName.ToString() + "\":" +
                           "\"" + dt.Rows[i][j].ToString() + "\"");
                    }
                }

                /*end Of String*/
                if (i == dt.Rows.Count - 1)
                {
                    JsonString.Append("} ");
                }
                else
                {
                    JsonString.Append("},");
                }
            }

            JsonString.Append("]}");
            return JsonString.ToString();
        }
        else
        {
            return null;
        }
    }
    public static string json(DataTable dt)
    {
        StringBuilder JsonString = new StringBuilder();
        //Exception Handling
        if (dt != null && dt.Rows.Count > 0)
        {

            JsonString.Append("[");

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                JsonString.Append("{ ");
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    if (j < dt.Columns.Count - 1)
                    {
                        JsonString.Append("\"" + dt.Columns[j].ColumnName.ToString() +
                              "\":" + "\"" +
                              dt.Rows[i][j].ToString() + "\",");
                    }
                    else if (j == dt.Columns.Count - 1)
                    {
                        JsonString.Append("\"" +
                           dt.Columns[j].ColumnName.ToString() + "\":" +
                           "\"" + dt.Rows[i][j].ToString() + "\"");
                    }
                }

                /*end Of String*/
                if (i == dt.Rows.Count - 1)
                {
                    JsonString.Append("} ");
                }
                else
                {
                    JsonString.Append("},");
                }
            }

            JsonString.Append("]");
            return JsonString.ToString();
        }
        else
        {
            return null;
        }
    }
    public static void goback()
    { 
        
    }
  //=====================================

    public static string GetJson(DataTable dt)
    {

        System.Web.Script.Serialization.JavaScriptSerializer serializer = new

        System.Web.Script.Serialization.JavaScriptSerializer();
        List<Dictionary<string, object>> rows =
          new List<Dictionary<string, object>>();
        Dictionary<string, object> row = null;
        if (dt != null)
        {
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName.Trim(), dr[col]);
                }
                rows.Add(row);
            }
        }
      
        return serializer.Serialize(rows);
    }

    //--------------------------------
    public static string json(string pageno,string total_Records, string pq_curPage, DataTable dt, string msg="")
    {
        StringBuilder sb = new StringBuilder(@"{""total"":" + pageno + @",""records"":" + total_Records + @",""page"":" + pq_curPage + @",""msg"":""" + msg  + @""",""rows"":");

        JavaScriptSerializer js = new JavaScriptSerializer();
        String json = js.Serialize(GetJson(dt));
        sb.Append(GetJson(dt));
        sb.Append("}");

        return (sb.ToString());
    }
 
 
}