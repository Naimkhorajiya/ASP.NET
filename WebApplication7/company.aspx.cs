//using System;
//using System.Data;
//using System.Data.SqlClient;
//using System.Configuration;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.IO;

//namespace WebApplication7
//{
//    public partial class company : System.Web.UI.Page
//    {
//        SqlConnection con;
//        SqlDataAdapter da;
//        DataSet ds;
//        SqlCommand cmd;

//        string s = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\RestaurantDB.mdf;Integrated Security=True";

//        void getCon()
//        {
//            con = new SqlConnection(s);
//            con.Open();
//        }

//        protected void Page_Load(object sender, EventArgs e)
//        {

//        }

//        protected void btnSubmit_Click(object sender, EventArgs e)
//        {
//            getCon();

//            string img = "";

//            if (fuCoverImg.HasFile)
//            {
//                img = fuCoverImg.FileName;

//                string path = Server.MapPath("~/Images/CompanyImages/");

//                fuCoverImg.SaveAs(path + img);
//            }

//            cmd = new SqlCommand("insert into Add_company_tbl(comp_name,comp_owner_name,comp_email,comp_Address,comp_cover_Img) values('" + txtCompanyName.Text + "','" + txtOwnerName.Text + "','" + txtEmail.Text + "','" + txtAddress.Text + "','" + img + "')", con);
//            cmd.ExecuteNonQuery();
//            Response.Write("Company Added Successfully");
//            txtCompanyName.Text = "";
//            txtOwnerName.Text = "";
//            txtEmail.Text = "";
//            txtAddress.Text = "";
//        }

//        protected void txtCompanyName_TextChanged(object sender, EventArgs e)
//        {

//        }

//        protected void txtAddress_TextChanged()
//        {

//        }
//    }
//}


using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication7
{
    public partial class company : System.Web.UI.Page
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
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            getcon();

            string img = "";

            if (fuCoverImg.HasFile)
            {
                img = fuCoverImg.FileName;

                string path = Server.MapPath("~/Images/CompanyImages/");

                fuCoverImg.SaveAs(path + img);
            }

            cmd = new SqlCommand(
                "insert into Add_company_tbl(comp_name,comp_owner_name,comp_email,comp_Address,comp_cover_Img) values('" +
                txtCompanyName.Text + "','" +
                txtOwnerName.Text + "','" +
                txtEmail.Text + "','" +
                txtAddress.Text + "','" +
                img + "')", con);

            cmd.ExecuteNonQuery();

           // con.Close();

            lblMessage.Text = "Company Added Successfully";

            txtCompanyName.Text = "";
            txtOwnerName.Text = "";
            txtEmail.Text = "";
            txtAddress.Text = "";
        }
    }
}