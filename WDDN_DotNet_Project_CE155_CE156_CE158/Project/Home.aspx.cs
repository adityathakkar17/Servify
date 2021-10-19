using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["newuser"]!=null && !Session["newUser"].Equals(""))
            {
                Response.Write("<script>alert('Sign Up Successful.');</script>");
                Session.Remove("newUser");
            }
        }
    }
}