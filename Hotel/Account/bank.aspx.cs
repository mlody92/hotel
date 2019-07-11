using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.Account
{
    public partial class bank : System.Web.UI.Page
    {
        Hotel.tools.tools tools = new Hotel.tools.tools();
        Hotel.tools.dane dane = new Hotel.tools.dane();


        int[,] kredyt = new int[6, 2] { 
            { 6, 20 }, 
            { 12, 17 }, 
            { 36, 15 }, 
            { 60, 12 }, 
            { 120, 10 }, 
            { 180, 7 } 
        };

        protected void Page_Load(object sender, EventArgs e)
        {

            String[] dane = new String[3];
            maxLabel.Text = Application["Max_pozyczka"].ToString() + " $";
            if (Session["User_id"] != null)
            {
                dane = tools.pobierzKredyt(Int32.Parse(Session["User_id"].ToString()));
                sumaLabel.Text = dane[0].ToString() + " $";
                allSqlDataSource.SelectParameters.Add("id_uzytkownika", Session["User_id"].ToString());
            }
        }

        protected void zatwierdzLinkButton_Click(object sender, EventArgs e)
        {
            String[] dane = new String[3];
            if (numerDropDownList.SelectedItem.Value != "-1")
            {
                if (Int32.Parse(iloscTextBox.Text) > 0 && Int32.Parse(iloscTextBox.Text) < (int)Application["Max_pozyczka"])
                {
                    dane = tools.pobierzKredyt(Int32.Parse(Session["User_id"].ToString()));
                    int suma = Int32.Parse(dane[0]) + Int32.Parse(iloscTextBox.Text);
                    if (suma < (int)Application["Max_pozyczka"])
                    {
                        int kwota = Int32.Parse(iloscTextBox.Text);
                        int a = kredyt[(Int32.Parse(numerDropDownList.SelectedItem.Value) - 1), 0];
                        int b = kredyt[(Int32.Parse(numerDropDownList.SelectedItem.Value) - 1), 1];
                        int czas = kredyt[Int32.Parse(numerDropDownList.SelectedItem.Value) - 1, 0];
                        double odsetkiD = Math.Ceiling((double)kwota / (double)czas * (100 + (double)(kredyt[(Int32.Parse(numerDropDownList.SelectedItem.Value) - 1), 1])) / 100);
                        int odsetki = Convert.ToInt32(odsetkiD);
                        tools.wezKredyt(kwota, odsetki, czas, Session["User_id"].ToString());
                        Response.Redirect(Request.RawUrl);
                        komunikatLabel.Visible = true;
                        komunikatLabel.Text = "Poprawnie wzięto kredyt.";
                    }
                    else
                    {
                        komunikatLabel.Visible = true;
                        komunikatLabel.Text = "Suma Twoich pożyczek przekracza dozwoloną ilość.";
                    }

                }
                else
                {
                    komunikatLabel.Visible = true;
                    komunikatLabel.Text = "Możliwy przedział kredytu 0-"+(int)Application["Max_pozyczka"]+" $";
                }
            }
            else
            {
                komunikatLabel.Visible = true;
                komunikatLabel.Text = "Wybierz numer pożyczki";
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            tools.zyskDzienny();
         //   tools.splacanieRat();
        }
    }
}