using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["customerlogin"] != null)
            {
                lbtncustomer.Visible = true;
                lbtncustomer.Text = Session["customerlogin"].ToString();
                lbtnlogout.Visible = true;

            }
            else
            {
                lbtncustomer.Visible = false;
                lbtnlogout.Visible = false;
            }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Registeration.aspx");
    } 
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminLoginPage.aspx");
    }
    protected void LinkButton5_Click(object sender, EventArgs e)
    {
        Response.Redirect("product.aspx");
    }
    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Response.Redirect("cart.aspx");
    }
    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        Response.Redirect("contactus.aspx");
        
    }
    protected void lbtnlogout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Session.Clear();
        lbtnlogout.Visible = false;
        Response.Redirect("login.aspx");
    }
    protected void lbtnsearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("Search.aspx");
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Random rm = new Random();
        int i = rm.Next(1,3);
        imgphone.ImageUrl = "~/image/" + i.ToString() + ".jpg";
    }
}
