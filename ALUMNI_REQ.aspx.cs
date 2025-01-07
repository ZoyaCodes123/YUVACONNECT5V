using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

namespace YuvaConnect
{
    public partial class ALUMNI_REQ : System.Web.UI.Page
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

        // Method to bind the grid with data from new_alumni table
        private void BindGrid(string collegeName)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM new_alumni WHERE COLLEGE = @CollegeName"; // Filter by college
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

        private void delete(string alumniID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlTransaction transaction = con.BeginTransaction(); // Begin transaction

                try
                {
                    string deleteQuery = "DELETE FROM NEW_ALUMNI WHERE ALUMNI_ID = @ALUMNIID";
                    using (SqlCommand deleteCmd = new SqlCommand(deleteQuery, con, transaction))
                    {
                        deleteCmd.Parameters.AddWithValue("@ALUMNIID", alumniID);
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

        // Accept Button Click Event: Move user to ALUMNI table and delete from new_alumni table
        protected void AcceptButton_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender; // Reference to the clicked button
            GridViewRow row = (GridViewRow)btn.NamingContainer;

            // Fetch the ALUMNI_ID from CommandArgument
            string alumniId = btn.CommandArgument;

            MoveToAlumniTable(alumniId); // Move user to alumni table
            SendEmail();
            BindGrid(Session["AdminCollegeName"].ToString()); // Refresh the grid
        }


        //email
        protected void SendEmail()
        {
            string senderEmail = System.Configuration.ConfigurationManager.AppSettings["Email"];
            string emailPassword = System.Configuration.ConfigurationManager.AppSettings["EmailPassword"];
            string receiverEmail = "wallflower771@gmail.com";
            string mailBody = "We are glad to invite you on our platform YuvaConnect";


            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(senderEmail);
            mail.To.Add(receiverEmail);
            mail.Subject = "Registration Successful";
            mail.Body = mailBody;
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587)
            {
                Credentials = new NetworkCredential(senderEmail, emailPassword),
                EnableSsl = true,
                Timeout = 20000
            };


            try
            {
                smtp.Send(mail);
                Response.Write("                                                              Email sent successfully!");
            }
            catch (SmtpException ex)
            {
                Response.Write($"SMTP Error: {ex.StatusCode} - {ex.Message}<br>");
                if (ex.InnerException != null)
                {
                    Response.Write($"Inner Exception: {ex.InnerException.Message}<br>");
                }
                Response.Write($"Stack Trace: {ex.StackTrace}<br>");
            }
            catch (Exception ex)
            {
                Response.Write($"General Error: {ex.Message}<br>");
                Response.Write($"Stack Trace: {ex.StackTrace}<br>");
            }
        }


        // Method to move user to ALUMNI table and delete from new_alumni table
        private void MoveToAlumniTable(string alumniId)
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
                INSERT INTO ALUMNI (ENROLLMENT_NUMBER,NAME, LASTNAME, USERNAME, PASSWORD, STREAM, BRANCH, BATCH_YEAR, COMPANY, DESIGNATION, COLLEGE, LOCATION, EMAIL_ID, LINKEDIN_LINK, SKILL1, SKILL2, SKILL3, IMAGE_URL)
                SELECT ENROLLMENT_NUMBER, NAME, LASTNAME, USERNAME, PASSWORD, STREAM, BRANCH, BATCH_YEAR, COMPANY, DESIGNATION, COLLEGE, LOCATION, EMAIL_ID, LINKEDIN_LINK, SKILL1, SKILL2, SKILL3, IMAGE_URL
                FROM new_alumni
                WHERE ALUMNI_ID = @AlumniId";

                    using (SqlCommand insertCmd = new SqlCommand(insertQuery, con, transaction))
                    {
                        insertCmd.Parameters.AddWithValue("@AlumniId", alumniId);
                        insertCmd.ExecuteNonQuery();
                    }

                    // Step 2: Delete user from the new_alumni table
                    string deleteQuery = "DELETE FROM new_alumni WHERE ALUMNI_ID = @AlumniId";
                    using (SqlCommand deleteCmd = new SqlCommand(deleteQuery, con, transaction))
                    {
                        deleteCmd.Parameters.AddWithValue("@AlumniId", alumniId);
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