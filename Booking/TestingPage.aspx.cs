using System;
using System.Data;
using System.Data.OleDb;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using MySqlConnector;

namespace Booking
{
    public partial class TestingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //OleDbConnection bookingConnect = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12597390"));
            string connectionString = "server=sql12.freesqldatabase.com;user=sql12597390;database=sql12597390;password=4GJ2JL9HDl;";
            MySqlConnection mySqlConnection = new MySqlConnection(connectionString);
            mySqlConnection.Open();
            string outputStr = $"SELECT * FROM bookingTBL;";
            MySqlCommand mySqlCommand = new MySqlCommand(outputStr,mySqlConnection);
            //mySqlCommand.ExecuteReader();
            var reader = mySqlCommand.ExecuteReader();
            while (reader.Read())
            {
                output.Text = reader[1].ToString();
            }
            //output.Text = ;
        }
    }
}