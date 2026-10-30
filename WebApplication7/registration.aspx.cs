using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication7
{
    public partial class WebForm2 : System.Web.UI.Page
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

        
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (btnRegister.Text == "Register")
            {
                getCon();

                cmd = new SqlCommand("insert into Users(FullName,Email,Password) values('" + txtFullName.Text + "','" + txtEmail.Text + "','" + txtPassword.Text + "')", con);
                cmd.ExecuteNonQuery();
                Response.Redirect("Login.aspx");
            }
            else
            {
                getCon();

                cmd = new SqlCommand("update Users set FullName='" + txtFullName.Text + "',Email='" + txtEmail.Text + "' where Id=" + ViewState["id"], con);
                cmd.ExecuteNonQuery();
                btnRegister.Text = "Register";
                fillgrid();
            }
        }

        void fillgrid()
        {
            getCon();
            da = new SqlDataAdapter("select * from Users", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edit")
            {
                ViewState["id"] = e.CommandArgument;
                btnRegister.Text = "Update";
                getCon();

                da = new SqlDataAdapter("select * from Users where Id='" + ViewState["id"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                txtFullName.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            }
            else if (e.CommandName == "cmd_delete")
            {
                getCon();
                cmd = new SqlCommand("delete from Users where Id=" + e.CommandArgument, con);
                cmd.ExecuteNonQuery();
                fillgrid();
            }
        }
    }
}