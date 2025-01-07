using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YuvaConnect
{
    public partial class VOTE_RESULT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string userRole = GetUserRole(); // Assume a method to determine the user's role
                if (userRole == "admin")
                {
                    pnlAdminView.Visible = true;
                    LoadAdminResults();
                }
                else if (userRole == "student" || userRole == "alumni")
                {
                    pnlStudentView.Visible = true;
                    CheckAndLoadResults();
                }
            }
        }

        private void LoadAdminResults()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;
            string query = @"
            SELECT C.NAME + ' ' + C.LASTNAME AS CandidateName, COUNT(V.VOTE_ID) AS VoteCount
            FROM VOTE V
            INNER JOIN CANDIDATE C ON V.CAND_ID = C.CAND_ID
            GROUP BY C.CAND_ID, C.NAME, C.LASTNAME
            ORDER BY VoteCount DESC";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvResults.DataSource = dt;
                gvResults.DataBind();
            }
        }

        private void CheckAndLoadResults()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;
            string checkQuery = "SELECT ISDECLARED FROM RESULT";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(checkQuery, conn);
                conn.Open();
                int isDeclared = Convert.ToInt32(cmd.ExecuteScalar());

                if (isDeclared == 1)
                {
                    LoadStudentResults();
                }
                else
                {
                    lblWinner.Text = "Results are not declared yet.";
                }
            }
        }

        private void LoadStudentResults()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;
            string query = @"
            SELECT TOP 1 C.NAME + ' ' + C.LASTNAME AS WinnerName, COUNT(V.VOTE_ID) AS VoteCount
            FROM VOTE V
            INNER JOIN CANDIDATE C ON V.CAND_ID = C.CAND_ID
            GROUP BY C.CAND_ID, C.NAME, C.LASTNAME
            ORDER BY VoteCount DESC";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        string winnerName = reader["WinnerName"].ToString();
                        int voteCount = Convert.ToInt32(reader["VoteCount"]);
                        lblWinner.Text = $"Winner: {winnerName} with {voteCount} votes!";
                    }
                }
            }
        }

        private string GetUserRole()
        {
            if (Session["UserRole"] == null)
            {
                throw new InvalidOperationException("User role is not defined.");
            }
            return Session["UserRole"].ToString();
        }

    }
}

