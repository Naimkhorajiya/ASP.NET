using System;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication7
{
    public partial class orderdetails : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        DataTable dt;

        string s = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\RestaurantDB.mdf;Integrated Security=True";

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["oid"] != null)
                {
                    lblOrderId.Text = Request.QueryString["oid"];
                    lblOrderDate.Text = DateTime.Now.ToString("dd-MM-yyyy");

                    if (Session["cart"] != null)
                    {
                        dt = (DataTable)Session["cart"];

                        GridView1.DataSource = dt;
                        GridView1.DataBind();

                        decimal total = 0;

                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            total = total + Convert.ToDecimal(dt.Rows[i]["Prod_Price"]) *
                                Convert.ToInt32(dt.Rows[i]["Qty"]);
                        }

                        lblTotal.Text = "Grand Total: ₹" + total.ToString("0.00");
                    }

                    if (Session["name"] != null)
                    {
                        txtName.Text = Session["name"].ToString();
                    }

                    if (Session["email"] != null)
                    {
                        txtEmail.Text = Session["email"].ToString();
                    }

                    if (Session["mobile"] != null)
                    {
                        txtMobile.Text = Session["mobile"].ToString();
                    }
                }
                else
                {
                    Response.Redirect("cart.aspx");
                }
            }
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            if (txtAddress.Text == "" || RadioButtonList1.SelectedValue == "")
            {
                lblMessage.Text = "Please enter shipping address and select payment method.";
            }
            else
            {
                getCon();

                cmd = new SqlCommand(
                    "update Order_Tbl set order_payment_method='" +
                    RadioButtonList1.SelectedValue + "', order_address='" +
                    txtAddress.Text + "' where order_id=" +
                    Convert.ToInt32(Request.QueryString["oid"]), con);

                cmd.ExecuteNonQuery();

              

                Session["cart"] = null;

                lblMessage.Text = "Order placed successfully!";
                btnPlaceOrder.Enabled = false;
            }
        }
    }
}
