using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminId"] == null || Session["role"] == null)
            {
                Response.Redirect("~/AdminLogin.aspx");
            }
            else if (Session["role"].ToString() != "admin")
            {
                Response.Redirect("~/AdminLogin.aspx");
            }
        }
    }
}