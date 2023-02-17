using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Booking
{
    public partial class BookingPage : System.Web.UI.Page
    {
        string connectString = "server=sql12.freesqldatabase.com;user=sql12597390;database=sql12597390;password=4GJ2JL9HDl;";
        DataTable data = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void bookingBtn_Click(object sender, EventArgs e)
        {
            if (IsValidNum() && IsValidEmail() && IsValidDate())
            {
                MySqlConnection bookingConnect = new MySqlConnection(connectString);
                bookingConnect.Open();
                data.Clear();
                string cmdStr = "SELECT * FROM bookingTBL;";
                MySqlCommand bookingCmd = new MySqlCommand(cmdStr, bookingConnect);
                MySqlDataReader bookingDR = bookingCmd.ExecuteReader();
                data.Load(bookingDR);

                Random rnd = new Random();
                int randomID = rnd.Next(100000, 10000000);
                int[] existingID = new int[data.Rows.Count];
                for (int i = 0; i < data.Rows.Count; i++)
                {
                    existingID[i] = Int32.Parse(data.Rows[i]["bookingID"].ToString());
                }
                while (true)
                {
                    if (existingID.Contains(randomID))
                    {
                        randomID = rnd.Next(100000, 10000000);
                        continue;
                    }
                    break;
                }

                cmdStr = $"INSERT INTO `bookingTBL`(`bookingID`,`fullName`, `contactNum`, `email`, `date`) VALUES ({randomID.ToString()},'{nameTxt.Text}','{numTxt.Text}','{emailTxt.Text}','{bookingDate.SelectedDate.ToShortDateString()}');";
                bookingCmd = new MySqlCommand(cmdStr, bookingConnect);
                bookingCmd.ExecuteNonQuery();

                bookingConfirm.Visible = true;
                bookingConnect.Close();

                MailMessage clientMail = new MailMessage();
                SmtpClient clientOne = new SmtpClient("smtp.office365.com");
                clientMail.From = new MailAddress("kris.p.bacon2023@outlook.com", "Kris P. Bacon");
                clientMail.To.Add(emailTxt.Text);

                clientMail.Subject = "Preliminary Quote";
                clientMail.IsBodyHtml = true;
                clientMail.Body = $"Greetings {nameTxt.Text}!" +
                    $"<br><br>Thank you for booking South Country Garden. Your estimated cost is ₱{preQuoteTxt.Text}.";
                clientOne.EnableSsl = true;
                clientOne.Port = 587;
                clientOne.Credentials = new System.Net.NetworkCredential("kris.p.bacon2023@outlook.com", "SamplePassword123");
                clientOne.Send(clientMail);

                MailMessage scgMail = new MailMessage();
                SmtpClient clientTwo = new SmtpClient("smtp.office365.com");
                scgMail.From = new MailAddress("kris.p.bacon2023@outlook.com", "Kris P. Bacon");
                scgMail.To.Add("kris.p.bacon2023@outlook.com");

                scgMail.Subject = "New Client Booking";
                scgMail.IsBodyHtml = true;
                scgMail.Body = "Complete information on new client booking:<br><br>" +
                    $"<b>Full Name:</b> {nameTxt.Text}<br><b>Contact Number:</b> {numTxt.Text}<br>" +
                    $"<b>Booking Date:</b> {bookingDate.SelectedDate.ToLongDateString()}<br>" +
                    $"<b>Estimated Number of People:</b> {headCountTxt.Text}<br><b>Estimated Cost:</b> ₱{preQuoteTxt.Text}";
                clientTwo.EnableSsl = true;
                clientTwo.Port = 587;
                clientTwo.Credentials = new System.Net.NetworkCredential("kris.p.bacon2023@outlook.com", "SamplePassword123");
                clientTwo.Send(scgMail);
            }
            else
            {
                bookingConfirm.Visible = false;
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

        protected bool IsValidDate()
        {
            MySqlConnection bookingConnect = new MySqlConnection(connectString);
            bookingConnect.Open();
            data.Clear();
            string cmdStr = "SELECT * FROM bookingTBL;";
            MySqlCommand bookingCmd = new MySqlCommand(cmdStr, bookingConnect);
            MySqlDataReader bookingDR = bookingCmd.ExecuteReader();
            data.Load(bookingDR);
            bookingConnect.Close();

            string[] existingDates = new string[data.Rows.Count];
            for (int i = 0; i < data.Rows.Count; i++)
            {
                existingDates[i] = data.Rows[i]["date"].ToString();
            }

            if (bookingDate.SelectedDate == DateTime.MinValue)
            {
                dateValidate.Text = "Please book a date";
                dateValidate.Visible = true;
                return false;
            }
            if (bookingDate.SelectedDate < DateTime.Today)
            {
                dateValidate.Text = "Please book a valid date";
                dateValidate.Visible = true;
                return false;
            }
            if (existingDates.Contains(bookingDate.SelectedDate.ToShortDateString()))
            {
                dateValidate.Text = "Date is unavailable";
                dateValidate.Visible = true;
                return false;
            }
            dateValidate.Visible = false;
            return true;
        }

        protected void headCountTxt_TextChanged(object sender, EventArgs e)
        {
            int preQuote = Int32.Parse(headCountTxt.Text) * 1000;
            preQuoteTxt.Text = preQuote.ToString();
        }
    }
}