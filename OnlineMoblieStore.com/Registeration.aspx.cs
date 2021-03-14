using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Registeration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["OMS"].ConnectionString);
        con.Open();
        string query = "insert into customer_details_table values(@name,@password,@age,@gender,@contact,@address,@dob)";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@name", Txtname.Text);
        cmd.Parameters.AddWithValue("@password", TxtPassword.Text);
        cmd.Parameters.AddWithValue("@age", TxtAge.Text);
        cmd.Parameters.AddWithValue("@gender", TxtGender.Text);
        cmd.Parameters.AddWithValue("@address", TxtAddress.Text);
        cmd.Parameters.AddWithValue("@contact", TxtContact_No.Text);
        cmd.Parameters.AddWithValue("@dob", TxtDob.Text);
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<Script language='javascript'> alert('Inserted Successful')</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<Script language='javascript'> alert('Inserted Failed')</script>");
        }
    }
}