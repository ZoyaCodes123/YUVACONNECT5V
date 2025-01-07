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
    public partial class WebForm5 : System.Web.UI.Page
    { 
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    SetVisibility();
                    BindEvent();
                }
            }
            private void BindEvent(string eventType = "", string searchTerm = "")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;
                string query = @"SELECT EVENT_ID, EVENT_NAME, STARTDATE, EVENT_TYPE, IMAGEURL FROM EVENTS WHERE 1 = 1";


                if (!string.IsNullOrEmpty(eventType))
                {
                    query += " AND EVENT_TYPE = @EventType";
                }

                if (!string.IsNullOrEmpty(searchTerm))
                {
                    query += " AND EVENT_NAME LIKE '%' + @SearchTerm + '%'";
                }

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        if (!string.IsNullOrEmpty(eventType))
                        {
                            cmd.Parameters.AddWithValue("@EventType", eventType);
                        }

                        if (!string.IsNullOrEmpty(searchTerm))
                        {
                            cmd.Parameters.AddWithValue("@SearchTerm", searchTerm);
                        }

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

            protected void btnSearch_Click(object sender, EventArgs e)
            {
                string selectedEventType = ddlBranch.SelectedValue;
                string searchTerm = txtSearch.Text.Trim();

                BindEvent(selectedEventType, searchTerm);
            }
            protected void ViewEvent_Command(object sender, CommandEventArgs e)
            {
                // Get the EVENT_ID from CommandArgument
                string eventId = e.CommandArgument.ToString();

                // Redirect to the EVENT_PROFILE page with EVENT_ID as a query parameter
                Response.Redirect($"EVENT_DETAILS.aspx?EVENT_ID={eventId}");
            }

            protected void addEvent_Click(object sender, EventArgs e)
            {
                Response.Redirect("NEW_EVENT.aspx");
            }

        private void SetVisibility()
        {
            // Retrieve the user's role from session
            string userRole = Session["UserRole"] as string;

            // If no user role is set, redirect to the login page
            if (string.IsNullOrEmpty(userRole))
            {
                Response.Redirect("~/LOGIN.aspx");
                return;
            }

            // Set visibility of Add Event button based on user role
            if (userRole.Equals("admin", StringComparison.OrdinalIgnoreCase))
            {
                Button1.Visible = true; // Show the Add Event button for admin
            }
            else
            {
                Button1.Visible = false; // Hide the Add Event button for students and alumni
            }
        }

    }
} 