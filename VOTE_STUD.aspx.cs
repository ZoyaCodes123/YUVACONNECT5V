using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace YuvaConnect
{
    public partial class VOTE_STUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Any initialization logic can go here
            }
        }

        protected void btnCheckElections_Click(object sender, EventArgs e)
        {
            LoadCandidates();
        }

        private void LoadCandidates()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    // Query to fetch candidates if there is an active election
                    string query = @"
                IF EXISTS (SELECT 1 FROM ELECTION WHERE IS_ACTIVE = 1)
                BEGIN
                    SELECT C.CAND_ID, C.NAME, C.IMAGE_URL, C.COMPANY, C.EMAIL_ID, COALESCE(C.Status, 'Accepted') AS Status
                    FROM CANDIDATE C
                    WHERE C.Status != 'Rejected'
                END";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        rptCandidates.DataSource = dt;
                        rptCandidates.DataBind();
                        rptCandidates.Visible = true; // Show candidates
                        lblMessage.Visible = false;  // Hide previous messages
                    }
                    else
                    {
                        lblMessage.Text = "No active elections or candidates found.";
                        lblMessage.Visible = true;
                        rptCandidates.Visible = false; // Hide candidates
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.Visible = true;
                }
            }
        }

        protected void btnCheckResults_Click(object sender, EventArgs e)
        {
            // Redirect the student to the results page
            Response.Redirect("~/VOTE_RESULT.aspx");
        }

        protected void btnVote_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            // The Candidate ID is passed via CommandArgument
            int candidateId = Convert.ToInt32(e.CommandArgument);
            string studentUniqueId = Session["Student_ID"]?.ToString(); // Using Student_ID from session.

            if (string.IsNullOrEmpty(studentUniqueId))
            {
                lblMessage.Text = "Please log in to vote.";
                lblMessage.Visible = true;
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    // Retrieve the primary key ID of the student based on Student_ID
                    string getStudentIdQuery = "SELECT ID FROM STUDENT WHERE STUDENT_ID = @StudentUniqueId";
                    SqlCommand getStudentCmd = new SqlCommand(getStudentIdQuery, conn);
                    getStudentCmd.Parameters.AddWithValue("@StudentUniqueId", studentUniqueId);

                    object result = getStudentCmd.ExecuteScalar();
                    if (result == null)
                    {
                        lblMessage.Text = "Invalid student ID. Please log in again.";
                        lblMessage.Visible = true;
                        return;
                    }

                    int studentId = Convert.ToInt32(result);

                    // Check if the student has already voted
                    string checkVoteQuery = @"SELECT COUNT(*) FROM VOTE WHERE STUDENT_ID = @StudentId";
                    SqlCommand checkCmd = new SqlCommand(checkVoteQuery, conn);
                    checkCmd.Parameters.AddWithValue("@StudentId", studentId);

                    int voteCount = Convert.ToInt32(checkCmd.ExecuteScalar());
                    if (voteCount > 0)
                    {
                        lblMessage.Text = "You have already voted.";
                        lblMessage.Visible = true;
                        return;
                    }

                    // Insert the vote into the database
                    string insertVoteQuery = @"INSERT INTO VOTE (STUDENT_ID, CAND_ID) VALUES (@StudentId, @CandidateId)";
                    SqlCommand insertCmd = new SqlCommand(insertVoteQuery, conn);
                    insertCmd.Parameters.AddWithValue("@StudentId", studentId);
                    insertCmd.Parameters.AddWithValue("@CandidateId", candidateId);

                    int rowsAffected = insertCmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        lblMessage.Text = "Your vote has been successfully cast.";
                        lblMessage.Visible = true;
                    }
                    else
                    {
                        lblMessage.Text = "An error occurred while casting your vote. Please try again.";
                        lblMessage.Visible = true;
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.Visible = true;
                }
            }
        }
    }
}
