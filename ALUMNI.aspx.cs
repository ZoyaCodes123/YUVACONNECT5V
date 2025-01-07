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
    public partial class WebForm4 : System.Web.UI.Page 
        {
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    BindAlumni();
                }
            }

            private void BindAlumni(string location = "", string desgn = "", string searchTerm = "" , string searchTerm2 = "")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;
                string query = @"SELECT ALUMNI_ID, NAME, BRANCH, IMAGE_URL, COMPANY, DESIGNATION, LOCATION, SKILL1, SKILL2, SKILL3 
                             FROM ALUMNI WHERE 1 = 1";

                if (!string.IsNullOrEmpty(location))
                    query += " AND LOCATION = @LOCATION";

                if (!string.IsNullOrEmpty(desgn))
                    query += " AND DESIGNATION = @DESIGNATION";

                if (!string.IsNullOrEmpty(searchTerm))
                    query += " AND NAME LIKE '%' + @SearchTerm + '%'";

                if (!string.IsNullOrEmpty(searchTerm2))
                    query += " AND COMPANY LIKE '%' + @SearchTerm2 + '%'";

            using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        if (!string.IsNullOrEmpty(location))
                            cmd.Parameters.AddWithValue("@LOCATION", location);
                        if (!string.IsNullOrEmpty(desgn))
                            cmd.Parameters.AddWithValue ("@DESIGNATION", desgn);
                        if (!string.IsNullOrEmpty(searchTerm))
                            cmd.Parameters.AddWithValue("@SearchTerm", searchTerm); 
                        if (!string.IsNullOrEmpty(searchTerm2))
                            cmd.Parameters.AddWithValue("@SearchTerm2", searchTerm2);

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
                    string alumniID = e.CommandArgument.ToString();
                    Session["SelectedAlumniID"] = alumniID;
                    Response.Redirect("ALUMNI_PROFILE.aspx");
                }
            }
            protected void btnSearch_Click(object sender, EventArgs e)
            {
                string loc = location.SelectedValue;
                string desgn = ddlDesignation.SelectedValue;
                string searchTerm = searchInput.Text;
                string searchTerm2 = searchInput2.Text;
            BindAlumni(loc, desgn, searchTerm, searchTerm2);
            }
        }
    }
 