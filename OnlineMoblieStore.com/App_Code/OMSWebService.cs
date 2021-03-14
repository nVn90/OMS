using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// Summary description for OMSWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class OMSWebService : System.Web.Services.WebService {

    public OMSWebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public List<string> GetproductsName(string productname)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["OMS"].ConnectionString);
        List<string> productnames = new List<string>();
        SqlCommand cmd = new SqlCommand("getallproductnames", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlParameter parameter = new SqlParameter("@productname", productname);
        cmd.Parameters.Add(parameter);
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        while (rdr.Read())
        {
            productnames.Add(rdr["Product_Name"].ToString());
        }
        return productnames;
    }
    
}
