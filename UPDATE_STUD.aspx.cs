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
    public partial class UPDATE_STUD : System.Web.UI.Page
    {
            TextBox[] txtarray;
            private void fill_txtarray()
            {
                txtarray = new TextBox[] {TextBox1,TextBox2,TextBox3,TextBox4,TextBox5,TextBox6,
                    TextBox7,TextBox8,TextBox9,TextBox10,TextBox11,TextBox12};
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

            protected void Button2_Click(object sender, EventArgs e)
            {
                fill_txtarray();
                foreach (TextBox txtbox in txtarray)
                {
                    txtbox.Enabled = true;
                }
                Label13.Text = string.Empty;
            }
            private void data_display()
            {
                string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(connectionString);

                string query = "SELECT * FROM STUDENT WHERE STUDENT_ID=@id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", Session["Student_ID"]);

                SqlDataAdapter adap = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                try
                {
                    conn.Open();
                    adap.Fill(dt);

                    TextBox1.Text = dt.Rows[0]["NAME"].ToString();
                    TextBox2.Text = dt.Rows[0]["LASTNAME"].ToString();
                    TextBox3.Text = dt.Rows[0]["EMAIL_ID"].ToString();
                    TextBox4.Text = dt.Rows[0]["USERNAME"].ToString();  
                    TextBox6.Text = dt.Rows[0]["COLLEGE"].ToString();
                    TextBox7.Text = dt.Rows[0]["STREAM"].ToString();
                    TextBox8.Text = dt.Rows[0]["BRANCH"].ToString();
                    TextBox9.Text = dt.Rows[0]["STARTING_YEAR"].ToString();
                    TextBox10.Text = dt.Rows[0]["ENDING_YEAR"].ToString();
                    TextBox11.Text = dt.Rows[0]["SKILL1"].ToString();
                    TextBox11.Text = dt.Rows[0]["SKILL2"].ToString();
                    TextBox11.Text = dt.Rows[0]["SKILL3"].ToString();
                    TextBox12.Text = dt.Rows[0]["ABOUT"].ToString(); 
            }
                catch (SqlException ex)
                {
                    Response.Write(ex.Message);
                }
                finally
                {
                    conn.Close();
                }
            }

            protected void Button3_Click(object sender, EventArgs e)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;
                SqlConnection connect = new SqlConnection(connectionString);

                string query = "UPDATE STUDENT SET NAME=@name,LASTNAME=@lastname,EMAIL_ID=@email,USERNAME=@uname,COLLEGE=@clg," +
                    "STREAM=@stream,BRANCH=@branch,STARTING_YEAR=@start,ENDING_YEAR=@end," +
                    "SKILLS=@skills,ABOUT=@about WHERE STUDENT_ID=@id";
                SqlCommand updcmd = new SqlCommand(query, connect);

                try
                {
                    connect.Open();
                    updcmd.Parameters.AddWithValue("@name", TextBox1.Text);
                    updcmd.Parameters.AddWithValue("@lastname", TextBox2.Text);
                    updcmd.Parameters.AddWithValue("@email", TextBox3.Text);
                    updcmd.Parameters.AddWithValue("@uname", TextBox4.Text);
                    updcmd.Parameters.AddWithValue("@clg", TextBox6.Text);
                    updcmd.Parameters.AddWithValue("@stream", TextBox7.Text);
                    updcmd.Parameters.AddWithValue("@branch", TextBox8.Text);
                    updcmd.Parameters.AddWithValue("@start", TextBox9.Text);
                    updcmd.Parameters.AddWithValue("@end", TextBox10.Text);
                    updcmd.Parameters.AddWithValue("@skills", TextBox11.Text);
                    updcmd.Parameters.AddWithValue("@about", TextBox12.Text);
                    updcmd.Parameters.AddWithValue("@id", Session["Student_ID"]);
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