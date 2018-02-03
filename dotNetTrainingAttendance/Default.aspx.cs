using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    public static string cs = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;

    [WebMethod]
    //public static bool verifyStudent(string userName, string password, string userType)
    //{
       
    //    //int i = 0;
    //    //bool isOK = true;
    //    //using (SqlConnection con = new SqlConnection(cs))
    //    //{
    //    //    SqlCommand cmd = new SqlCommand("select * from tblStudent where userName=@a, password=@b and userType=@c");
    //    //    cmd.Parameters.AddWithValue("@a", userName);
    //    //    cmd.Parameters.AddWithValue("@b", password);
    //    //    cmd.Parameters.AddWithValue("@c", userType);
    //    //    con.Open();
    //    //    i = cmd.ExecuteNonQuery();
    //    //    con.Close();
    //    //    if (i == 0)
    //    //    {
    //    //        isOK = false;
    //    //    }
    //    //}
    //    //return isOK;

    //}
}