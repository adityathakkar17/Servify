using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.Customer
{
    public partial class CustomerLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                string query = "SELECT Id FROM Customer WHERE Username = '" + usermail.Text.Trim() + "' AND Password ='" + userpass.Text.Trim() + "' ;";
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(query, con);
                int Id = -1;
                Id = (int)cmd.ExecuteScalar();
                if (Id >= 1)
                {
                    Session["UserId"] = Id;
                    Session["role"] = "user";
                    Response.Redirect("Home.aspx");
                }

                Response.Write("<script>alert('Invalid Credentials !!');</script>");

            }
            catch
            {
                Response.Write("<script>alert('Invalid Credentials !!');</script>");
            }
        }
    }
}