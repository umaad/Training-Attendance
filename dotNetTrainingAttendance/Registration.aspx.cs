using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public static string cs = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
    [WebMethod]
    public static string Add(Student student)
    {

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand com = new SqlCommand("insert into tblStudent  values(@a,@b,@c,@d,@e,@f)", con);

            com.Parameters.AddWithValue("@a", student.Username);
            com.Parameters.AddWithValue("@b", student.Address);
            com.Parameters.AddWithValue("@c", student.ContactNo);
            com.Parameters.AddWithValue("@d", student.Designation);
            com.Parameters.AddWithValue("@e", student.ConfirmPassword);
            com.Parameters.AddWithValue("@f", student.joiningDate);
            con.Open();
            com.ExecuteNonQuery();
            con.Close();
        }
        return "";
    }
    

    

}