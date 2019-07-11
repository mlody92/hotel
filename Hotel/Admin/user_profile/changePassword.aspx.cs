using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace Hotel.Admin.user_profile
{
    public partial class changePassword : System.Web.UI.Page
    {

        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        protected void Page_Load(object sender, EventArgs e)
        {
            tools.sprawdzDostep();
        }

        protected void ChangePassLinkButton_Click(object sender, EventArgs e)
        {
            if (checkBox() == true)
            {
                if (checkCurrentPassword(currPassTextBox.Text) == true)
                {
                    changePass(newTextBox.Text);
                }
                else komunikatLabel.Text = "Aktualne hasło nie jest prawidłowe.";
            }
        }

        private void changePass(String newPassword)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE uzytkownik SET password=@password WHERE id="+Session["Admin_id"].ToString(), vid);
                xp.Parameters.AddWithValue("@password",new Hotel.tools.hash().CreateMD5(newPassword));
                vid.Open();
                xp.ExecuteNonQuery();

                vid.Close();

                if (IsPostBack)
                {
                    komunikatLabel.Text = ("Poprawnie zmieniono hasło.");
                }
            }
        }

        private Boolean checkBox()
        {
            Boolean flaga = true;
            if (currPassTextBox.Text == "")
            {
                currLabel.Text = "Pole aktualne hasło nie może być puste.";
                currLabel.Visible = true;
                flaga = false;
            }
            else currLabel.Visible = false;

            if (newTextBox.Text == "")
            {
                newLabel.Text = "Pole nowe hasło nie może być puste.";
                newLabel.Visible = true;
                flaga = false;
            }
            else newLabel.Visible = false;

            if (repeatNewTextBox.Text == "")
            {
                repeatNewLabel.Text = "Pole powtórzenie nowego hasła nie może być puste.";
                repeatNewLabel.Visible = true;
                flaga = false;
            }
            else repeatNewLabel.Visible = false;

            if (newTextBox.Text != repeatNewTextBox.Text)
            {
                repeatNewLabel.Text = "Nowe hasła nie są takie same.";
                repeatNewLabel.Visible = true;
                flaga = false;
            }
            else repeatNewLabel.Visible = false;
            return flaga;
        }

        private bool checkCurrentPassword(string password)
        {
            bool flagaLogin = false;
            bool flaga = false;

            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("SELECT * FROM uzytkownik WHERE login=@login", user);

            sql.Parameters.AddWithValue("@login", Session["Admin_login"].ToString());
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flagaLogin = dataSet.Tables[0].Rows.Count > 0;
            if (flagaLogin.Equals(true))
            {
                if (dataSet.Tables[0].Rows[0]["password"].ToString() == new Hotel.tools.hash().CreateMD5(password))
                {
                    flaga = true;
                }
            }
            return flaga;
        }

        
    }
}