using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class StaffList : System.Web.UI.Page
    {
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
        }
    }
}