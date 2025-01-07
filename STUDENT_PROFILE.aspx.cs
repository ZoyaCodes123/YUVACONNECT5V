using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YuvaConnect
{
    public partial class STUDENT_PROFILE : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["SelectedStudentID"] != null)
                {
                    string studentID = Session["SelectedStudentID"].ToString();
                    LoadStudentDetails(studentID);
                }
            }
        }

        private void LoadStudentDetails(string studentID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;
            string query = "SELECT * FROM STUDENT WHERE STUDENT_ID = @StudentID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@StudentID", studentID);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        // Display student details
                        lbluname.Text = reader["USERNAME"].ToString();
                        lblname.Text = reader["NAME"].ToString() + " " + reader["LASTNAME"].ToString();
                        lblemail.Text = reader["EMAIL_ID"].ToString();
                        lblclg.Text = reader["COLLEGE"].ToString();
                        lblstream.Text = reader["STREAM"].ToString();
                        lblbranch.Text = reader["BRANCH"].ToString();
                        lblstart_year.Text = reader["STARTING_YEAR"].ToString();
                        lblend_year.Text = reader["ENDING_YEAR"].ToString();
                        lblskill1.Text = reader["SKILL1"].ToString();
                        lblskill2.Text = reader["SKILL2"].ToString();
                        lblskill3.Text = reader["SKILL3"].ToString();
                        lblabout.Text = reader["ABOUT"].ToString();
                        profile_img.ImageUrl = reader["IMAGE_URL"].ToString();

                        ImageButton1.PostBackUrl = "https://www.linkedin.com/in/rojalin-pradhan-7b1495270/";
                        ImageButton1.PostBackUrl = reader["LINKEDIN_LINK"].ToString();  // in case where table provides Linkedin ID
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("STUDENT.aspx");
        }
    }
}