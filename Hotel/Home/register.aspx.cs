using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Hotel.Home
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["User_uprawnienie"] != null)
            {
                komunikatLabel.Visible = true;
                komunikatLabel.Text = Session["User_uprawnienie"] + " jesteś już zalogowany!";
                registerTable.Visible = false;
            }
            else
            {
                registerTable.Visible = true;
                if (!IsPostBack)
                {
                    FillCapctha();
                }
            }
        }
        void FillCapctha()
        {
            try
            {
                Random random = new Random();
                string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
                StringBuilder captcha = new StringBuilder();
                for (int i = 0; i < 6; i++)
                    captcha.Append(combination[random.Next(combination.Length)]);
                Session["captcha"] = captcha.ToString();
                imgCaptcha.ImageUrl = "GenerateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();
            }
            catch
            {
                throw;
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            FillCapctha();
        }

        protected void zarejestrujLinkButton_Click(object sender, EventArgs e)
        {
            if (checkData() == true)
            {
                zarejestruj(loginTextBox.Text, passwordTextBox.Text,imieTextBox.Text,nazwiskoTextBox.Text);
                komunikatLabel.Visible = true;
                komunikatLabel.Text = "Twoje konto zostało poprawnie utworzone!";
            }

        }

        protected void wyczyscLinkButton_Click(object sender, EventArgs e)
        {
            wyczyscDane();
        }

        private void wyczyscDane() {
            loginTextBox.Text = "";
            passwordTextBox.Text = "";
            repeatPasswordTextBox.Text = "";
            imieTextBox.Text = "";
            nazwiskoTextBox.Text = "";
            
        }

        private Boolean checkData()
        {
            Boolean fl = true;
            if (loginTextBox.Text == "") {
                Label1.Visible = true;
                fl = false;
            }
            else Label1.Visible = false;

            if (passwordTextBox.Text == "")
            {
                Label2.Visible = true;
                fl = false;
            }
            else Label2.Visible = false;

            if (repeatPasswordTextBox.Text == "")
            {
                Label3.Visible = true;
                fl = false;
            }
            else Label3.Visible = false;

            if (imieTextBox.Text == "")
            {
                Label4.Visible = true;
                fl = false;
            }
            else Label4.Visible = false;

            if (nazwiskoTextBox.Text == "")
            {
                Label5.Visible = true;
                fl = false;
            }
            else Label5.Visible = false;

            if (!fl == true) {
                return false;
            }

            if (Session["captcha"].ToString() != txtCaptcha.Text)
            {
                //Response.Write("Niepoprawny kod captcha");
                komunikatLabel.Text="Niepoprawny kod captcha";
                FillCapctha();
                wyczyscDane();

                return false;
            }
            if (!dostepnyLogin(loginTextBox.Text))
            {
                //Response.Write("Wybrany login jest zajęty");
                komunikatLabel.Text = "Wybrany login jest zajęty";
                FillCapctha();
                wyczyscDane();
                return false;
            }
            if (passwordTextBox.Text != repeatPasswordTextBox.Text)
            {
                Response.Write("Hasła nie są takie same");
                komunikatLabel.Text = "Hasła nie są takie same";
                FillCapctha();
                wyczyscDane();
                return false;
            }
            
            return true;
        }


        private void zarejestruj(string login, string password,string imie,string nazwisko)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("Insert into uzytkownik (login,password,imie,nazwisko,konto) Values(@login,@password,@imie,@nazwisko,@konto)", vid);
               
                xp.Parameters.AddWithValue("@login", login);
                xp.Parameters.AddWithValue("@password", new Hotel.tools.hash().CreateMD5(password));
                xp.Parameters.AddWithValue("@imie", imie);
                xp.Parameters.AddWithValue("@nazwisko", nazwisko);
                xp.Parameters.AddWithValue("@konto",  Application["ilosc_pieniedzy"].ToString());

                vid.Open();
                xp.ExecuteNonQuery();

                vid.Close();
            }
        }
        private bool dostepnyLogin(string login)
        {

            bool flaga = false;


            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("SELECT * FROM uzytkownik WHERE login=@login", user);

            sql.Parameters.AddWithValue("@login", login);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count == 0;

            return flaga;
        }
    }
}