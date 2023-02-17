using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Booking
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Submit_Click(object sender, EventArgs e)
        {
           
            if (Pass.Text == "ssss" && Address.Text=="ssss")
            {
                Response.Redirect("AdminPage.aspx");
            }
            else
            {
                Address.Text = "Username";
                Pass.Text = "";
            }
        }
    }
}