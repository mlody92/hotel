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

namespace Hotel.Account
{
    public partial class userProfile : System.Web.UI.Page
    {
        Hotel.tools.uprawnienie tools = new Hotel.tools.uprawnienie();

        protected void Page_Load(object sender, EventArgs e)
        {
            tools.sprawdzDostep();
            new Hotel.tools.dane().odswiezDane();
            imieTextBox.Attributes.Add("placeholder", Session["User_imie"].ToString());
            nazwiskoTextBox.Attributes.Add("placeholder", Session["User_nazwisko"].ToString());
        }

        protected void ChangePassLinkButton_Click(object sender, EventArgs e)
        {
            checkBox();
            changeUserProfile(imieTextBox.Text, nazwiskoTextBox.Text);
        }

        private void changeUserProfile(String imie, String nazwisko)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE uzytkownik SET imie=@imie, nazwisko=@nazwisko WHERE id=" + Session["User_id"].ToString(), vid);
                xp.Parameters.AddWithValue("@imie", imie);
                xp.Parameters.AddWithValue("@nazwisko", nazwisko);
                vid.Open();
                xp.ExecuteNonQuery();

                vid.Close();

                if (IsPostBack)
                {
                    komunikatLabel.Text = ("Poprawnie zapisano zmiany.");
                    komunikatLabel.Visible = true;
                }
            }
        }

        private void checkBox()
        {
            if (imieTextBox.Text == "")
            {
                imieTextBox.Text = Session["User_imie"].ToString();
            }

            if (nazwiskoTextBox.Text == "")
            {
                nazwiskoTextBox.Text = Session["User_nazwisko"].ToString();
            }
        }
    }
}