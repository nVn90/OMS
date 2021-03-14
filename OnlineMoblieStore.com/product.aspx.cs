using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
public partial class product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            fillgridview();
        }
    }
    public void fillgridview()
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["OMS"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from Product_Details_Table", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gvproductdetails.DataSource = dt;
        gvproductdetails.DataBind();
    }
    protected void imgbtn_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Product_Details.aspx?id=" + ((ImageButton)sender).AlternateText);
    }
}