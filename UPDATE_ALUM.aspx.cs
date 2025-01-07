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
    public partial class UPDATE_ALUM : System.Web.UI.Page
    {    
            TextBox[] txtarray;
            private void fill_txtarray()
            {
                txtarray = new TextBox[] {TextBox1,TextBox2,TextBox3,TextBox4,TextBox5,TextBox6,
                    TextBox7,TextBox8,TextBox9,TextBox10,TextBox11,TextBox12,TextBox13 };
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
                SqlConnection conn = new SqlConnection(connectionString);

                string query = "SELECT * FROM ALUMNI WHERE ALUMNI_ID=@id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", Session["Alumni_ID"]);

                SqlDataAdapter adapt = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                try
                {
                    conn.Open();
                    adapt.Fill(dt);

                    TextBox1.Text = dt.Rows[0]["NAME"].ToString();
                    TextBox2.Text = dt.Rows[0]["LASTNAME"].ToString();
                    TextBox3.Text = dt.Rows[0]["EMAIL_ID"].ToString();
                    TextBox4.Text = dt.Rows[0]["USERNAME"].ToString(); 
                    TextBox6.Text = dt.Rows[0]["COLLEGE"].ToString();
                    TextBox7.Text = dt.Rows[0]["BATCH_YEAR"].ToString();
                    TextBox8.Text = dt.Rows[0]["STREAM"].ToString();
                    TextBox9.Text = dt.Rows[0]["BRANCH"].ToString();
                    TextBox10.Text = dt.Rows[0]["COMPANY"].ToString();
                    TextBox11.Text = dt.Rows[0]["DESIGNATION"].ToString();
                    TextBox12.Text = dt.Rows[0]["SKILL1"].ToString();
                    TextBox13.Text = dt.Rows[0]["ABOUT"].ToString(); 

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
            SqlConnection conn = new SqlConnection(connectionString);

                string query = "UPDATE ALUMNI SET NAME=@name,LASTNAME=@lastname,EMAIL_ID=@email,USERNAME=@uname,COLLEGE=@clg," +
                    "BATCH_YEAR=@batch,STREAM=@stream,BRANCH=@branch,COMPANY=@company," +
                    "DESIGNATION=@designation,SKILLS=@skills,ABOUT=@about WHERE ALUMNI_ID=@id";
                SqlCommand cmd = new SqlCommand(query, conn);

                try
                {
                    conn.Open();
                    cmd.Parameters.AddWithValue("@name", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@lastname", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@email", TextBox3.Text);
                    cmd.Parameters.AddWithValue("@uname", TextBox4.Text);
                    cmd.Parameters.AddWithValue("@clg", TextBox6.Text);
                    cmd.Parameters.AddWithValue("@batch", TextBox7.Text);
                    cmd.Parameters.AddWithValue("@stream", TextBox8.Text);
                    cmd.Parameters.AddWithValue("@branch", TextBox9.Text);
                    cmd.Parameters.AddWithValue("@company", TextBox10.Text);
                    cmd.Parameters.AddWithValue("@designation", TextBox11.Text);
                    cmd.Parameters.AddWithValue("@skills", TextBox12.Text);
                    cmd.Parameters.AddWithValue("@about", TextBox13.Text);
                    cmd.Parameters.AddWithValue("@id", Session["AlumniID"]);

                    cmd.ExecuteNonQuery();

                    Label13.Text = "Profile Updated Successfully";
                }
                catch (SqlException ex)
                {
                    Response.Redirect(ex.Message);
                }
                finally
                {
                    conn.Close();
                }

                fill_txtarray();
                foreach (TextBox txtbox in txtarray)
                {
                    txtbox.Enabled = false;
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

        }
    }
 