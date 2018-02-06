using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Activity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

    }

    public static string cs = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;

    [WebMethod]
    public static Student getStudentByUsername(string name)
    {


        //code to get a student by id from database
        //string data = string.Empty;
        Student std = new Student() {
            Username = "mangal",
            ConfirmPassword = "123",
            Address = "kathmandu",
            ContactNo = "2453245"

       
        };
        //using (SqlConnection con = new SqlConnection(cs))
        //{
        //    con.Open();
        //    SqlCommand com = new SqlCommand("select *from tblStudent  where EmpId=@id", con);
        //    //com.CommandType = CommandType.StoredProcedure;
        //    com.Parameters.AddWithValue("@id", id);
        //    SqlDataReader rdr = com.ExecuteReader();
        //    if (rdr.Read())
        //    {
        //        std.Username = (rdr["Username"].ToString());
        //        std.Address = rdr["Address"].ToString();
        //        std.ContactNo = rdr["ContactNo"].ToString();


        //        std.Designation = (rdr["Designation"].ToString());
        //        std.ConfirmPassword = rdr["ConfirmPassword"].ToString();
        //        std.joiningDate = Convert.ToDateTime(rdr["JoiningDate"]);

        //    }

            return std;
        }


    
    static Random random = new Random();
    static int publicRandomNumber = 0;

    [WebMethod]
    public static int getRandomToken()
    {
        int randomNumber = (random.Next(100, 999));
        Activity act = new Activity();
        act.SaveTokenToSession(randomNumber);
        return randomNumber;
       
    }
    public void SaveTokenToSession(int token)
    {
        Session["oldToken"] = token;
    }
    [WebMethod]
    public static bool matchToken(int newtoken)
    {
        bool isOk = false;
        Activity act = new Activity();
        int oldToken = act.retreiveOldToken();
        if (newtoken == oldToken)
        {
            isOk = true;
        }


       //code to compare previously stored token and this new token coming in paramter
        //and if not equal then isOK becomes false

        return isOk;

    }
    public int retreiveOldToken()
    {
        int oldtoken = int.Parse(Session["oldToken"].ToString());
        return oldtoken;
    }
}