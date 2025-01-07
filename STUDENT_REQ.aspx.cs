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
    public partial class STUDENT_REQ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserRole"] != null && Session["UserRole"].ToString() == "admin" && Session["AdminCollegeName"] != null)
                {
                    BindGrid(Session["AdminCollegeName"].ToString());
                }
                else
                {
                    Response.Redirect("Login.aspx"); // Redirect to login if session is invalid
                }
            }
        }

        private void BindGrid(string collegeName)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM NEW_STUDENT WHERE COLLEGE = @CollegeName"; // Filtering by college name
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CollegeName", collegeName);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender; // Reference to the clicked button
            GridViewRow row = (GridViewRow)btn.NamingContainer;

            // Fetch the ALUMNI_ID from CommandArgument
            string studentID = btn.CommandArgument;

            delete(studentID); // Move user to alumni table
            BindGrid(Session["AdminCollegeName"].ToString()); // Refresh the grid
        }

        // Accept Button Click Event: Move user to ALUMNI table and delete from new_alumni table
        protected void AcceptButton_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender; // Reference to the clicked button
            GridViewRow row = (GridViewRow)btn.NamingContainer;

            // Fetch the ALUMNI_ID from CommandArgument
            string studentID = btn.CommandArgument;

            MoveToAlumniTable(studentID); // Move user to alumni table
            BindGrid(Session["AdminCollegeName"].ToString()); // Refresh the grid
        }
        private void delete(string studentID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlTransaction transaction = con.BeginTransaction(); // Begin transaction

                try
                {
                    string deleteQuery = "DELETE FROM NEW_STUDENT WHERE STUDENT_ID = @STUDENTID";
                    using (SqlCommand deleteCmd = new SqlCommand(deleteQuery, con, transaction))
                    {
                        deleteCmd.Parameters.AddWithValue("@STUDENTID", studentID);
                        deleteCmd.ExecuteNonQuery();
                    }

                    transaction.Commit(); // Commit transaction
                }
                catch (Exception ex)
                {
                    transaction.Rollback(); // Rollback if any error occurs
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
                finally
                {
                    con.Close();
                }
            }
         }


            // Method to move user to ALUMNI table and delete from new_alumni table
            private void MoveToAlumniTable(string studentID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlTransaction transaction = con.BeginTransaction(); // Begin transaction

                try
                {
                    // Step 1: Insert user data into the ALUMNI table (excluding ALUMNI_ID)
                    string insertQuery = @"
                INSERT INTO STUDENT (NAME, LASTNAME, USERNAME, PASSWORD, STREAM, BRANCH, STARTING_YEAR, ENDING_YEAR, COLLEGE, EMAIL_ID, LINKEDIN_LINK, SKILL1, SKILL2, SKILL3, ABOUT, IMAGE_URL) 
                SELECT NAME, LASTNAME, USERNAME, PASSWORD, STREAM, BRANCH, STARTING_YEAR, ENDING_YEAR, COLLEGE, EMAIL_ID, LINKEDIN_LINK, SKILL1, SKILL2, SKILL3, ABOUT, IMAGE_URL
                FROM NEW_STUDENT
                WHERE STUDENT_ID = @STUDENTID";

                    using (SqlCommand insertCmd = new SqlCommand(insertQuery, con, transaction))
                    {
                        insertCmd.Parameters.AddWithValue("@STUDENTID", studentID);
                        insertCmd.ExecuteNonQuery();
                    }

                    // Step 2: Delete user from the new_alumni table
                    string deleteQuery = "DELETE FROM NEW_STUDENT WHERE STUDENT_ID = @STUDENTID";
                    using (SqlCommand deleteCmd = new SqlCommand(deleteQuery, con, transaction))
                    {
                        deleteCmd.Parameters.AddWithValue("@STUDENTID", studentID);
                        deleteCmd.ExecuteNonQuery();
                    }

                    transaction.Commit(); // Commit transaction
                }
                catch (Exception ex)
                {
                    transaction.Rollback(); // Rollback if any error occurs
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
                finally
                {
                    con.Close();
                }
            }
        }

    }
}