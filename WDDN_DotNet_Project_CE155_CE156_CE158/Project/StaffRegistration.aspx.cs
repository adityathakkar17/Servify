using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class StaffRegistration : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckStaffExists())
            {
                Response.Write("<script>alert('Staff already Exists With this Email Address');</script>");
            }
            else
            {
                signUpNewStaff();
                clearForm();
            }
        }

        bool CheckStaffExists()
        {

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                string query = "SELECT * FROM Staff WHERE Username='" + Username.Text.Trim() + "';";
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    con.Close();
                    return true;
                }
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Staff is already Exist With this Email Address '" + ex + "');</script>");
            }
            return false;

        }
        void signUpNewStaff()
        {
            SqlConnection con = new SqlConnection(strcon);
            //con.ConnectionString = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
            try
            {
                using (con)
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string query = "INSERT INTO Staff (StaffName,Username,MobileNumber,ServiceId) values(@StaffName,@Username,@MobileNumber,@ServiceId)";
                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@ServiceId", ServicesList.SelectedValue);
                    cmd.Parameters.AddWithValue("@StaffName", Name.Text.Trim());
                    cmd.Parameters.AddWithValue("@Username", Username.Text.Trim());
                    cmd.Parameters.AddWithValue("@MobileNumber", Mnumber.Text.Trim());
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('We will get back to you :) ');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void clearForm()
        {
            Name.Text = "";
            Username.Text = "";
            Mnumber.Text = "";
        }
    
    }
}