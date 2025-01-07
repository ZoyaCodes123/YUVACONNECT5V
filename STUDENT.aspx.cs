using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace YuvaConnect
{
    public partial class STUDENT : System.Web.UI.Page
    { 
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    BindStudents();
                }
            }

            private void BindStudents(string branch = "", string strm = "", string skill = "", string searchTerm = "")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;
                string query = "SELECT STUDENT_ID, NAME, BRANCH, STREAM, SKILL1, SKILL2, SKILL3, IMAGE_URL FROM STUDENT WHERE 1=1";

            if (!string.IsNullOrEmpty(branch))
                query += " AND BRANCH = @Branch";

            if (!string.IsNullOrEmpty(skill))
                query += " AND SKILL1 LIKE '%' + @Skill + '%'";

            if (!string.IsNullOrEmpty(searchTerm))
                query += " AND NAME LIKE '%' + @SearchTerm + '%'";

            if (!string.IsNullOrEmpty(strm))
                query += " AND STREAM = @Stream"; 

            using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                    if (!string.IsNullOrEmpty(branch))
                        cmd.Parameters.AddWithValue("@Branch", branch);
                    if (!string.IsNullOrEmpty(strm))
                        cmd.Parameters.AddWithValue("@Stream", strm);
                    if (!string.IsNullOrEmpty(skill))
                        cmd.Parameters.AddWithValue("@Skill", skill);
                    if (!string.IsNullOrEmpty(searchTerm))
                        cmd.Parameters.AddWithValue("@SearchTerm", searchTerm);

                        con.Open();
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            Repeater1.DataSource = dt;
                            Repeater1.DataBind();
                        }
                    }
                }
            }

            protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    DataRowView drv = e.Item.DataItem as DataRowView;
                    string skillsHtml = "";

                    if (!string.IsNullOrEmpty(drv["SKILL1"].ToString()))
                        skillsHtml += $"<span class='skill-button'>{drv["SKILL1"]}</span>";
                    if (!string.IsNullOrEmpty(drv["SKILL2"].ToString()))
                    skillsHtml += $"<span class='skill-button'>{drv["SKILL2"]}</span>";
                    if (!string.IsNullOrEmpty(drv["SKILL3"].ToString()))
                    skillsHtml += $"<span class='skill-button'>{drv["SKILL3"]}</span>";

                Literal skillsLiteral = e.Item.FindControl("SkillsLiteral") as Literal;
                    if (skillsLiteral != null)
                    {
                        skillsLiteral.Text = skillsHtml;
                    }
                }
            }

            protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
            {
                if (e.CommandName == "Select")
                {
                    string studentID = e.CommandArgument.ToString();
                    Session["SelectedStudentID"] = studentID;
                    Response.Redirect("STUDENT_PROFILE.aspx");
                }
            }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string strm = ddlStreams.SelectedValue;
            string branch = ddlBranches.SelectedValue;
            string skill = searcgSkill.Text;
            string searchTerm = searchInput.Text; 
            BindStudents(branch,strm,skill,searchTerm);
        }
    }

    }
 