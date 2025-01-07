using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YuvaConnect
{
    public partial class ALUMNI_PROFILE : System.Web.UI.Page
    {
         
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    if (Session["SelectedAlumniID"] != null)
                    {
                        string alumniID = Session["SelectedAlumniID"].ToString();

                        LoadAlumniDetails(alumniID);
                    }
                }
            }
            private void LoadAlumniDetails(string alumniID)
            {
                string ConnectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(ConnectionString);

                string query = "SELECT * FROM ALUMNI WHERE ALUMNI_ID=@AlumniID";
                SqlCommand cmd = new SqlCommand(query, conn);

                try
                {
                    cmd.Parameters.AddWithValue("@AlumniID", alumniID);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        lblname.Text = reader["NAME"].ToString() + reader["LASTNAME"].ToString();
                        lbluname.Text = reader["USERNAME"].ToString();
                        lblemail.Text = reader["EMAIL_ID"].ToString();
                        lblclg.Text = reader["COLLEGE"].ToString();
                        lblstream.Text = reader["STREAM"].ToString();
                        lblbranch.Text = reader["BRANCH"].ToString();
                        lblbatch_year.Text = reader["BATCH_YEAR"].ToString();

                        lblcompany.Text = reader["COMPANY"].ToString();
                        lbldesig.Text = reader["DESIGNATION"].ToString();
                        lblskill.Text = reader["SKILL1"].ToString();
                        lblskill1.Text = reader["SKILL2"].ToString();
                        lblskill3.Text = reader["SKILL3"].ToString();
                        lbllocation.Text = reader["LOCATION"].ToString();
                        lblabout.Text = reader["ABOUT"].ToString();

                        profile_img.ImageUrl = reader["IMAGE_URL"].ToString(); // when image url is provided by the table
                        ImageButton1.PostBackUrl = "https://www.linkedin.com/in/rojalin-pradhan-7b1495270/";
                        ImageButton1.PostBackUrl = reader["LINKEDIN_LINK"].ToString();  // in case where table provides Linkedin ID
                    }

                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
                finally
                {
                    conn.Close();
                }
            }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ALUMNI.aspx");
        }
    }
}