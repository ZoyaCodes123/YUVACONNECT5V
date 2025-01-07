using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

namespace YuvaConnect
{
    public partial class NEW_EVENT : System.Web.UI.Page
    {
        protected void AddEvent_Click(object sender, EventArgs e)
        {
            string eventName = TextBox1.Text;
            string stream = TextBox2.Text;
            string branch = TextBox3.Text;
            string location = TextBox4.Text;
            string info = TextBox5.Text;
            string startDate = TextBox6.Text;
            string endDate = TextBox7.Text;
            string startTime = TextBox8.Text;
            string endTime = TextBox9.Text; 
            string organizer_name = TextBox12.Text;
            string link = TextBox13.Text;
            string type = TextBox14.Text; 

            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = @"INSERT INTO EVENTS 
                            (EVENT_NAME, STREAM, BRANCH, LOCATION, INFO, STARTDATE, ENDDATE, STARTTIME, ENDTIME, ORGANIZER_NAME, LINK, ORGANIZER_TYPE, IMAGEURL)
                            VALUES 
                            (@EventName, @Stream, @Branch, @Location, @Info, @StartDate, @EndDate, @StartTime, @EndTime, @organizer_name, @link, @type, @ImageUrl)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@EventName", eventName);
                        cmd.Parameters.AddWithValue("@Stream", stream);
                        cmd.Parameters.AddWithValue("@Branch", branch);
                        cmd.Parameters.AddWithValue("@Location", location);
                        cmd.Parameters.AddWithValue("@Info", info);
                        cmd.Parameters.AddWithValue("@StartDate", Convert.ToDateTime(startDate));
                        cmd.Parameters.AddWithValue("@EndDate", Convert.ToDateTime(endDate));
                        cmd.Parameters.AddWithValue("@StartTime", TimeSpan.Parse(startTime));
                        cmd.Parameters.AddWithValue("@EndTime", TimeSpan.Parse(endTime)); 
                        cmd.Parameters.AddWithValue("@organizer_name", organizer_name);
                        cmd.Parameters.AddWithValue("@link", link);
                        cmd.Parameters.AddWithValue("@type", type);
                        cmd.Parameters.AddWithValue("@ImageUrl", Image1.ImageUrl); // Use the stored image URL

                        cmd.ExecuteNonQuery();
                    }
                }

                Response.Redirect("events.aspx");
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }


        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    string uploadFolder = "~/Uploads/";
                    string serverFolderPath = Server.MapPath(uploadFolder);

                    if (!Directory.Exists(serverFolderPath))
                    {
                        Directory.CreateDirectory(serverFolderPath);
                    }

                    string fileName = Guid.NewGuid().ToString() + "_" + FileUpload1.FileName;
                    string filePath = Path.Combine(serverFolderPath, fileName);

                    FileUpload1.SaveAs(filePath);

                    string imageUrl = uploadFolder + fileName;

                    // Set the Image control and store the URL in a hidden field
                    Image1.ImageUrl = imageUrl; 
                    lblmessage.Text = "Successfully Uploaded and Previewed!";
                }
                catch (Exception ex)
                {
                    lblmessage.Text = $"Error: {ex.Message}";
                }
            }
            else
            {
                lblmessage.Text = "Please select a file to upload.";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("EVENTS.aspx");
        }
    }
}
