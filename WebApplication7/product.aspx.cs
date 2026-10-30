using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication7
{
    public partial class product : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        string s = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\RestaurantDB.mdf;Integrated Security=True";

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillCompany();
            }
        }

        void fillCompany()
        {
            getcon();

            da = new SqlDataAdapter("select * from Add_company_tbl", con);

            ds = new DataSet();
            da.Fill(ds);

            DataList1.DataSource = ds;
            DataList1.DataBind();

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_mid")
            {
                ViewState["cid"] = e.CommandArgument;

                Response.Redirect("showproducts.aspx?cid=" + ViewState["cid"]);
            }
        }
    }
}