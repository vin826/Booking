using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Booking
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void redirectToBookNow(object sender, EventArgs e)
        {
            Response.Redirect("BookNow.aspx");
        }
        protected void Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}