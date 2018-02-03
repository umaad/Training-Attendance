using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// Summary description for dataobj
/// </summary>
public static class dataobj
{
	static dataobj()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string connectionStr = WebConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
    public static SqlConnection GetConnection()
    {
        SqlConnection con = new SqlConnection(connectionStr);
        if (con.State != ConnectionState.Open)
        {
            con.Open();
        }
        return con;
    }


    public static int IUD(string sql, SqlParameter[] param, CommandType cmdtype)
    {

        using (SqlConnection con = GetConnection())
        {
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = cmdtype;
            if (param != null)
            {
                cmd.Parameters.AddRange(param);
            }
            return cmd.ExecuteNonQuery();
        }
    }

    public static DataTable GetTable(string sql, SqlParameter[] param, CommandType cmdtype)
    {
        DataTable dt = new DataTable();
        using (SqlConnection con = GetConnection())
        {
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = cmdtype;
            if (param != null)
            {
                cmd.Parameters.AddRange(param);
            }
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            return dt;
        }
    }
   
}