using System;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication7
{
    public partial class productdetails : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\RestaurantDB.mdf;Integrated Security=True";

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillDataList()
        {
            getCon();

            da = new SqlDataAdapter(
                "select * from Add_Products_tbl where Prod_Id = " +
                Convert.ToInt32(Request.QueryString["pid"]), con);

            ds = new DataSet();
            da.Fill(ds);

            DataList1.DataSource = ds;
            DataList1.DataBind();

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["pid"] != null)
                {
                    fillDataList();
                }
                else
                {
                    Response.Redirect("product.aspx");
                }
            }
        }
    }
}
