using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Booking
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            if (IsValidUser() && IsValidPass())
            {
                loginTbl.Visible = false;
            }
        }
        protected bool IsValidUser()
        {
            if (userTxt.Text.ToLower() == "username")
            {
                userValidate.Visible = false;
                return true;
            }
            userValidate.Visible = true;
            return false;
        }
        protected bool IsValidPass()
        {
            if (passTxt.Text.ToLower() == "password")
            {
                passValidate.Visible = false;
                return true;
            }
            passValidate.Visible = true;
            return false;
        }
    }
}