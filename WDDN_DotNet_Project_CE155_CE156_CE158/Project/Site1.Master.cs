using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if(Session["role"]!=null || Session["UserId"]!=null)
                {
                    if (Session["role"].Equals(""))
                    {
                        Login.Visible = true; // user login link button
                        Signup.Visible = true; // sign up link button
                        Bookings.Visible = false;
                        logout1.Visible = false; // logout link button
                        Label1.Text = "";
                        AdminLogin.Visible = true; // admin login link button

                    }
                    else if (Session["role"].Equals("user"))
                    {
                        Login.Visible = false; // user login link button
                        Signup.Visible = false; // sign up link button
                        Bookings.Visible = true;
                        logout1.Visible = true; // logout link button
                        Label1.Text = "Hello User!";
                        AdminLogin.Visible = false; // admin login link button
                    }
                    else if (Session["role"].Equals("admin"))
                    {
                        Login.Visible = false; // user login link button
                        Signup.Visible = false; // sign up link button
                        Bookings.Visible = false;
                        logout1.Visible = true; // logout link button
                        Label1.Text = "Hello Admin!";
                        AdminHome.Visible = true;
                        ApplyProfessional.Visible = false;
                        AdminLogin.Visible = false; // admin login link button
                    }
                }
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void logout1_Click(object sender, EventArgs e)
        {
            Session["role"] = "";
            Session["UserId"] = "";
            Session["AdminId"] = "";
            Login.Visible = true; // user login link button
            Signup.Visible = true; // sign up link button
            Bookings.Visible = false;
            logout1.Visible = false; // logout link button
            Label1.Text = "";
            ApplyProfessional.Visible = true;
            AdminHome.Visible = false;
            AdminLogin.Visible = true; // admin login link button
            Response.Redirect("~/Home.aspx");
        }
    }
}