using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class AdminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["OMS"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from Admin_Login_Table where Admin_name=@name and Admin_password=@password", con);
        cmd.Parameters.AddWithValue("@name", TxtUsername.Text);
        cmd.Parameters.AddWithValue("@password", TxtPassword.Text);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('welcome ')</script>");
            Session["adminlogin"] = TxtUsername.Text;
            Session["aid"] = dt.Rows[0]["Admin_Id"].ToString();
            Response.Redirect("adminhome.aspx");
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('invalid admin name and password')</script>");
        }

    }
}