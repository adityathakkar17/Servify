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
    public partial class CustomerBookings : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || Session["role"] == null)
            {
                Response.Redirect("~/Home.aspx");
            }
            else if (Session["role"].ToString() != "user")
            {
                Response.Redirect("~/Home.aspx");
            }
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            //SqlCommand cmd = new SqlCommand("SELECT B.BookingPrice FROM Booking B INNER JOIN [Order] O ON B.OrderId=O.Id WHERE O.CustomerId=@CustomerId GROUP BY O.Id")
            using (con)
            {

                try
                {
                    //SqlCommand cmd = new SqlCommand("SELECT B.BookingPrice FROM Booking B INNER JOIN[Order] O ON B.OrderId = O.Id WHERE O.CustomerId = @CustomerId ");
                    SqlCommand cmd = new SqlCommand("SELECT O.Date , O.TotalAmount AS Amount, O.TotalServices  FROM [Order] O WHERE O.CustomerId=@CustomerId");
                    cmd.Parameters.AddWithValue("@CustomerId", Convert.ToInt32(Session["UserId"]));
                    cmd.Connection = con;
                    SqlDataReader rdr = cmd.ExecuteReader();
                    GridView1.DataSource = rdr;
                    GridView1.DataBind();
                    if (GridView1.Rows.Count == 0)
                    {
                        Label2.Text = "No Bookings have done by you so far";
                    }
                   
                }
                catch(Exception ex)
            {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            con.Close();
   
        }
    }
}