using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YuvaConnect
{
    public partial class UPDATE_ADM : System.Web.UI.Page
    {
        TextBox[] txtarray;
        private void fill_txtarray()
        {
            txtarray = new TextBox[] { TextBox1, TextBox2, TextBox3, TextBox4 };
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fill_txtarray();
                foreach (TextBox txtbox in txtarray)
                {
                    txtbox.Enabled = false;
                }
                data_display();
            }
        }

        private void data_display()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;
            SqlConnection connect = new SqlConnection(connectionString);

            string query = "SELECT * FROM ADMIN WHERE ADMIN_ID=@id";
            SqlCommand cmd = new SqlCommand(query, connect);

            cmd.Parameters.AddWithValue("@id", Session["ADMIN_ID"]);

            SqlDataAdapter adap = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();

            try
            {
                connect.Open();
                adap.Fill(dt);

                TextBox1.Text = dt.Rows[0]["NAME"].ToString();
                TextBox2.Text = dt.Rows[0]["CLG_NAME"].ToString();
                TextBox3.Text = dt.Rows[0]["EMAIL"].ToString();  ;
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                connect.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            fill_txtarray();
            foreach (TextBox txtbox in txtarray)
            {
                txtbox.Enabled = true;
            }
            Label13.Text = string.Empty;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;
            SqlConnection connect = new SqlConnection(connectionString);

            string query = "UPDATE ADMIN SET NAME=@admname,CLG_NAME=@clgname,EMAIL=@email,PASSWORD=@pass" +
                " WHERE ADMIN_ID=@id";
            SqlCommand updcmd = new SqlCommand(query, connect);

            try
            {
                connect.Open();
                updcmd.Parameters.AddWithValue("@admname", TextBox1.Text);
                updcmd.Parameters.AddWithValue("@clgname", TextBox2.Text);
                updcmd.Parameters.AddWithValue("@email", TextBox3.Text);
                updcmd.Parameters.AddWithValue("@pass", TextBox4.Text);
                updcmd.Parameters.AddWithValue("@id", Session["Admin_ID"]);
                updcmd.ExecuteNonQuery();

                Label13.Text = "Profile Updated Successfully";
            }
            catch (SqlException ex)
            {
                Response.Redirect(ex.Message);
            }
            finally
            {
                connect.Close();
            }

            fill_txtarray();
            foreach (TextBox txtbox in txtarray)
            {
                txtbox.Enabled = false;
            }
        }
    }
}
