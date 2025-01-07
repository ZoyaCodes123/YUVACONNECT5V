using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI.WebControls;

namespace YuvaConnect
{
    public partial class VOTE_ADMIN : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                LoadCandidates();
            }
        }

        private void LoadCandidates()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;

            // Exclude candidates with the status "Rejected"
            string query = "SELECT CAND_ID, NAME, LASTNAME, STREAM, BRANCH, BATCH_YEAR, COALESCE(Status, 'Accepted') AS Status FROM CANDIDATE WHERE Status != 'Rejected'";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    RepeaterCandidates.DataSource = dt;
                    RepeaterCandidates.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }


        protected void RepeaterCandidates_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;

            if (e.CommandName == "Reject")
            {
                int candidateId = Convert.ToInt32(e.CommandArgument);

                // SQL Query to update the status of the candidate
                string updateQuery = "UPDATE CANDIDATE SET Status = 'Rejected' WHERE CAND_ID = @CAND_ID";

                try
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        SqlCommand cmd = new SqlCommand(updateQuery, conn);
                        cmd.Parameters.AddWithValue("@CAND_ID", candidateId);
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }

                    // Refresh the candidate list after updating the status
                    LoadCandidates();

                    // Notify the user about the successful status update
                    Response.Write("<script>alert('Candidate has been rejected successfully.');</script>");
                }
                catch (Exception ex)
                {
                    // Handle any errors
                    Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                }
            }
        }


        protected void btnToggleElection_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;

            // Queries to get the current states
            string electionQuery = "SELECT IS_ACTIVE FROM ELECTION WHERE ELECTION_ID = 1";
            string resultQuery = "SELECT ISDECLARED FROM RESULT WHERE RESULT_ID = 1";
            string updateElectionQuery = "UPDATE ELECTION SET IS_ACTIVE = @NewStatus WHERE ELECTION_ID = 1";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // Check if results are declared
                    SqlCommand resultCmd = new SqlCommand(resultQuery, conn);
                    bool isResultDeclared = Convert.ToBoolean(resultCmd.ExecuteScalar());

                    if (isResultDeclared)
                    {
                        Response.Write("<script>alert('Cannot activate elections while results are live.');</script>");
                        return;
                    }

                    // Get the current state of elections
                    SqlCommand electionCmd = new SqlCommand(electionQuery, conn);
                    bool isElectionActive = Convert.ToBoolean(electionCmd.ExecuteScalar());

                    // Toggle the value of IS_ACTIVE
                    bool newElectionStatus = !isElectionActive;

                    SqlCommand updateCmd = new SqlCommand(updateElectionQuery, conn);
                    updateCmd.Parameters.AddWithValue("@NewStatus", newElectionStatus ? 1 : 0);
                    updateCmd.ExecuteNonQuery();

                    // Notify the user about the updated status
                    string statusMessage = newElectionStatus ? "Elections are now active." : "Elections are now inactive.";
                    Response.Write($"<script>alert('{statusMessage}');</script>");
                }
            }
            catch (Exception ex)
            {
                // Handle any errors
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }


        protected void btnResultsToggle_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;

            // Queries to get the current states
            string resultQuery = "SELECT ISDECLARED FROM RESULT WHERE RESULT_ID = 1";
            string electionQuery = "SELECT IS_ACTIVE FROM ELECTION WHERE ELECTION_ID = 1";
            string updateResultQuery = "UPDATE RESULT SET ISDECLARED = @NewStatus, DECLARED_DATE = @DeclaredDate WHERE RESULT_ID = 1";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // Check if elections are active
                    SqlCommand electionCmd = new SqlCommand(electionQuery, conn);
                    bool isElectionActive = Convert.ToBoolean(electionCmd.ExecuteScalar());

                    if (isElectionActive)
                    {
                        Response.Write("<script>alert('Cannot declare results while elections are live.');</script>");
                        return;
                    }

                    // Get the current state of results
                    SqlCommand resultCmd = new SqlCommand(resultQuery, conn);
                    bool isResultDeclared = Convert.ToBoolean(resultCmd.ExecuteScalar());

                    // Toggle the value of ISDECLARED
                    bool newResultStatus = !isResultDeclared;

                    SqlCommand updateCmd = new SqlCommand(updateResultQuery, conn);
                    updateCmd.Parameters.AddWithValue("@NewStatus", newResultStatus ? 1 : 0);
                    updateCmd.Parameters.AddWithValue("@DeclaredDate", newResultStatus ? (object)DateTime.Now : DBNull.Value);
                    updateCmd.ExecuteNonQuery();

                    // Notify the user about the updated status
                    string statusMessage = newResultStatus ? "Results have been declared." : "Results are now undeclared.";
                    Response.Write($"<script>alert('{statusMessage}');</script>");
                }
            }
            catch (Exception ex)
            {
                // Handle any errors
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        protected void btnViewResults_Click(object sender, EventArgs e)
        {
            // Redirect to the VOTE_RESULT.aspx page
            Response.Redirect("VOTE_RESULT.aspx");
        }
    }
}
