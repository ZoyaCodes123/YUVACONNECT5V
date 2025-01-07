using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Net.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YuvaConnect
{
    public partial class EVENT_DETAILS : System.Web.UI.Page
    { 
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    // extract event id from query string
                    string eventID = Request.QueryString["EVENT_ID"];
                    // pass eventid as a parameter
                    LoadEventDetails(eventID);
                }
            }
            private void LoadEventDetails(string para_id)
            {
                string connectString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(connectString);

                // using eventid to narrow down the data
                string query = "SELECT * FROM EVENTS WHERE EVENT_ID=@id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", para_id);

                SqlDataAdapter adapt = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                try
                {
                    conn.Open();
                    adapt.Fill(dt);
                    event_img.ImageUrl = dt.Rows[0]["IMAGEURL"].ToString();
                    lblevent_name.Text = dt.Rows[0]["EVENT_NAME"].ToString();
                    lblstream.Text = dt.Rows[0]["STREAM"].ToString();
                    lblbranch.Text = dt.Rows[0]["BRANCH"].ToString();
                    lblinfo.Text = dt.Rows[0]["INFO"].ToString();

                    DateTime startDate = Convert.ToDateTime(dt.Rows[0]["STARTDATE"]);
                    lblstart_day.Text = startDate.ToString("dd MMM yyyy, dddd");
                    DateTime endDate = Convert.ToDateTime(dt.Rows[0]["ENDDATE"]);
                    lblend_day.Text = endDate.ToString("dd MMM yyyy, dddd");
                    TimeSpan startTime = (TimeSpan)dt.Rows[0]["STARTTIME"];
                    lblstart_time.Text = startTime.ToString(@"hh\:mm");
                    TimeSpan endTime = (TimeSpan)dt.Rows[0]["ENDTIME"];
                    lblend_time.Text = endTime.ToString(@"hh\:mm");

                    lblvenue.Text = dt.Rows[0]["LOCATION"].ToString();
                    lbllink.Text = dt.Rows[0]["LINK"].ToString();

            }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
                finally
                {
                    conn.Close();
                }
            }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("EVENTS.aspx");
        }
    } 
}