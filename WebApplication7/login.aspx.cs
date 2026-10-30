//using System;
//using System.Data;
//using System.Data.SqlClient;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace WebApplication7
//{
//    public partial class Login : System.Web.UI.Page
//    {
//        SqlConnection con;
//        SqlDataAdapter da;
//        DataSet ds;
//        SqlCommand cmd;

//        string s = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\RestaurantDB.mdf;Integrated Security=True";

//        protected void Page_Load(object sender, EventArgs e)
//        {

//        }

//        void getCon()
//        {
//            con = new SqlConnection(s);

//            if (con.State == ConnectionState.Closed)
//            {
//                con.Open();
//            }
//        }

//        protected void btnLogin_Click(object sender, EventArgs e)
//        {
//            if (txtEmail.Text != "" && txtPassword.Text != "")
//            {
//                getCon();

//                da = new SqlDataAdapter("select * from Users where Email='" +txtEmail.Text +"' and Password='" +txtPassword.Text +  "'",con);
//                ds = new DataSet();
//                da.Fill(ds);
//                if (ds.Tables[0].Rows.Count > 0)
//                {
//                    Response.Redirect("company.aspx");
//                }
//                else
//                {

//                    Response.Write  ("Invalid Email & Password");
//                }

//            }
//            else
//            {

//                Response.Write("Enter Email & Password");
//            }
//        }
//    }
//}


using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication7
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;

        string s = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\RestaurantDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void getCon()
        {
            con = new SqlConnection(s);

            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text != "" && txtPassword.Text != "")
            {
                getCon();

                da = new SqlDataAdapter(
                    "select * from Users where Email='" + txtEmail.Text +
                    "' and Password='" + txtPassword.Text + "'", con);

                ds = new DataSet();
                da.Fill(ds);

                //if (ds.Tables[0].Rows.Count > 0)
                //{
                //    Session["addmin"] = ds.Tables[0].Rows[0]["User_Id"].ToString();

                //    Session["name"] = ds.Tables[0].Rows[0]["Name"].ToString();
                //    Session["email"] = ds.Tables[0].Rows[0]["Email"].ToString();

                //    con.Close();

                //    Response.Redirect("company.aspx");
                //}


                if (ds.Tables[0].Rows.Count > 0)
                {
                    Session["addmin"] = ds.Tables[0].Rows[0]["Id"].ToString();

                    Session["name"] = ds.Tables[0].Rows[0]["FullName"].ToString();
                    Session["email"] = ds.Tables[0].Rows[0]["Email"].ToString();

                   // con.Close();

                    Response.Redirect("company.aspx");
                }
 
                else
                {
                    //con.Close();

                    Response.Write("Invalid Email & Password");
                }
            }
            else
            {
                Response.Write("Enter Email & Password");
            }
        }
    }
}