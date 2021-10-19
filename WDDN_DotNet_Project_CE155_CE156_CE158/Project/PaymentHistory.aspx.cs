using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class PaymentHistory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminId"] == null)
            {
                Response.Redirect("~/AdminLogin.aspx");
            }
            else if (Session["role"].ToString() != "admin")
            {
                Response.Redirect("~/AdminLogin.aspx");
            }
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            using (con)
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SELECT O.Date , O.TotalAmount AS Amount, O.TotalServices,O.CustomerId,C.Username FROM [Order] O INNER JOIN  Customer C ON O.CustomerId=C.Id ");
                    cmd.Connection = con;
                    SqlDataReader rdr = cmd.ExecuteReader();
                    GridView1.DataSource = rdr;
                    GridView1.DataBind();
                    if (GridView1.Rows.Count == 0)
                    {
                        Label2.Text = "No Payment History of Customers found!";
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            con.Close();
        }
    }
}