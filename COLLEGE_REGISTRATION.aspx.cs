using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YuvaConnect
{
    public partial class COLLEGE_REGISTRATION : System.Web.UI.Page 
        {
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    BindWizardSteps(); 
                }
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

            protected void Wizard1_ActiveStepChanged(object sender, EventArgs e)
            {
                BindWizardSteps();
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
            protected void btnupload_Click(object sender, EventArgs e)
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
                        lblimg_message1.Text = "Image file successfully uploaded and previewed!";
                    }
                    catch (Exception ex)
                    {
                        // Handle errors
                        lblimg_message1.Text = $"Error: {ex.Message}";
                    }
                }
            }

            protected void checkadm_pass_CheckedChanged(object sender, EventArgs e)
            {
                if (checkadm_pass.Checked)
                {
                    txtadm_pass.TextMode = TextBoxMode.SingleLine;
                    HiddenField1.Value = txtadm_pass.Text;
                }
                else
                {
                    txtadm_pass.TextMode = TextBoxMode.Password;
                    if (!string.IsNullOrEmpty(HiddenField1.Value))
                    {
                        txtadm_pass.Attributes["value"] = HiddenField1.Value;
                    }
                }
            }

            protected void btnadm_img_Click(object sender, EventArgs e)
            {
                if (FileUpload2.HasFile)
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
                        string fileName = Guid.NewGuid().ToString() + "_" + FileUpload2.FileName;
                        string filePath = Path.Combine(serverFolderPath, fileName);

                        // Save the uploaded file
                        FileUpload2.SaveAs(filePath);

                        // Set the Image control to preview the uploaded image
                        adm_profile.ImageUrl = uploadFolder + fileName;
                        lblimg_message2.Text = "Image file successfully uploaded and previewed!";
                    }
                    catch (Exception ex)
                    {
                        // Handle errors
                        lblimg_message2.Text = $"Error: {ex.Message}";
                    }
                }
            }

            protected void Wizard1_FinishButtonClick1(object sender, WizardNavigationEventArgs e)
            {
                string connectString = ConfigurationManager.ConnectionStrings["YUVA_CONNECTConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(connectString);

                string query1 = "INSERT INTO COLLEGE VALUES (@clgname,@website,@address,@imgUrl)";
                string query2 = "INSERT INTO ADMIN VALUES(@admname,@admmail,@admpass,@admclg,@admimgUrl)";
                SqlCommand cmd = new SqlCommand(query1, conn);

                try
                {
                    conn.Open();
                    cmd.Parameters.AddWithValue("@clgname", txtclgname.Text); 
                    cmd.Parameters.AddWithValue("@website", txtclg_web.Text);
                    cmd.Parameters.AddWithValue("@address", txtclg_address.Text);
                    cmd.Parameters.AddWithValue("@imgUrl", Image1.ImageUrl);
                    cmd.ExecuteNonQuery();

                    cmd.CommandText = query2;
                    cmd.Parameters.AddWithValue("@admname", txtadm_name.Text);
                    cmd.Parameters.AddWithValue("@admmail", txtadm_email.Text);
                    cmd.Parameters.AddWithValue("@admpass", txtadm_pass.Text);
                    cmd.Parameters.AddWithValue("@admclg", txtclgname.Text);
                    cmd.Parameters.AddWithValue("@admimgUrl", adm_profile.ImageUrl);
                    cmd.ExecuteNonQuery();

                    lblmessage.Text = "Details registered successfully!";
                    lblmessage.ForeColor = Color.DarkGreen;
                Response.Redirect("LOGIN/aspx");
                }
                catch (Exception ex)
                {
                    lblmessage.Text = "Registration Failed";
                    lblmessage.ForeColor = Color.Maroon;
                    Response.Write($"Error: {ex.Message}");
                }
                finally
                {
                    conn.Close();
                }
            }
        }
    }
