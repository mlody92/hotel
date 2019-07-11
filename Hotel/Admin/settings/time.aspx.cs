using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.Admin.settings
{
    public partial class time : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var time = Convert.ToDouble(Application["czas"]);
            var rok1 = (int)Application["jednostka_czasu"] * 30 * 12;
            var miesiac1 = (int)Application["jednostka_czasu"] * 30;
            var dzien1 = (int)Application["jednostka_czasu"];
            var godzina1 = (int)Application["jednostka_czasu"] / 24;

            //var rok = Math.Floor(time / 518400) + 1;
            //var miesiac = Math.Floor((time - (Math.Floor(time / 518400) * 518400)) / 43200) + 1;
            //var dzien = Math.Floor((time - (Math.Floor(time / 43200) * 43200)) / 1440) + 1;
            //var godzina = Math.Floor((time - (Math.Floor(time / 1440) * 1440)) / 60);
            //var minuta = time - Math.Floor(time / 60) * 60;
            var rok = Math.Floor(time / rok1) + 1;
            var miesiac = wzorData(time, rok1, miesiac1);
            var dzien = wzorData(time, miesiac1, dzien1);
            var godzina = wzorCzas(time, dzien1, godzina1);

            ustawTextBox.Attributes.Add("placeholder", Application["jednostka_czasu"].ToString());
            rokTextBox.Attributes.Add("placeholder", rok.ToString());
            miesiacTextBox.Attributes.Add("placeholder", miesiac.ToString());
            dzienTextBox.Attributes.Add("placeholder", dzien.ToString());
            godzinaTextBox.Attributes.Add("placeholder", godzina.ToString());
            komunikatLabel.Visible = true;
            komunikatLabel.Text = " czas gry." + Application["czas"].ToString();
        }

        protected void changeTimeLinkButton_Click(object sender, EventArgs e)
        {
            checkTextBox();
        }

        protected String wzorData(Double czas, int j_w, int j)
        {
            var wynik = Math.Floor((czas - Math.Floor(czas / j_w) * j_w) / j) + 1;
            return wynik.ToString();
        }

        protected String wzorCzas(Double czas, int j_w, int j)
        {
            var wynik = Math.Floor((czas - Math.Floor(czas / j_w) * j_w) / j);
            return wynik.ToString();
        }

        private void checkTextBox()
        {
            Boolean flaga = true;
            int czas = 0;
            var rok1 = (int)Application["jednostka_czasu"] * 30 * 12;
            var miesiac1 = (int)Application["jednostka_czasu"] * 30;
            var dzien1 = (int)Application["jednostka_czasu"];
            var godzina1 = (int)Application["jednostka_czasu"] / 24;
            double time = Convert.ToDouble(Application["czas"]);
            if (ustawTextBox.Text == "")
            {
                ustawTextBox.Text = Application["jednostka_czasu"].ToString();
            }

            if (rokTextBox.Text == "")
            {
                rokTextBox.Text = (Math.Floor(time / rok1) + 1).ToString();
            }

            if (miesiacTextBox.Text == "")
            {
                miesiacTextBox.Text = wzorData(time,rok1,miesiac1).ToString();
            }


            if (dzienTextBox.Text == "")
            {
                dzienTextBox.Text = wzorData(time, miesiac1, dzien1).ToString();
            }


            if (godzinaTextBox.Text == "")
            {
                godzinaTextBox.Text = wzorCzas(time, dzien1, godzina1).ToString();
            }

            if (Int32.Parse(ustawTextBox.Text) > 86400 || Int32.Parse(ustawTextBox.Text) <= 0)
            {
                ustawLabel.Visible = true;
                ustawLabel.Text = "Podana wartość jest nieprawidłowa. Wartość może mieścić się w przedziale 1-86400.";
                flaga = false;
            }
            else
            {
                ustawLabel.Visible = false;
            }

            if (Int32.Parse(rokTextBox.Text) > 3500 || Int32.Parse(rokTextBox.Text) <= 0)
            {
                RokLabel.Visible = true;
                RokLabel.Text = "Podana wartość jest nieprawidłowa. Wartość może mieścić się w przedziale 1-3500.";
                flaga = false;
            }
            else
            {
                RokLabel.Visible = false;
                czas += (Int32.Parse(rokTextBox.Text) - 1) * rok1;
            }

            if (Int32.Parse(miesiacTextBox.Text) > 12 || Int32.Parse(miesiacTextBox.Text) <= 0)
            {
                miesiacLabel.Visible = true;
                miesiacLabel.Text = "Podana wartość jest nieprawidłowa. Wartość może mieścić się w przedziale 1-12.";
                flaga = false;
            }
            else
            {
                miesiacLabel.Visible = false;
                czas += (Int32.Parse(miesiacTextBox.Text) - 1) * miesiac1;
            }

            if (Int32.Parse(dzienTextBox.Text) > 31 || Int32.Parse(dzienTextBox.Text) <= 0)
            {
                dzienLabel.Visible = true;
                dzienLabel.Text = "Podana wartość jest nieprawidłowa. Wartość może mieścić się w przedziale 1-31.";
                flaga = false;
            }
            else
            {
                dzienLabel.Visible = false;
                czas += (Int32.Parse(dzienTextBox.Text) - 1) * dzien1;
            }

            if (Int32.Parse(godzinaTextBox.Text) > 24 || Int32.Parse(godzinaTextBox.Text) < 0)
            {
                godzinaLabel.Visible = true;
                godzinaLabel.Text = "Podana wartość jest nieprawidłowa. Wartość może mieścić się w przedziale 0-24.";
                flaga = false;
            }
            else
            {
                godzinaLabel.Visible = false;
                czas += Int32.Parse(godzinaTextBox.Text) * godzina1;
            }

            if (flaga == true)
            {
                Application["jednostka_czasu"] = Int32.Parse(ustawTextBox.Text);
                Application["czas"] = (int)czas;
                komunikatLabel.Visible = true;
                komunikatLabel.Text = "Poprawnie zmieniono czas gry." + Application["czas"].ToString();
            }
            else
            {
                komunikatLabel.Visible = true;
                komunikatLabel.Text = "Nie zmieniono czasu gry.";
            }
        }
    }
}