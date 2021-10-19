using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class ApplicationRequest : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["con"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //|| Session["role"] == null
            if (Session["AdminId"] == null )
            {
                Response.Redirect("~/AdminLogin.aspx");
            }
            else if (Session["role"].ToString() != "admin")
            {
                Response.Redirect("~/AdminLogin.aspx");
            }
            if (!IsPostBack)
            {
                Bind();
            }
        }
        public void Bind()
        {
            SqlCommand cmd = new SqlCommand("SELECT S.Id,S.Username,S.StaffName,S.MobileNumber,S.ServiceId,SS.ServiceName,S.IsVerified FROM Staff S INNER JOIN Service SS ON S.ServiceId=SS.Id   WHERE S.IsVerified = 0", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            da.Fill(ds, "Staff");
            GridView1.DataSource = ds;
            GridView1.DataBind();
            if (GridView1.Rows.Count == 0)
                Label1.Text = "No Application Requests!";

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int SSId = Convert.ToInt32(e.CommandArgument);

                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    SqlCommand cmd1 = new SqlCommand("update Staff set IsVerified = @IsVerified WHERE Id = @Id", con);

                    cmd1.Parameters.AddWithValue("@Id", SSId);
                    cmd1.Parameters.AddWithValue("@IsVerified", 1);
                    con.Open();
                    int res1 = cmd1.ExecuteNonQuery();

                    if (res1 == 1)
                    {
                        Response.Write("<script>alert('Updation done!')</script>");
                    }
                    con.Close();
                    Bind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Staff is already Exist With this Email Address '" + ex + "');</script>");
                }
            }

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int index = e.RowIndex;

            GridViewRow row = (GridViewRow)GridView1.Rows[index];

            Label eid = (Label)row.FindControl("lbleid");

            SqlCommand cmd = new SqlCommand("delete from Staff where Id=" + Convert.ToInt32(eid.Text) + "", con);
            con.Open();
            int res = cmd.ExecuteNonQuery();
            con.Close();

            if (res == 1)
            {
                Response.Write("<script>alert('Deletion done!')</script>");
            }
            Bind();
        }
    }
}