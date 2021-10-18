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
    public partial class WebForm2 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind();
            }
        }
        public void Bind()
        {
            
        }

        protected void BtnAddService_Click(object sender, EventArgs e)
        {
            if(!checkServiceExist())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string link = "";
                    if (!string.IsNullOrEmpty(ServiceImage.FileName))
                    {
                        link = "ServiceImages/" + Path.GetFileName(ServiceImage.FileName);

                        ServiceImage.SaveAs(Server.MapPath("~/" + link));
                    }

                    SqlCommand cmd = new SqlCommand("INSERT INTO Service(ServiceName,Image) values(@ServiceName,@Image)", con);
                    cmd.Parameters.AddWithValue("@ServiceName", ServiceName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Image", link);
                    cmd.ExecuteNonQuery();
                    GridView1.DataBind();
                    con.Close();
                    Response.Redirect("Services.aspx");
                    Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Service already exist! Please try with different Service Name');</script>");
            }

        }
        bool checkServiceExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT ServiceName FROM Service", con);
                SqlDataReader rdr = cmd.ExecuteReader();
                while(rdr.Read())
                {
                    if(ServiceName.Text.Trim().ToUpper() == rdr["ServiceName"].ToString().ToUpper())
                    {
                        return true;
                    }
                }
                return false;
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        
    }
}