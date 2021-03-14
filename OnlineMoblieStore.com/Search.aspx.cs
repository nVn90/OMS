using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["OMS"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from Product_Details_Table where Product_Name=@pname", con);
        cmd.Parameters.AddWithValue("@pname", txtsearch.Text);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Response.Redirect("Product_Details.aspx?id=" + dt.Rows[0]["Product_ID"].ToString() + "");
        }
    }
}