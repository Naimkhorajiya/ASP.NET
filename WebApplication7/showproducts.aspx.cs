using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication7
{
    public partial class showproducts : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

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
                filldatalist();
            }
        }

        void filldatalist()
        {
            getCon();

            da = new SqlDataAdapter(
                "select * from Add_Products_tbl where Prod_Comp_Id=" +
                Request.QueryString["cid"], con);

            ds = new DataSet();
            da.Fill(ds);

            DataList1.DataSource = ds;
            DataList1.DataBind();

            con.Close();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_view")
            {
                Response.Redirect("productdetails.aspx?pid=" + e.CommandArgument);
            }
            else if (e.CommandName == "cmd_cart")
            {
                getCon();

                da = new SqlDataAdapter(
                    "select * from Add_Products_tbl where Prod_Id=" +
                    e.CommandArgument, con);

                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    DataTable dt;

                    if (Session["cart"] == null)
                    {
                        dt = new DataTable();

                        dt.Columns.Add("Prod_Id");
                        dt.Columns.Add("Prod_Name");
                        dt.Columns.Add("Prod_Price");
                        dt.Columns.Add("Prod_Desc");
                        dt.Columns.Add("Prod_Img");
                        dt.Columns.Add("Qty");
                    }
                    else
                    {
                        dt = (DataTable)Session["cart"];
                    }

                    int found = 0;

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (dt.Rows[i]["Prod_Id"].ToString() ==
                            ds.Tables[0].Rows[0]["Prod_Id"].ToString())
                        {
                            dt.Rows[i]["Qty"] =
                                Convert.ToInt32(dt.Rows[i]["Qty"]) + 1;

                            found = 1;
                        }
                    }

                    if (found == 0)
                    {
                        DataRow row = dt.NewRow();

                        row["Prod_Id"] = ds.Tables[0].Rows[0]["Prod_Id"];
                        row["Prod_Name"] = ds.Tables[0].Rows[0]["Prod_Name"];
                        row["Prod_Price"] = ds.Tables[0].Rows[0]["Prod_Price"];
                        row["Prod_Desc"] = ds.Tables[0].Rows[0]["Prod_Desc"];
                        row["Prod_Img"] = ds.Tables[0].Rows[0]["Prod_Img"];
                        row["Qty"] = 1;

                        dt.Rows.Add(row);
                    }

                    Session["cart"] = dt;
                }

                con.Close();

                Response.Redirect("cart.aspx");
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx?cid=" + Request.QueryString["cid"]);
        }

        protected void btnViewCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("cart.aspx");
        }
    }
}
