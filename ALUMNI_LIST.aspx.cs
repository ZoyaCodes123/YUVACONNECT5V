using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace YuvaConnect
{
    public partial class ALUMNI_LIST : System.Web.UI.Page
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
                string query = "SELECT * FROM ALUMNI WHERE COLLEGE = @CollegeName"; // Filtering by college name
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
    }
}