using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YuvaConnect
{
    public partial class STUDENT_SIGNUP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindWizardSteps();
            }
        }


        protected void Wizard1_ActiveStepChanged(object sender, EventArgs e)
        {
            BindWizardSteps();
        }

        private void BindWizardSteps()
        {
            // Bind wizard step titles to the repeater
            List<string> steps = Wizard1.WizardSteps
                .Cast<WizardStep>()
                .Select(ws => ws.Title)
                .ToList();
            WizardStepsRepeater.DataSource = steps;
            WizardStepsRepeater.DataBind();
        }
        private void BindWizardSteps(object sender, WizardNavigationEventArgs e)
        {
            // Bind wizard step titles to the repeater
            List<string> steps = Wizard1.WizardSteps
                .Cast<WizardStep>()
                .Select(ws => ws.Title)
                .ToList();
            WizardStepsRepeater.DataSource = steps;
            WizardStepsRepeater.DataBind();
        }



        protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            btnSignup_Click(sender, e);
            Response.Redirect("~/LOGIN.aspx"); 
        }

        protected void WizardStepsRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            // Navigate to specific step when a step is clicked
            if (e.CommandName == "GoToStep")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                Wizard1.ActiveStepIndex = index;
                BindWizardSteps();
            }
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // SQL query for inserting student data
                string query = @"INSERT INTO NEW_STUDENT 
                (ENROLLMENT_NUMBER, NAME, LASTNAME, USERNAME, PASSWORD, STREAM, BRANCH, STARTING_YEAR, ENDING_YEAR, COLLEGE, EMAIL_ID, LINKEDIN_LINK, SKILL1, SKILL2, SKILL3, ABOUT, IMAGE_URL) 
                VALUES 
                (@enroll, @Name, @Lastname, @Username, @Password, @Stream, @Branch, @StartingYear, @EndingYear, @College, @Email, @LinkedIn, @Skill1, @Skill2, @Skill3, @About, @ImageUrl)";
                
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Add parameters for user input
                    cmd.Parameters.AddWithValue("@enroll", txtEnroll.Text);
                    cmd.Parameters.AddWithValue("@Name", txtFirstName.Text);
                    cmd.Parameters.AddWithValue("@Lastname", txtLastName.Text);
                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                    cmd.Parameters.AddWithValue("@Stream", txtStream.Text);
                    cmd.Parameters.AddWithValue("@Branch", txtBranch.Text);
                    cmd.Parameters.AddWithValue("@StartingYear", txtStartYear.Text);
                    cmd.Parameters.AddWithValue("@EndingYear", txtEndYear.Text);
                    cmd.Parameters.AddWithValue("@College", collegeName.SelectedValue);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@LinkedIn", txtLinkedIn.Text);
                    cmd.Parameters.AddWithValue("@Skill1", txtSkill1.Text);
                    cmd.Parameters.AddWithValue("@Skill2", txtSkill2.Text);
                    cmd.Parameters.AddWithValue("@Skill3", txtSkill3.Text);
                    cmd.Parameters.AddWithValue("@About", txtAbout.Text);
                    cmd.Parameters.AddWithValue("@ImageUrl", Image1.ImageUrl);

                    // Execute the query
                    cmd.ExecuteNonQuery();
                }

                con.Close();
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    // Folder for uploaded images
                    string uploadFolder = "~/Uploads/";
                    string serverFolderPath = Server.MapPath(uploadFolder);

                    // Ensure the folder exists
                    if (!Directory.Exists(serverFolderPath))
                    {
                        Directory.CreateDirectory(serverFolderPath);
                    }

                    // Create a unique file name
                    string fileName = Guid.NewGuid().ToString() + "_" + FileUpload1.FileName;
                    string filePath = Path.Combine(serverFolderPath, fileName);

                    // Save the uploaded file
                    FileUpload1.SaveAs(filePath);

                    // Set the Image control to preview the uploaded image
                    Image1.ImageUrl = uploadFolder + fileName;
                    lblmessage.Text = "Successfully Uploaded and Previewed!";
                }
                catch (Exception ex)
                {
                    // Handle errors
                    lblmessage.Text = $"Error: {ex.Message}";
                }
            }
            else
            {
                lblmessage.Text = "Please select a file to upload.";
            }
        }
        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                HiddenField1.Value = txtPassword.Text;
                txtPassword.TextMode = TextBoxMode.SingleLine;
            }
            else
            {
                txtPassword.TextMode = TextBoxMode.Password;
                if (!string.IsNullOrEmpty(HiddenField1.Value))
                {
                    txtPassword.Attributes["value"] = HiddenField1.Value;
                }
            }
        }
    }
}
