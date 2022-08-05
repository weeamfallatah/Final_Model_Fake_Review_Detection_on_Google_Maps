using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;


/// <summary>
/// Summary description for DBCnn
/// </summary>
public class DBCnn
{
    private SqlConnection Cnn = new SqlConnection();
    public static double[,] graph ;
    public static int graphSize=0;
	public DBCnn()
	{
        try
        {
            //Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Reviews.mdf;Integrated Security=True;User Instance=True
            //
            Cnn.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\DeepReview\App_Data\Reviews.mdf;Integrated Security=True";
            Cnn.Open();
        }
        catch(Exception ex) 
        {
            Console.WriteLine(ex.Message);
        }
	}
    public bool Execute(string SQL)
    {
        try
        {
            SqlCommand command = new SqlCommand(SQL,Cnn);
            command.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex) { return false; }
    }
    public bool Execute(SqlCommand command)
    {
        try
        {
            command.Connection = Cnn;
            command.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex) { return false; }
    }
    public void close()
    {
        try
        {
            Cnn.Close();
        }
        catch (Exception ex) {}
    }
    public  DataTable GetTable(string SQL)
    {
        try
        {
            SqlDataAdapter da = new SqlDataAdapter(SQL, Cnn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds.Tables[0];
        }
        catch(Exception ex) { return null; }
    }
    public DataRow GetRow(string SQL)
    {
        try
        {
            SqlDataAdapter da = new SqlDataAdapter(SQL, Cnn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds.Tables[0].Rows[0];
        }
        catch (Exception ex) { return null; }
    }
    public DataRow GetRow(SqlCommand command)
    {
        try
        {
            command.Connection = Cnn;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = command;
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds.Tables[0].Rows[0];
        }
        catch (Exception ex) { return null; }
    }
    public void AddAction(string EmpID, string pagename, string action, string note)
    {
        try
        {
            string ip = GetIPAddress();
            string sql = "insert into EmpAction(EmpID,pagename,action,note,ip) values ('" + EmpID + "','" + pagename + "','" + action + "','" + note + "','" + ip + "')";
            Execute(sql);
        }
        catch { }
    }
    public string GetIPAddress()
    {
        System.Web.HttpContext context = System.Web.HttpContext.Current;
        string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (!string.IsNullOrEmpty(ipAddress))
        {
            string[] addresses = ipAddress.Split(',');
            if (addresses.Length != 0)
            {
                return addresses[0];
            }
        }

        return context.Request.ServerVariables["REMOTE_ADDR"];
    }
}
