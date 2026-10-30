using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication7
{
    public partial class AddProduct : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string frm;

        string s = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\RestaurantDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillcombo();

                if (Request.QueryString["cid"] != null)
                {
                    ddlCompany.SelectedValue = Request.QueryString["cid"];
                }
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void imgUpload()
        {
            if (fuProductImg.HasFile)
            {
                frm = "Images/ProductImages/" + fuProductImg.FileName;
                fuProductImg.SaveAs(Server.MapPath(frm));
            }
            else
            {
                frm = "";
            }
        }

        void clear()
        {
            txtProductName.Text = "";
            txtPrice.Text = "";
            txtDesc.Text = "";
            ddlCompany.SelectedIndex = -1;
        }

        void fillcombo()
        {
            getcon();

            da = new SqlDataAdapter("select * from Add_company_tbl", con);
            ds = new DataSet();
            da.Fill(ds);

            ddlCompany.DataSource = ds;
            ddlCompany.DataTextField = "comp_name";
            ddlCompany.DataValueField = "comp_id";
            ddlCompany.DataBind();

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            getcon();
            imgUpload();

            cmd = new SqlCommand(
                "insert into Add_Products_tbl(Prod_Comp_Id,Prod_Name,Prod_Price,Prod_Desc,Prod_Img) values('" +
                ddlCompany.SelectedValue + "','" +
                txtProductName.Text + "','" +
                txtPrice.Text + "','" +
                txtDesc.Text + "','" +
                fuProductImg.FileName + "')", con);

            cmd.ExecuteNonQuery();

            

            lblMessage.Text = "Product Added Successfully";
        }
    }
}