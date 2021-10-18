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
    public partial class SubServices : System.Web.UI.Page
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
            int? selectedDDLId ;
            //Response.Write("<script>alert('" + Request.QueryString["Id"] + "');</script>");
            if (!IsPostBack)
            {
                BindDDL1();
                
                if (Request.QueryString["Id"] != null)
                {
                    selectedDDLId = Convert.ToInt32(Request.QueryString["Id"]);
                    DropDownList1.ClearSelection();
                    ListItem li = DropDownList1.Items.FindByValue(selectedDDLId.ToString());
                    if (li != null)
                    {
                        DropDownList1.Items.FindByValue(selectedDDLId.ToString()).Selected = true;
                        DropDownList1.SelectedItem.Value = selectedDDLId.ToString();

                    }
                }
                BindGv1();
            }
            
        }

        protected void BtnInsert_Click(object sender, EventArgs e)
        {
            if (!checkSubServiceExist(e))
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
                        link = "SubServiceImages/" + Path.GetFileName(fuISImage.FileName);

                        fuISImage.SaveAs(Server.MapPath("~/" + link));
                    }

                    SqlCommand cmd = new SqlCommand("INSERT INTO SubService(SubServiceName,Image,CurrentPrice,ServiceId) values(@ServiceName,@Image,@Price,@ServiceId)", con);
                    cmd.Parameters.AddWithValue("@ServiceName", txtISname.Text.Trim());
                    cmd.Parameters.AddWithValue("@Price", Convert.ToInt32(txtISprice.Text.Trim()));
                    cmd.Parameters.AddWithValue("@Image", link);
                    cmd.Parameters.AddWithValue("@ServiceId", Convert.ToInt32(DropDownList1.SelectedValue));
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Sub Service Added successfully');</script>");
                    txtISname.Text = "";
                    txtISprice.Text = "";
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Sub Service already exist! Please try with different Sub Service Name');</script>");               
            }
            BindGv1();
        }
        bool checkSubServiceExist(EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT SubServiceName FROM SubService", con);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    if (txtISname.Text.Trim().ToUpper() == rdr["SubServiceName"].ToString().ToUpper())
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
        public void BindDDL1()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd1 = new SqlCommand("select Id,ServiceName from Service", con);
                con.Open();
                SqlDataReader rdr = cmd1.ExecuteReader();
                DropDownList1.Items.Clear();
                while (rdr.Read())
                {
                    ListItem item = new ListItem(rdr["ServiceName"].ToString(), rdr["Id"].ToString());
                    DropDownList1.Items.Add(item);
                }
                rdr.Close();

            }  
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        public void BindGv1()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM SubService where ServiceId=" + Convert.ToInt32(DropDownList1.SelectedValue) +""))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                gv1.DataSource = dt;
                                gv1.DataBind();
                            }
                        }
                    }
                    if (gv1.Rows.Count == 0)
                    {
                        NoSubServices.Text = "No Sub Services of Selected Service Found";
                    }
                    else
                    {
                        NoSubServices.Text = "";
                    }
                }


                con.Close();
                /*
                SqlCommand cmd = new SqlCommand("select * from SubService where ServiceId=" + Convert.ToInt32(DropDownList1.SelectedValue) + "", con);
                rdr = cmd.ExecuteReader();
                gv1.DataSource = rdr;
                gv1.DataBind();*/
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Response.Write("<script>alert('Hello');</script>");
            BindGv1();
            /*if (gv1.Rows.Count == 0)
            {
                NoSubServices.Text = "No Sub Services of Selected Service Found";
            }
            else
            {
                NoSubServices.Text = "";
            }*/
        }
        protected void gv1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv1.EditIndex = e.NewEditIndex;
            Response.Write("<script>alert('editing!')</script>");
            BindGv1();
        }
        protected void gv1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = e.RowIndex;
            GridViewRow row = (GridViewRow)gv1.Rows[index];
            Label subsId = (Label)row.FindControl("lblsubsId");
            TextBox price = (TextBox)row.FindControl("txtprice");
            TextBox subsname = (TextBox)row.FindControl("txtsubsname");
            FileUpload fu = (FileUpload)row.FindControl("fu1");
            if (fu.HasFile)
            {
                string link = "";
                if (!string.IsNullOrEmpty(fu.FileName))
                {
                    link = "SubServiceImages/" + Path.GetFileName(fu.FileName);

                    fu.SaveAs(Server.MapPath("~/" + link));
                }
                SqlCommand cmd = new SqlCommand("update SubService set Image = @Image WHERE Id = @Id", con);
                cmd.Parameters.AddWithValue("@Image", link);
                cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(subsId.Text));
                con.Open();
                int res = cmd.ExecuteNonQuery();
                con.Close();
            }
            SqlCommand cmd1 = new SqlCommand("update SubService set SubServiceName = @SubServiceName,CurrentPrice=@Price WHERE Id = @Id", con);
            cmd1.Parameters.AddWithValue("@SubServiceName", subsname.Text);
            cmd1.Parameters.AddWithValue("@Price", Convert.ToInt32(price.Text));
            cmd1.Parameters.AddWithValue("@Id", Convert.ToInt32(subsId.Text));
            con.Open();
            int res1 = cmd1.ExecuteNonQuery();
            con.Close();
            if (res1 == 1)
            {
                Response.Write("<script>alert('Updation done!')</script>");
            }
            gv1.EditIndex = -1;
            BindGv1();
        }
        protected void gv1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv1.EditIndex = -1;
            Response.Write("<script>alert('Updation cancel!')</script>");
            BindGv1();
        }
        protected void gv1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;

            GridViewRow row = (GridViewRow)gv1.Rows[index];

            Label subsId = (Label)row.FindControl("lblsubsId");

            SqlCommand cmd = new SqlCommand("DELETE FROM SubService where Id=" + Convert.ToInt32(subsId.Text) + "", con);
            con.Open();
            int res = cmd.ExecuteNonQuery();
            con.Close();

            if (res == 1)
            {
                Response.Write("<script>alert('Deletion done!')</script>");
            }
            BindGv1();
        }
        protected void gv1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv1.PageIndex = e.NewPageIndex;
            BindGv1();
        }

    }
}