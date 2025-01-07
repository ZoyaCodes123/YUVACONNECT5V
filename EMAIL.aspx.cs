using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YuvaConnect
{
    public partial class EMAIL : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            SendEmail();
        }
        protected void SendEmail()
        {
            string senderEmail = System.Configuration.ConfigurationManager.AppSettings["Email"];
            string emailPassword = System.Configuration.ConfigurationManager.AppSettings["EmailPassword"];
            string receiverEmail = "wallflower771@gmail.com";
            string mailBody = "We are glad to invite you on our platform YuvaConnect";


            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(senderEmail);
            mail.To.Add(receiverEmail);
            mail.Subject = "Registration Successful";
            mail.Body = mailBody;
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587)
            {
                Credentials = new NetworkCredential(senderEmail, emailPassword),
                EnableSsl = true,
                Timeout = 10000
            };


            try
            {
                smtp.Send(mail);
                Response.Write("Email sent successfully!");
            }
            catch (SmtpException ex)
            {
                Response.Write($"SMTP Error: {ex.StatusCode} - {ex.Message}<br>");
                if (ex.InnerException != null)
                {
                    Response.Write($"Inner Exception: {ex.InnerException.Message}<br>");
                }
                Response.Write($"Stack Trace: {ex.StackTrace}<br>");
            }
            catch (Exception ex)
            {
                Response.Write($"General Error: {ex.Message}<br>");
                Response.Write($"Stack Trace: {ex.StackTrace}<br>");
            }
        }

    }
}
     