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
    public partial class StaffList : System.Web.UI.Page
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
            if (GridView1.Rows.Count == 0)
            {
                Label2.Text = "No Staff found!";
            }
            else
            {
                Label2.Text = "";
            }
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            using (con)
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("SELECT S.Id,S.Username,S.StaffName,S.MobileNumber,S.ServiceId,SS.ServiceName,S.IsVerified FROM Staff S INNER JOIN Service SS ON S.ServiceId=SS.Id   WHERE S.IsVerified = 1");
                    cmd.Connection = con;
                    SqlDataReader rdr = cmd.ExecuteReader();
                    GridView1.DataSource = rdr;
                    GridView1.DataBind();
                    if (GridView1.Rows.Count == 0)
                    {
                        Label2.Text = "No Staff found!";
                    }
                    else
                    {
                        Label2.Text = "";
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