using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class AdminLogin : System.Web.UI.Page
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
                string query = "SELECT Id FROM Admin WHERE Username = '" + adminmail.Text.Trim() + "' AND Password ='" + adminpass.Text.Trim() + "' ;";
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(query, con);
                int ?Id  = -1;
                //Id = cmd.ExecuteNonQuery();
                Id = (int)cmd.ExecuteScalar();
                Response.Write(Id);
                if (Id >=1)
                {
                    Session["AdminId"] = Id;
                    Session["role"] = "admin";
                    Response.Redirect("~/AdminHome.aspx");
                }
                
                 Response.Write("<script>alert('Invalid credentials !!');</script>");
                
            }
            catch
            {
                Response.Write("<script>alert('Invalid credentials !!');</script>");
            }
        }
    }
}