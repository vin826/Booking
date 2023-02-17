using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Booking
{
    public partial class BookNow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void bookingBtn_Click(object sender, EventArgs e)
        {
            if (IsValidNum() && IsValidEmail())
            {
                //qwq
            }
        }

        protected bool IsValidNum()
        {
            string contactNum = numTxt.Text;
            if (contactNum.Length == 11 && long.TryParse(contactNum, out long i) && contactNum[0] == '0')
            {
                numValidate.Visible = false;
                return true;
            }
            numValidate.Visible = true;
            return false;
        }

        protected bool IsValidEmail()
        {
            string emailAdd = emailTxt.Text;
            if (emailAdd.Contains("@") && emailAdd.EndsWith(".com"))
            {
                emailValidate.Visible = false;
                return true;
            }
            emailValidate.Visible = true;
            return false;
        }

        protected void bookingDate_SelectionChanged(object sender, EventArgs e)
        {

        }
    }
}