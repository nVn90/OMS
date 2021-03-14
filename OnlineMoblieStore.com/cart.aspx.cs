using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;


public partial class cart : System.Web.UI.Page
{
    int price = 0;
    int shipingcharges = 100;
    int totalamount = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            fillgridview();
        }
    }

    public void fillgridview()
    {
        if (Session["cid"] != null)
        {
            emptycart.Visible = false;
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["OMS"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("getcartproductdetailsbycid", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@cid", int.Parse(Session["cid"].ToString()));
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    price = price + (Convert.ToInt32(sdr["totalprice"]));

                }
                
                totalamount = shipingcharges + price;

                lblprice.Text = price.ToString();
                lblshipcharges.Text = shipingcharges.ToString();
                lbltotalprice.Text = totalamount.ToString();
                lbltotalcartvalue.Text = dt.Rows.Count.ToString();
                gvcartproduct.DataSource = dt;
                gvcartproduct.DataBind();
                con.Close();
            }
            else
            {
                gvcart.Visible = false;
                emptycart.Visible = true;
            }
        }
        else
        {
            gvcart.Visible = false;
        }
    }

   
    protected void gvcartproduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["OMS"].ConnectionString);
        con.Open();
        HiddenField dfcartid = (HiddenField)gvcartproduct.Rows[e.RowIndex].FindControl("hiddencartid");
        SqlCommand cmd = new SqlCommand("delete cart_details_table where cartid=@cartid");
        cmd.Parameters.AddWithValue("@cartid", dfcartid.Value);
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language= 'javascript'>alert('Successfully Deleted')</script>");
        }
        con.Close();
    }
    protected void gvcartproduct_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvcartproduct.EditIndex = e.NewEditIndex;
        fillgridview();
    }
    protected void gvcartproduct_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvcartproduct.EditIndex = -1;
        fillgridview();
    }
    protected void gvcartproduct_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["OMS"].ConnectionString);
        con.Open();
        HiddenField dfcartid = (HiddenField)gvcartproduct.Rows[e.RowIndex].FindControl("hiddencartid");
        TextBox lblquantity = (TextBox)gvcartproduct.Rows[e.RowIndex].FindControl("txtquantity");
        Label lblprice = (Label)gvcartproduct.Rows[e.RowIndex].FindControl("productprice");
        int totalprice = int.Parse(lblprice.Text) * int.Parse(lblquantity.Text);
        SqlCommand cmd = new SqlCommand("update cart_details_table set quantity=@quantity,totalprice=@totalprice where Cart_Id=@cartid", con);
        cmd.Parameters.AddWithValue("@quantity", lblquantity.Text);
        cmd.Parameters.AddWithValue("@totalprice", totalprice);
        cmd.Parameters.AddWithValue("@cartid", int.Parse(dfcartid.Value));
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language= 'javascript'>alert('Successfully Deleted')</script>");
        }
        con.Close();
        gvcartproduct.EditIndex = -1;
        fillgridview();
    }


    protected void imgbtn_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void btnplaceorder_Click(object sender, EventArgs e)
    {
        Response.Redirect("Paymentconfirmationform1.aspx?id=" + Session["cid"].ToString() + "&payment=cart&price=" + lblprice.Text + "");
    }
}