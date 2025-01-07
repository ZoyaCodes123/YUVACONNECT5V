using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YuvaConnect
{
    public partial class UPDATE : System.Web.UI.Page
    {
        
            private TextBox[] txtboxes;


            private void txtinitial()
            {
                txtboxes = new TextBox[] {
                    TextBox1,TextBox2,TextBox3,TextBox4,TextBox5,TextBox6,TextBox7,TextBox8,TextBox9,TextBox10,TextBox11,TextBox12 };
            }
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {

                    string connString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;
                    SqlConnection conn = new SqlConnection(connString);

                    string query = "SELECT * FROM STUDENT";
                    SqlCommand cmd = new SqlCommand(query, conn);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();

                    try
                    {
                        conn.Open();
                        adapter.Fill(dt);

                        TextBox1.Text = dt.Rows[0]["NAME"].ToString();
                        TextBox2.Text = dt.Rows[0]["LASTNAME"].ToString();
                        TextBox3.Text = dt.Rows[0]["USERNAME"].ToString();
                        TextBox4.Text = dt.Rows[0]["PASSWORD"].ToString();
                        TextBox5.Text = dt.Rows[0]["EMAIL_ID"].ToString();
                        TextBox6.Text = dt.Rows[0]["COLLEGE"].ToString();
                        TextBox7.Text = dt.Rows[0]["STREAM"].ToString();
                        TextBox8.Text = dt.Rows[0]["BRANCH"].ToString();
                        TextBox9.Text = dt.Rows[0]["STARTING_YEAR"].ToString();
                        TextBox10.Text = dt.Rows[0]["ENDING_YEAR"].ToString();
                        TextBox11.Text = dt.Rows[0]["SKILLS"].ToString();
                        TextBox12.Text = dt.Rows[0]["ABOUT"].ToString();

                        txtinitial();
                        foreach (TextBox txt in txtboxes)
                        {
                            txt.Enabled = false;
                        }
                        Button2.Enabled = false;
                        Button3.Enabled = false;
                    }
                    catch (SqlException ex)
                    {
                        Response.Write("Error : " + ex.Message);
                    }
                    finally
                    {
                        conn.Close();
                    }

                }
            }

            protected void Button1_Click(object sender, EventArgs e)
            {
                txtinitial();
                foreach (TextBox txt in txtboxes)
                {
                    txt.Enabled = true;
                }
                Button2.Enabled = true;
            }

            protected void Button2_Click(object sender, EventArgs e)
            {
                string connString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;
                SqlConnection conn2 = new SqlConnection(connString);

                string query = "UPDATE STUDENT SET NAME=@name,LASTNAME=@lastname,USERNAME=@username,PASSWORD=@pass," +
                    "EMAIL_ID=@email,COLLEGE=@clg,STREAM=@stream,BRANCH=@branch," +
                    "STARTING_YEAR=@start,ENDING_YEAR=@end,SKILLS=@skills,ABOUT=@about WHERE STUDENT_ID=@id";
                SqlCommand updcmd = new SqlCommand(query, conn2);

                try
                {
                    conn2.Open();
                    updcmd.Parameters.AddWithValue("@name", TextBox1.Text);
                    updcmd.Parameters.AddWithValue("@lastname", TextBox2.Text);
                    updcmd.Parameters.AddWithValue("@username", TextBox3.Text);
                    updcmd.Parameters.AddWithValue("@pass", TextBox4.Text);
                    updcmd.Parameters.AddWithValue("@email", TextBox5.Text);
                    updcmd.Parameters.AddWithValue("@clg", TextBox6.Text);
                    updcmd.Parameters.AddWithValue("@stream", TextBox7.Text);
                    updcmd.Parameters.AddWithValue("@branch", TextBox8.Text);
                    updcmd.Parameters.AddWithValue("@start", TextBox9.Text);
                    updcmd.Parameters.AddWithValue("@end", TextBox10.Text);
                    updcmd.Parameters.AddWithValue("@skills", TextBox11.Text);
                    updcmd.Parameters.AddWithValue("@about", TextBox12.Text);
                    updcmd.Parameters.AddWithValue("@id", "SD1");


                updcmd.ExecuteNonQuery();
                    Response.Write("UPDATE SUCCESSFUL");
                    Button3.Enabled = true;
                }
                catch (SqlException ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
                finally
                {
                    conn2.Close();
                }
            }

            protected void Button3_Click(object sender, EventArgs e)
            {
                Response.Write(" ");
            }
        }
    }
