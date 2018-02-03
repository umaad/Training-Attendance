using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BLLemployee
/// </summary>
public class BLLemployee
{
	public BLLemployee()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataTable checkUser(string userName, string password)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",userName),
            new SqlParameter("@b",password)
        };
        return dataobj.GetTable("select * from tblEmployee where name=@a and password=@b", param, CommandType.Text);
    }

    public int addNewEmploye(string name, string Password,  string mobile, string designation, string superVisor, DateTime dateofJoin)
    {
        SqlParameter[] param = new SqlParameter[]
        {
            new SqlParameter("@a",name),
            new SqlParameter("@b",Password),
            
            new SqlParameter("@d",mobile),
            new SqlParameter("@e",designation),
            new SqlParameter("@f",superVisor),
            new SqlParameter("@g",dateofJoin)
        
        };
        return dataobj.IUD("insert into tblEmployee values ('',@a,@b,@d,@e,@f,@g,'','','','')", param, CommandType.Text);
    }
    public DataTable getallemployee()
    {
        return dataobj.GetTable("select *from tblEmployee", null, CommandType.Text);

    }
}