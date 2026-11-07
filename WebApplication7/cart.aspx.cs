using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication7
{
    public partial class cart : System.Web.UI.Page
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
                fillCart();
            }
        }

        void fillCart()
        {
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

                grand_total.Text = "Grand Total: ₹" + total.ToString("0.00");
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();

                grand_total.Text = "Your cart is empty.";
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            fillCart();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            fillCart();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            dt = (DataTable)Session["cart"];

            int pid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            int qty = Convert.ToInt32(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlQty")).SelectedValue);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (Convert.ToInt32(dt.Rows[i]["Prod_Id"]) == pid)
                {
                    dt.Rows[i]["Qty"] = qty;
                    break;
                }
            }

            Session["cart"] = dt;

            GridView1.EditIndex = -1;
            fillCart();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_remove")
            {
                dt = (DataTable)Session["cart"];

                int pid = Convert.ToInt32(e.CommandArgument);

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (Convert.ToInt32(dt.Rows[i]["Prod_Id"]) == pid)
                    {
                        dt.Rows.RemoveAt(i);
                        break;
                    }
                }

                Session["cart"] = dt;

                fillCart();
            }
        }

      
protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Session["addmin"] != null)
            {
                if (Session["cart"] != null)
                {
                    dt = (DataTable)Session["cart"];

                    if (dt.Rows.Count > 0)
                    {
                        decimal total = 0;

                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            total = total + Convert.ToDecimal(dt.Rows[i]["Prod_Price"]) *
                                Convert.ToInt32(dt.Rows[i]["Qty"]);
                        }

                        getCon();

                        string q = "insert into Order_Tbl (order_user_id, order_payment_status, order_payment_method, order_payment_amount, order_date) values (" +
                            Session["addmin"] + ", 'Pending', 'Cash on Delivery', " +
                            total + ", GETDATE()); SELECT SCOPE_IDENTITY();";

                        cmd = new SqlCommand(q, con);

                        int oid = Convert.ToInt32(cmd.ExecuteScalar());

                        //con.Close();

                        Response.Redirect("orderdetails.aspx?oid=" + oid);
                    }
                    else
                    {
                        grand_total.Text = "Your cart is empty.";
                    }
                }
                else
                {
                    grand_total.Text = "Your cart is empty.";
                }
            }
            else
            {
                grand_total.Text = "Please login first.";
            }
        }
    }
}
