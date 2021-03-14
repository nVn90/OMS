using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Product_Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblquantity.Text = "1";

            if (Request.QueryString["message"] == "success")
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Successfully Added to cart')</script>");
            }
            string id = Request.QueryString["id"];
            if (id != "" && id != null)
            {
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["OMS"].ConnectionString);
                con.Open();
                if (Session["cid"] != null)
                {
                    SqlCommand cmd1 = new SqlCommand("select * from Cart_Details_Table where Product_Id=@productid and Cid=@customerid", con);
                    cmd1.Parameters.AddWithValue("@productid", int.Parse(id));
                    cmd1.Parameters.AddWithValue("@customerid", int.Parse(Session["cid"].ToString()));
                    SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
                    DataTable dt1 = new DataTable();
                    sda1.Fill(dt1);
                    if (dt1.Rows.Count > 0)
                    {
                        lbtnaddtocart.Visible = false;
                        lbtngotocart.Visible = true;
                    }
                    else
                    {
                        lbtngotocart.Visible = false;
                    }
                    SqlCommand cmd = new SqlCommand("select * from Product_Details_Table where Product_Id='" + int.Parse(id) + "'", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    con.Close();
                    if (dt.Rows.Count > 0)
                    {
                        lblproductname.Text = dt.Rows[0]["Product_Name"].ToString();
                        lblproductmodel.Text = dt.Rows[0]["Product_Model_No"].ToString();
                        lblcompany.Text = dt.Rows[0]["Product_Company"].ToString();
                        lblprice.Text = dt.Rows[0]["product_price"].ToString();
                        lbltotalprice.Text = lblprice.Text;
                        imgproduct.ImageUrl = dt.Rows[0]["Product_Image_URL"].ToString();
                    }

                    else
                    {
                        Response.Redirect("product.aspx");
                    }
                }
                else
                {
                    lbtngotocart.Visible = false;
                    SqlCommand cmd = new SqlCommand("select * from Product_Details_Table where Product_Id='" + int.Parse(id) + "'", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    con.Close();
                    if (dt.Rows.Count > 0)
                    {
                        lblproductname.Text = dt.Rows[0]["Product_Name"].ToString();
                        lblproductmodel.Text = dt.Rows[0]["Product_Model_No"].ToString();
                        lblcompany.Text = dt.Rows[0]["Product_Company"].ToString();
                        lblprice.Text = dt.Rows[0]["product_price"].ToString();
                        lbltotalprice.Text = lblprice.Text;
                        imgproduct.ImageUrl = dt.Rows[0]["Product_Image_URL"].ToString();
                    }

                    else
                    {
                        Response.Redirect("product.aspx");
                    }
                }
            }
            else
            {
                Response.Redirect("product.aspx");
            }
        }
    }
    protected void btnminus_Click(object sender, EventArgs e)
    {
        if (int.Parse(lblquantity.Text) > 1)
        {
            int quantity = int.Parse(lblquantity.Text) - 1;
            lbltotalprice.Text = (quantity * int.Parse(lblprice.Text)).ToString();
            lblquantity.Text = quantity.ToString();
        }
    }
    protected void btnplus_Click(object sender, EventArgs e)
    {
        int quantity = 1 + int.Parse(lblquantity.Text);
        lbltotalprice.Text = (quantity * int.Parse(lblprice.Text)).ToString();
        lblquantity.Text = quantity.ToString();
    }
    protected void lbtnaddtocart_Click(object sender, EventArgs e)
    {
        if (Session["cid"] != null)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["OMS"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Cart_Details_Table values(@pid,@quantity,@totalprice,@cid)", con);
            cmd.Parameters.AddWithValue("@pid", int.Parse(Request.QueryString["id"]));
            cmd.Parameters.AddWithValue("@cid", int.Parse(Session["cid"].ToString()));
            cmd.Parameters.AddWithValue("@quantity", int.Parse(lblquantity.Text));
            cmd.Parameters.AddWithValue("@totalprice", int.Parse(lbltotalprice.Text));
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Redirect("Product_Details.aspx?id=" + Request.QueryString["id"] + "&message=success");

            }
            con.Close();
        }
        else
        {
            Response.Redirect("cart.aspx");
        }
    }
    protected void lbtgotocart_Click(object sender, EventArgs e)
    {
        Response.Redirect("cart.aspx");
    }
    protected void lbtnbuy_Click(object sender, EventArgs e)
    {
        if (Session["customerlogin"] != null)
        {
            Session["productid"] = Request.QueryString["id"];
            Session["productname"] = lblproductname.Text;
            Session["price"] = lblprice.Text;
            Session["quantity"] = lblquantity.Text;
            Session["totalamount"] = lbltotalprice.Text;
            Response.Redirect("Paymentconfirmationform1.aspx?payment=product");
        }
    }
}