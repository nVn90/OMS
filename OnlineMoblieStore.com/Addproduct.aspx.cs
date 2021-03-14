using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class Addproduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillgridview();
        }
    }

    protected void btnupload_Click(object sender, EventArgs e)
    {
        if (ImageUpload.HasFile)
        {
            string filename = ImageUpload.FileName;
            ImageUpload.PostedFile.SaveAs(Server.MapPath(".") + "//uploads//" + filename);
            Session["path"] = "~/uploads/" + filename;
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert(Image Uploaded Successfully)</script>");
            ProductImage.ImageUrl = Session["path"].ToString();
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert(Please Upload Image'</script>");
        }
    }


    protected void fillgridview()
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["OMS"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from Product_Details_Table", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gdvAddProduct.DataSource = dt;
        gdvAddProduct.DataBind();
    }

    protected void BtnAddProduct_Click(object sender, EventArgs e)
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["OMS"].ConnectionString);
    con.Open();
    string query = "insert into product_details_table values(@pname,@pmodelno,@pcompany,@pimageurl,@pprice)";
    SqlCommand cmd = new SqlCommand(query, con);
    cmd.Parameters.AddWithValue("@pname", TxtProductName.Text);
    cmd.Parameters.AddWithValue("@pmodelno", TxtModelNo.Text);
    cmd.Parameters.AddWithValue("@pcompany", TxtProductCompany.Text);
    cmd.Parameters.AddWithValue("@pimageurl", Session["path"].ToString());
    cmd.Parameters.AddWithValue("@pprice", TxtProductPrice.Text);
    int i=cmd.ExecuteNonQuery();
    if(i>0)
    {
        ClientScript.RegisterStartupScript(Page.GetType(), "validation","<script language='javascript'>alert('Date Inserted Successfully')</script>");
    }
    else
    {
        ClientScript.RegisterStartupScript(Page.GetType(), "validation","<script language='javascript'>alert('Pleaser Insert Data')</script>");
    }
    fillgridview();
}
    protected void gdvAddProduct_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gdvAddProduct.EditIndex = -1;
        fillgridview();
    }
       
    protected void gdvAddProduct_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void gdvAddProduct_RowEditing1(object sender, GridViewEditEventArgs e)
    {

        gdvAddProduct.EditIndex = e.NewEditIndex;
        fillgridview();
    }
    protected void gdvAddProduct_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
         SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["OMS"].ConnectionString);
        con.Open();
        Label id = (Label)gdvAddProduct.Rows[e.RowIndex].FindControl("lblproductid");
        
        SqlCommand cmd = new SqlCommand("Delete product_details_table where product_id=@id", con);
        cmd.Parameters.AddWithValue("@id", int.Parse(id.Text));
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Data Deleted Successfully')</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Error')</script>");
        }
        fillgridview();


    }
    protected void gdvAddProduct_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["OMS"].ConnectionString);
        con.Open();
        Label ldlid = (Label)gdvAddProduct.Rows[e.RowIndex].FindControl("lblproductid");
        FileUpload productimage = (FileUpload)gdvAddProduct.Rows[e.RowIndex].FindControl("productimageuploadergridview");
        TextBox TxtProductName = (TextBox)gdvAddProduct.Rows[e.RowIndex].FindControl("TxtProductName");
        TextBox TxtProductModelNo = (TextBox)gdvAddProduct.Rows[e.RowIndex].FindControl("TxtProductModelNo");
        TextBox TxtProductCompany = (TextBox)gdvAddProduct.Rows[e.RowIndex].FindControl("TxtProductCompany");
        TextBox TxtProductPrice = (TextBox)gdvAddProduct.Rows[e.RowIndex].FindControl("TxtProductPrice");
        if (productimage.HasFile)
        {
            string filename = productimage.FileName;
            productimage.PostedFile.SaveAs(Server.MapPath("~\\uploads\\") + filename);
            Session["path"] = "~\\uploads\\" + filename;
            SqlCommand cmd = new SqlCommand("Update Product_Details_Table set Product_Name=@pname, Product_Model_No=@pmodelno, Product_Company=@pcompany, Product_Image_URL=@pimageURL, Product_Price=@pprice where Product_ID=@id", con);
            cmd.Parameters.AddWithValue("@pname", TxtProductName.Text);
            cmd.Parameters.AddWithValue("@pmodelno", TxtModelNo.Text);
            cmd.Parameters.AddWithValue("@pcompany", TxtProductCompany.Text);
            cmd.Parameters.AddWithValue("@pimageURL", Session["path"].ToString());
            cmd.Parameters.AddWithValue("@id", int.Parse(ldlid.Text));
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Data Upadated Successfully')</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Error')</script>");
            }
        }
        else
        {
            SqlCommand cmd = new SqlCommand("Update Product_Details_Table set Product_Name=@pname, Product_Model_No=@pmodelno, Product_Company=@pcompany, Product_Price=@pprice where Product_ID=@id", con);
            cmd.Parameters.AddWithValue("@pname", TxtProductName.Text);
            cmd.Parameters.AddWithValue("@pmodelno", TxtModelNo.Text);
            cmd.Parameters.AddWithValue("@pcompany", TxtProductCompany.Text);
            cmd.Parameters.AddWithValue("@id", int.Parse(ldlid.Text));
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Data Upadated Successfully')</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Error')</script>");
            }
        }
        gdvAddProduct.EditIndex = -1;
        fillgridview();
    }
}