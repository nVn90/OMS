using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["adminlogin"]==null)
        {
            Response.Redirect("AdminLogin.aspx");
        }
    }
    
    protected void lbtnhome_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminhome.aspx");
    }
    protected void lbtnaddproducts_Click(object sender, EventArgs e)
    {
        Response.Redirect("Addproduct.aspx");
    }
    protected void lbtnlogout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Session.Clear();
        Response.Redirect("AdminLogin.aspx");
    }
}
