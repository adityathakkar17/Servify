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
    public partial class WebForm1 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignUpBtn(object sender, EventArgs e)
        {
            if(!checkMemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("INSERT INTO Customer(CName,Username,Password,MobileNumber,Gender,Address) values(@CName,@Username,@Password,@MobileNumber,@Gender,@Address)", con);
                    cmd.Parameters.AddWithValue("@CName", CName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Username", Username.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", Password.Text.Trim());
                    cmd.Parameters.AddWithValue("@MobileNumber", MobileNumber.Text.Trim());
                    cmd.Parameters.AddWithValue("@Gender", RadioButtonGender.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Address", Address.Text.Trim());
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("");
                    Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Email is already in use! Please try with different Email');</script>");
            }
            
        }
        bool checkMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from Customer where Username='" + Username.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
    }
}