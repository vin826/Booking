using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Booking
{
    public partial class AdminPage : System.Web.UI.Page
    {
        string connectString = "server=sql12.freesqldatabase.com;user=sql12597390;database=sql12597390;password=4GJ2JL9HDl;";
        DataTable data = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            if (IsValidUser() && IsValidPass())
            {
                loginTbl.Visible = false;
                controlTbl.Visible = true;
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

        protected void viewBtn_Click(object sender, EventArgs e)
        {
            dataPH.Visible = true;
            addTbl.Visible = false;
            deleteTbl.Visible = false;

            data.Clear();
            MySqlConnection bookingConnect = new MySqlConnection(connectString);
            bookingConnect.Open();
            string cmdStr = "SELECT * FROM bookingTBL;";
            MySqlCommand bookingCmd = new MySqlCommand(cmdStr, bookingConnect);
            MySqlDataReader bookingDR = bookingCmd.ExecuteReader();
            data.Load(bookingDR);

            StringBuilder tblOne = new StringBuilder();
            tblOne.Append("<table = border='1'");
            tblOne.Append("<tr><th>Booking ID</th><th>Full Name</th><th>Contact Number</th><th>Email Address</th><th>Date Booked</th>");
            tblOne.Append("</tr>");
            for (int i = 0; i < data.Rows.Count; i++)
            {
                tblOne.Append("<tr>");
                tblOne.Append("<td>" + data.Rows[i]["bookingID"].ToString() + "</td>");
                tblOne.Append("<td>" + data.Rows[i]["fullName"].ToString() + "</td>");
                tblOne.Append("<td>" + data.Rows[i]["contactNum"].ToString() + "</td>");
                tblOne.Append("<td>" + data.Rows[i]["email"].ToString() + "</td>");
                tblOne.Append("<td>" + data.Rows[i]["date"].ToString() + "</td>");
                tblOne.Append("</tr>");
            }
            dataPH.Controls.Add(new Literal { Text = tblOne.ToString() });
            bookingConnect.Close();
        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            dataPH.Visible = false;
            addTbl.Visible = true;
            deleteTbl.Visible = false;
            nameTxt.Text = string.Empty;
            numTxt.Text = string.Empty;
            emailTxt.Text = string.Empty;
            numValidate.Visible = false;
            emailValidate.Visible = false;
            bookConfirm.Visible = false;
        }

        protected void deleteBtn_Click(object sender, EventArgs e)
        {
            dataPH.Visible = false;
            addTbl.Visible = false;
            deleteTbl.Visible = true;
            deleteValidate.Visible = false;
            deleteConfirm.Visible = false;
        }

        protected void bookBtn_Click(object sender, EventArgs e)
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
                int randomID = rnd.Next(100000,10000000);
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

                cmdStr = $"INSERT INTO `bookingTBL`(`bookingID`,`fullName`, `contactNum`, `email`, `date`) VALUES ({randomID.ToString()},'{nameTxt.Text}','{numTxt.Text}','{emailTxt.Text}','{dateCal.SelectedDate.ToShortDateString()}');";
                bookingCmd = new MySqlCommand(cmdStr, bookingConnect);
                bookingCmd.ExecuteNonQuery();

                bookConfirm.Visible = true;
                bookingConnect.Close();
            }
            else
            {
                bookConfirm.Visible = false;
            }
        }

        protected void deleteBookingBtn_Click(object sender, EventArgs e)
        {
            if (IsValidID())
            {
                MySqlConnection bookingConnect = new MySqlConnection(connectString);
                bookingConnect.Open();
                string cmdStr = $"DELETE FROM `bookingTBL` WHERE `bookingID` = {deleteTxt.Text};";
                MySqlCommand bookingCmd = new MySqlCommand(cmdStr, bookingConnect);
                bookingCmd.ExecuteNonQuery();
                deleteConfirm.Visible = true;
                bookingConnect.Close();
            }
            else
            {
                deleteConfirm.Visible = false;
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

            if (dateCal.SelectedDate == DateTime.MinValue)
            {
                dateValidate.Text = "Please book a date";
                dateValidate.Visible = true;
                return false;
            }
            if (dateCal.SelectedDate < DateTime.Today)
            {
                dateValidate.Text = "Please book a valid date";
                dateValidate.Visible = true;
                return false;
            }
            if (existingDates.Contains(dateCal.SelectedDate.ToShortDateString()))
            {
                dateValidate.Text = "Date is unavailable";
                dateValidate.Visible = true;
                return false;
            }
            dateValidate.Visible = false;
            return true;
        }

        protected bool IsValidID()
        {
            MySqlConnection bookingConnect = new MySqlConnection(connectString);
            bookingConnect.Open();
            data.Clear();
            string cmdStr = "SELECT * FROM bookingTBL;";
            MySqlCommand bookingCmd = new MySqlCommand(cmdStr, bookingConnect);
            MySqlDataReader bookingDR = bookingCmd.ExecuteReader();
            data.Load(bookingDR);

            int[] existingID = new int[data.Rows.Count];
            for (int i = 0; i < data.Rows.Count; i++)
            {
                existingID[i] = Int32.Parse(data.Rows[i]["bookingID"].ToString());
            }

            try
            {
                if (existingID.Contains(Int32.Parse(deleteTxt.Text)))
                {
                    deleteValidate.Visible = false;
                    return true;
                }
            }
            catch
            {
                deleteValidate.Visible = true;
                return false;
            }
            
            deleteValidate.Visible = true;
            return false;
        }
    }
}