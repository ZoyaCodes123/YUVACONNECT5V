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
    public partial class LOGIN : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0; // No view is selected initially 
                ClearFieldsAndErrors(); // Clear fields and error labels on initial page load 
            }
        }

        // View switching
        protected void btnStudent_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1; // Switch to Student View 
            ClearFieldsAndErrors();
        }

        protected void btnAlumni_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2; // Switch to Alumni View 
            ClearFieldsAndErrors();
        }

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 3; // Switch to Admin View 
            ClearFieldsAndErrors();
        }

        // Login Handlers
        protected void btnStudentLogin_Click(object sender, EventArgs e)
        {
            if (CheckCredentials("STUDENT", "USERNAME", "PASSWORD", txtStudentUsername.Text, txtStudentPassword.Text, out string id))
            {
                Session["Student_ID"] = id;
                ViewState["exec_profile"] = "student";
                Session["UserRole"] = "student"; // Store role
                Response.Redirect("UPDATE_STUD.aspx");
            }
            else
            {
                lblStudentError.Text = "Invalid Student credentials.";
            }
        }

        protected void btnAlumniLogin_Click(object sender, EventArgs e)
        {
            if (CheckCredentials("ALUMNI", "USERNAME", "PASSWORD", txtAlumniUsername.Text, txtAlumniPassword.Text, out string id))
            {
                Session["Alumni_ID"] = id;
                Session["USERNAME"] = txtAlumniUsername.Text;
                ViewState["exec_profile"] = "alumni";
                Session["UserRole"] = "alumni"; // Store role
                Response.Redirect("UPDATE_ALUM.aspx");
            }
            else
            {
                lblAlumniError.Text = "Invalid Alumni credentials.";
            }
        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            if (ValidateAdmin(txtAdminEmail.Text.ToLower(), txtAdminPassword.Text, out string CLG_NAME, out string ADMIN_ID))
            {
                Session["ADMIN_ID"] = ADMIN_ID; // Store Admin ID correctly
                Session["UserRole"] = "admin"; // Store role
                Session["AdminCollegeName"] = CLG_NAME; // Store the admin's college name
                ViewState["exec_profile"] = "admin";
                Response.Redirect("UPDATE_ADM.aspx"); // Redirect to the admin's profile page
            }
            else
            {
                lblAdminError.Text = "Invalid Admin credentials.";
            }
        }


        // Admin Validation with College Name Retrieval
        private bool ValidateAdmin(string email, string password, out string CLG_NAME, out string ADMIN_ID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;
            CLG_NAME = null;
            ADMIN_ID = null;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT ADMIN_ID, CLG_NAME FROM ADMIN WHERE EMAIL = @Email AND PASSWORD = @Password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    ADMIN_ID = reader["ADMIN_ID"].ToString(); // Fetch the admin's ID
                    CLG_NAME = reader["CLG_NAME"].ToString(); // Fetch the admin's college name
                    return true;
                }
            }
            return false; // Return false if credentials are invalid
        }


        // General Credential Validation Method
        private bool CheckCredentials(string tableName, string usernameColumn, string passwordColumn, string username, string password, out string userId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;
            userId = null;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = $"SELECT {tableName}_ID FROM {tableName} WHERE {usernameColumn} = @Username AND {passwordColumn} = @Password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username.Trim());
                cmd.Parameters.AddWithValue("@Password", password.Trim());

                try
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        userId = reader[$"{tableName}_ID"].ToString();
                        return true;
                    }
                }
                catch (SqlException ex)
                {
                    Response.Write($"Database Error: {ex.Message}");
                }
            }
            return false; // Return false if no match found
        }

        // Clear all fields and error messages
        private void ClearFieldsAndErrors()
        {
            ClearStudentInputs();
            ClearAlumniInputs();
            ClearAdminInputs();
        }

        // Clear inputs and errors for Student
        private void ClearStudentInputs()
        {
            txtStudentUsername.Text = string.Empty;
            txtStudentPassword.Text = string.Empty;
            lblStudentError.Text = string.Empty;
        }

        // Clear inputs and errors for Alumni
        private void ClearAlumniInputs()
        {
            txtAlumniUsername.Text = string.Empty;
            txtAlumniPassword.Text = string.Empty;
            lblAlumniError.Text = string.Empty;
        }

        // Clear inputs and errors for Admin
        private void ClearAdminInputs()
        {
            txtAdminEmail.Text = string.Empty;
            txtAdminPassword.Text = string.Empty;
            lblAdminError.Text = string.Empty;
        }
    }
}
