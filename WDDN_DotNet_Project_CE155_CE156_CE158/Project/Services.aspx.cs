using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class Services : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["con"].ConnectionString);
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
            if (!IsPostBack)
            {
                Bind();
            }

        }

        protected void BtnInsert_Click(object sender, EventArgs e)
        {
            if (!checkServiceExist(e))
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string link = "";
                    
                    if (!string.IsNullOrEmpty(fuISImage.FileName))
                    {
                        link = "ServiceImages/" + Path.GetFileName(fuISImage.FileName);

                        fuISImage.SaveAs(Server.MapPath("~/" + link));
                    }

                    SqlCommand cmd = new SqlCommand("INSERT INTO Service(ServiceName,Image) values(@ServiceName,@Image)", con);
                    cmd.Parameters.AddWithValue("@ServiceName", txtISname.Text.Trim());
                    cmd.Parameters.AddWithValue("@Image", link);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Service Added successfully');</script>");
                    Bind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Service already exist! Please try with different Service Name');</script>");
                Bind();
            }
        }

        bool checkServiceExist(EventArgs e)
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
                while (rdr.Read())
                {
                    if (txtISname.Text.Trim().ToUpper() == rdr["ServiceName"].ToString().ToUpper())
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


        public void Bind()
        {
            SqlCommand cmd = new SqlCommand("select * from Service", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            da.Fill(ds, "Service");
            //if(ds.Tables["Service"].Rows.Count>0)
            //{
                gv1.DataSource = ds;
                gv1.DataBind();
            //}
        }

        public DataTable Get_EmptyDataTable()
        {
            DataTable dtEmpty = new DataTable();
            //Here ensure that you have added all the column available in your gridview
            dtEmpty.Columns.Add("Id", typeof(string));
            dtEmpty.Columns.Add("Name", typeof(string));
            dtEmpty.Columns.Add("Image", typeof(string));
            DataRow datatRow = dtEmpty.NewRow();

            //Inserting a new row,datatable .newrow creates a blank row
            dtEmpty.Rows.Add(datatRow);//adding row to the datatable
            return dtEmpty;
        }
        protected void gv1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv1.EditIndex = e.NewEditIndex;
            //Response.Write("<script>alert('editing!')</script>");
            Bind();
        }
        protected void gv1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = e.RowIndex;
            GridViewRow row = (GridViewRow)gv1.Rows[index];
            Label eid = (Label)row.FindControl("lbleid");
            TextBox ename = (TextBox)row.FindControl("txtename");           
            FileUpload fu = (FileUpload)row.FindControl("fu1");
            if (fu.HasFile)
            {
                string link = "";
                if (!string.IsNullOrEmpty(fu.FileName))
                {
                    link = "ServiceImages/" + Path.GetFileName(fu.FileName);

                    fu.SaveAs(Server.MapPath("~/" + link));
                }
                SqlCommand cmd = new SqlCommand("update Service set Image = @Image WHERE Id = @Id", con);
                cmd.Parameters.AddWithValue("@Image", link);
                cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(eid.Text));
                con.Open();
                int res = cmd.ExecuteNonQuery();
                con.Close();
            }
            SqlCommand cmd1 = new SqlCommand("update Service set ServiceName = @ServiceName WHERE Id = @Id", con);
            cmd1.Parameters.AddWithValue("@ServiceName", ename.Text);
            cmd1.Parameters.AddWithValue("@Id", Convert.ToInt32(eid.Text));
            con.Open();
            int res1 = cmd1.ExecuteNonQuery();
            con.Close();
            if (res1 == 1)
            {
                Response.Write("<script>alert('Updation done!')</script>");
            }
            gv1.EditIndex = -1;
            Bind();
        }
        protected void gv1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv1.EditIndex = -1;
            Response.Write("<script>alert('Updation cancel!')</script>");
            Bind();
        }
        protected void gv1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Response.Write("<script>alert('All subservices of this service will be deleted')</script>");
            int index = e.RowIndex;

            GridViewRow row = (GridViewRow)gv1.Rows[index];

            Label eid = (Label)row.FindControl("lbleid");

            SqlCommand cmd = new SqlCommand("delete from Service where Id=" + Convert.ToInt32(eid.Text) + "", con);
            con.Open();
            int res = cmd.ExecuteNonQuery();
            con.Close();

            if (res == 1)
            {
                Response.Write("<script>alert('Deletion done!')</script>");
            }
            Bind();
        }
        protected void gv1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv1.PageIndex = e.NewPageIndex;
            Bind();
        }

        protected void gv1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="Select")
            {
                int Id = Convert.ToInt32(e.CommandArgument);

                Response.Redirect("SubServices.aspx?Id="+Id.ToString());              
            }
        }
    }
}