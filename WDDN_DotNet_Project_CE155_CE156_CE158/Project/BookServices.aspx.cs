using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class BookServices : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if(Session["UserId"]==null || Session["role"]==null)
            //{
            //    Response.Redirect("~/Home.aspx");
            //}
            //else if (Session["role"].ToString()!="user" )
            //{
            //    Response.Redirect("~/Home.aspx");
            //}
            if (!IsPostBack)
            {
                ViewState.Remove("SubServiceIdCart");
            }
            if(DataList1.Items.Count==0)
            {
                Label2.Text = "No SubServices for this Service";
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            /* select an row index where you selected Id */
            int index = Convert.ToInt32(e.Item.ItemIndex);
            Button btn = (Button)e.Item.FindControl("Button1");
            Label Id = (Label)e.Item.FindControl("IdLabel");
            Label Price = (Label)e.Item.FindControl("CurrentPriceLabel");
            Label SName = (Label)e.Item.FindControl("SubServiceNameLabel");
            int total_Price = 0;
            Dictionary<int, List<string>> CartItems;
            if (btn.Text == "Add to Cart")
            {
                btn.Text = "Added";
                btn.CssClass = "btn btn-success btn-block btn-md";
                if (ViewState["SubServiceIdCart"] == null)
                {
                    CartItems = new Dictionary<int, List<string>>();
                }
                else
                {
                    CartItems = (Dictionary<int, List<string>>)ViewState["SubServiceIdCart"];
                }
                if (!CartItems.ContainsKey(Convert.ToInt32(Id.Text)))
                {
                    CartItems.Add(Convert.ToInt32(Id.Text), new List<string> { SName.Text, Price.Text });
                }

                ViewState["SubServiceIdCart"] = CartItems;               
                SS.InnerHtml = "";
                foreach (var item in CartItems)
                {
                    //Response.Write(item.ToString()+item.Key.ToString()+" "+item.Value.ToString()+"\n");
                    SS.InnerHtml += item.Value[0].ToString() + " - " + item.Value[1].ToString()+ "\n";
                    total_Price += Convert.ToInt32(item.Value[1]);
                }

                Cart.Text = "";
                Cart.Text += "View Cart  Total Price: " + total_Price;
                if (CartItems.Count() >= 1)
                {
                    Response.Write("hereee");
                    Cart.Visible = true;
                }


                //ListView1.DataSource = dict;
                //ListView1.DataBind();

            }
            else
            {
                if(ViewState["SubServiceIdCart"]!=null)
                {
                    CartItems = (Dictionary<int, List<string>>)ViewState["SubServiceIdCart"];
                    if (CartItems.ContainsKey(Convert.ToInt32(Id.Text)))
                    {
                        CartItems.Remove(Convert.ToInt32(Id.Text));
                    }

                    SS.InnerHtml = "";
                    foreach (var item in CartItems)
                    {
                        total_Price += Convert.ToInt32(item.Value[1]);
                        SS.InnerHtml += item.Value[0].ToString() + " - " + item.Value[1].ToString() + "\n";
                    }
                    Cart.Text = "";
                    Cart.Text += "View Cart  Total Price: " + total_Price;

                    btn.Text = "Add to Cart";
                    btn.CssClass = "btn btn-primary btn-block btn-md";
                    if (CartItems.Count == 0)
                    {
                        MyCartList.Visible = false;
                        Cart.Visible = false;
                        ViewState.Remove("SubSeviceIdCart");
                        ViewState.Remove("totalPrice");
                    }
                }
                
            }
        }

        protected void Cart_Click(object sender, EventArgs e)
        {
           MyCartList.Visible = true;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            MyCartList.Visible = false;
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || Session["role"] == null)
            {
                Response.Redirect("~/CustomerLogin.aspx");
            }
            else if (Session["role"].ToString() != "user")
            {
                Response.Redirect("~/CustomerLogin.aspx");
            }
            Dictionary<int, List<string>> CartItems;
            int total_Price = 0;
            int OrderId;
            CartItems = (Dictionary<int, List<string>>)ViewState["SubServiceIdCart"];
            foreach (var item in CartItems)
            {              
                total_Price += Convert.ToInt32(item.Value[1]);
            }
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            using(con)
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO [Order](Date,TotalAmount,TotalServices,CustomerId) OUTPUT INSERTED.ID values(@Date,@TotalAmount,@TotalServices,@CustomerId)", con);
                cmd.Parameters.AddWithValue("@Date", DateTime.Now);
                cmd.Parameters.AddWithValue("@TotalAmount", total_Price);
                cmd.Parameters.AddWithValue("@TotalServices", CartItems.Count);
                cmd.Parameters.AddWithValue("@CustomerId", Convert.ToInt32(Session["UserId"]));
                OrderId = (int)cmd.ExecuteScalar();
                foreach (var item in CartItems)
                {
                    SqlCommand cmd1 = new SqlCommand("INSERT INTO Booking(SubServiceId,OrderId,BookingPrice) values(@SubServiceId,@OrderId,@BookingPrice)", con);
                    cmd1.Parameters.AddWithValue("@SubServiceId", Convert.ToInt32(item.Key));
                    cmd1.Parameters.AddWithValue("@OrderId", OrderId);
                    cmd1.Parameters.AddWithValue("@BookingPrice", Convert.ToInt32(item.Value[1]));
                    cmd1.ExecuteNonQuery();
                }
                con.Close();
                MyCartList.Visible = false;
                Cart.Visible = false;
                ViewState.Remove("SubSeviceIdCart");
                ViewState.Remove("totalPrice");
                foreach (DataListItem item in DataList1.Items)
                {
                    int index = item.ItemIndex;
                    Button btn = (Button)item.FindControl("Button1");
                    btn.Text = "Add to Cart";
                    btn.CssClass = "btn btn-primary btn-block btn-md";
                }
                //Response.Write("<script>alert('Service Booked successfully having ID=" + OrderId + "');</script>");
                Response.Redirect("CustomerBookings.aspx");
                
            }
           


        }
    }
}