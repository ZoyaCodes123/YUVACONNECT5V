using System;
using System.Configuration;
using System.Data.SqlClient;

namespace YuvaConnect
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetSidebarVisibility();
                LoadUserProfile();
            }
        }

        private void SetSidebarVisibility()
        {
            // Get the user role from session
            string userRole = Session["UserRole"] as string;

            if (string.IsNullOrEmpty(userRole))
            {
                Response.Redirect("~/LOGIN.aspx");
                return;
            }

            // Default: Hide all items
            liProfileStud.Visible = false;
            liProfileAlum.Visible = false;
            liProfileAdm.Visible = false;
            liAlumni.Visible = false;
            liAlumniList.Visible = false;
            liStudentList.Visible = false;
            liStudent.Visible = false;
            liEvents.Visible = false;
            liStudentRequests.Visible = false;
            liAlumniRequests.Visible = false;
            liVoteStudent.Visible = false;
            liVoteAlumni.Visible = false;
            liVoteAdmin.Visible = false;

            liReport.Visible = false;
            liLogout.Visible = false;

            // Role-specific visibility
            if (userRole.Equals("student", StringComparison.OrdinalIgnoreCase))
            {
                liProfileStud.Visible = true;
                liAlumni.Visible = true;
                liEvents.Visible = true;
                liReport.Visible = true;
                liVoteStudent.Visible = true;
                liLogout.Visible = true;
            }
            else if (userRole.Equals("alumni", StringComparison.OrdinalIgnoreCase))
            {
                liProfileAlum.Visible = true;
                liAlumni.Visible = true;
                liStudent.Visible = true;
                liEvents.Visible = true;
                liReport.Visible = true;
                liVoteAlumni.Visible = true;
                liLogout.Visible = true;
            }
            else if (userRole.Equals("admin", StringComparison.OrdinalIgnoreCase))
            {
                liProfileAdm.Visible = true;
                liStudentList.Visible = true;
                liAlumniList.Visible = true;
                liEvents.Visible = true;
                liStudentRequests.Visible = true;
                liReport.Visible = true;
                liAlumniRequests.Visible = true;
                liVoteAdmin.Visible = true;
                liLogout.Visible = true;
            }
        }

        private void LoadUserProfile()
        {
            if (Session["UserRole"] == null || Session["Student_ID"] == null && Session["Alumni_ID"] == null && Session["ADMIN_ID"] == null)
            {
                Response.Redirect("~/LOGIN.aspx");
                return;
            }

            string userRole = Session["UserRole"].ToString();
            string userId = string.Empty;

            if (userRole.Equals("student", StringComparison.OrdinalIgnoreCase) && Session["Student_ID"] != null)
            {
                userId = Session["Student_ID"].ToString();
                FetchUserDetails("STUDENT", userId);
            }
            else if (userRole.Equals("alumni", StringComparison.OrdinalIgnoreCase) && Session["Alumni_ID"] != null)
            {
                userId = Session["Alumni_ID"].ToString();
                FetchUserDetails("ALUMNI", userId);
            }
            else if (userRole.Equals("admin", StringComparison.OrdinalIgnoreCase) && Session["ADMIN_ID"] != null)
            {
                userId = Session["ADMIN_ID"].ToString();
                FetchUserDetails("ADMIN", userId);
            }
        }

        private void FetchUserDetails(string tableName, string userId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = $"SELECT NAME, IMAGE_URL FROM {tableName} WHERE {tableName}_ID = @UserId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        Name.Text = reader["NAME"].ToString();
                        ProfileImage.ImageUrl = reader["IMAGE_URL"].ToString(); 
                    }
                }
                catch (SqlException ex)
                {
                    Response.Write($"Database Error: {ex.Message}");
                }
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear the session
            Session.Clear();
            Session.Abandon();

            // Remove authentication cookies if any
            if (Request.Cookies["ASP.NET_SessionId"] != null)
            {
                Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddDays(-1);
            }
            if (Request.Cookies["AuthCookie"] != null)
            {
                Response.Cookies["AuthCookie"].Expires = DateTime.Now.AddDays(-1);
            }

            // Redirect to the login page
            Response.Redirect("~/LOGIN.aspx");
        }
    }
}
