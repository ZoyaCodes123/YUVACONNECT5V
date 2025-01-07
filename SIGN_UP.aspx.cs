using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace YuvaConnect
{
    public partial class SIGN_UP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                  
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Write("Redirecting to Student Signup Page...");
            Response.Redirect("~/STUDENT_SIGNUP.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ALUMNI_SIGNUP.aspx");
        }
    }
}
