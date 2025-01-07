using System;
using System.Configuration;
using System.Data.SqlClient;

namespace YuvaConnect
{
    public partial class VOTE_ALUMNI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Disable the "Participate" button on initial load
            if (!IsPostBack)
            {
                btnParticipate.Enabled = false;
            }
        }

        protected void chkConfirm_CheckedChanged(object sender, EventArgs e)
        {
            // Enable/disable the "Participate" button based on checkbox state
            btnParticipate.Enabled = chkConfirm.Checked;
        }

        protected void btnParticipate_Click(object sender, EventArgs e)
        {
            // Retrieve logged-in alumni's username from session
            string username = Session["USERNAME"]?.ToString();

            if (string.IsNullOrEmpty(username))
            {
                // Alert user if session is missing or expired
                Response.Write("<script>alert('Error: User not logged in or session expired!');</script>");
                return;
            }

            // Fetch alumni details from ALUMNI table
            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    // Check if the user has already participated
                    string queryCheckParticipation = @"SELECT COUNT(*) FROM CANDIDATE 
                                                        WHERE USERNAME = @Username";

                    SqlCommand cmdCheck = new SqlCommand(queryCheckParticipation, conn);
                    cmdCheck.Parameters.AddWithValue("@Username", username);

                    int participationCount = Convert.ToInt32(cmdCheck.ExecuteScalar());

                    if (participationCount > 0)
                    {
                        // User has already participated
                        Response.Write("<script>alert('You have already participated.');</script>");
                        return;
                    }

                    // Query to fetch alumni details
                    string queryFetchAlumni = @"SELECT NAME, LASTNAME, STREAM, BRANCH, BATCH_YEAR, COLLEGE, 
                                                COMPANY, DESIGNATION, EMAIL_ID, LINKEDIN_LINK, LOCATION, SKILL1, ABOUT, IMAGE_URL
                                                FROM ALUMNI WHERE USERNAME = @USERNAME";

                    SqlCommand cmdFetch = new SqlCommand(queryFetchAlumni, conn);
                    cmdFetch.Parameters.AddWithValue("@USERNAME", username);

                    using (SqlDataReader reader = cmdFetch.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Map alumni details to variables
                            string name = reader["NAME"].ToString();
                            string lastname = reader["LASTNAME"].ToString();
                            string stream = reader["STREAM"].ToString();
                            string branch = reader["BRANCH"].ToString();
                            int batchYear = Convert.ToInt32(reader["BATCH_YEAR"]);
                            string college = reader["COLLEGE"].ToString();
                            string company = reader["COMPANY"].ToString();
                            string designation = reader["DESIGNATION"].ToString();
                            string email = reader["EMAIL_ID"].ToString();
                            string linkedin = reader["LINKEDIN_LINK"].ToString();
                            string location = reader["LOCATION"].ToString();
                            string skill1 = reader["SKILL1"].ToString();
                            string about = reader["ABOUT"].ToString();
                            string imageUrl = reader["IMAGE_URL"].ToString();
                            reader.Close();

                            // Insert alumni details into CANDIDATE table
                            string queryInsertCandidate = @"INSERT INTO CANDIDATE (NAME, LASTNAME, USERNAME, STREAM, BRANCH, BATCH_YEAR, 
                                                           COLLEGE, COMPANY, DESIGNATION, EMAIL_ID, LINKEDIN_LINK, LOCATION, SKILL1, ABOUT, IMAGE_URL)
                                                           VALUES (@Name, @LastName, @Username, @Stream, @Branch, @BatchYear, @College, 
                                                           @Company, @Designation, @Email, @LinkedIn, @Location, @Skill1, @About, @ImageUrl)";

                            SqlCommand cmdInsert = new SqlCommand(queryInsertCandidate, conn);
                            cmdInsert.Parameters.AddWithValue("@Name", name);
                            cmdInsert.Parameters.AddWithValue("@LastName", lastname);
                            cmdInsert.Parameters.AddWithValue("@Username", username);
                            cmdInsert.Parameters.AddWithValue("@Stream", stream);
                            cmdInsert.Parameters.AddWithValue("@Branch", branch);
                            cmdInsert.Parameters.AddWithValue("@BatchYear", batchYear);
                            cmdInsert.Parameters.AddWithValue("@College", college);
                            cmdInsert.Parameters.AddWithValue("@Company", company);
                            cmdInsert.Parameters.AddWithValue("@Designation", designation);
                            cmdInsert.Parameters.AddWithValue("@Email", email);
                            cmdInsert.Parameters.AddWithValue("@LinkedIn", linkedin);
                            cmdInsert.Parameters.AddWithValue("@Location", location);
                            cmdInsert.Parameters.AddWithValue("@Skill1", skill1);
                            cmdInsert.Parameters.AddWithValue("@About", about);
                            cmdInsert.Parameters.AddWithValue("@ImageUrl", imageUrl);

                            int rowsAffected = cmdInsert.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                Response.Write("<script>alert('Participation successful!');</script>");
                            }
                            else
                            {
                                Response.Write("<script>alert('Error: Unable to participate!');</script>");
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Error: Alumni details not found!');</script>");
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Catch any SQL or connection-related errors
                    Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                }
            }
        }
        protected void btnCheckResults_Click(object sender, EventArgs e)
        {
            // Redirect the student to the results page
            Response.Redirect("~/VOTE_RESULT.aspx");
        }
    }
}


