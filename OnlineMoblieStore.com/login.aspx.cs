using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void lbtnregister_Click(object sender, EventArgs e)
    {
        Response.Redirect("Registeration.aspx");
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["OMS"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from Customer_Details_Table where Cname=@name and cPassword=@password", con);
        cmd.Parameters.AddWithValue("@name", Txtusername.Text);
        cmd.Parameters.AddWithValue("@password", Txtpassword.Text);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('welcome ')</script>");
            Session["customerlogin"] = Txtusername.Text;
            Session["cid"] = dt.Rows[0]["Cid"].ToString();
            Response.Redirect("Home.aspx");
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('invalid admin name and password')</script>");
        }
    }
}