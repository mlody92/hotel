using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.Admin.pracownicy
{
    public partial class addWorker : System.Web.UI.Page
    {
        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void zatwierdzLinkButton_Click(object sender, EventArgs e)
        {
            if (checkBox() == true)
            {
                tools.addPracownik(stanowiskoTextBox.Text, pensjaMinTextBox.Text,pensjaTextBox.Text,iloscTextBox.Text);
                komunikatLabel.Text = ("Poprawnie dodano pracownika.");
                komunikatLabel.Visible = true;
            }
        }

        private Boolean checkBox()
        {
            Boolean flaga = true;
           
            if (stanowiskoTextBox.Text == "")
            {
                stanowiskoLabel.Text = "Pole stanowisko nie może być puste.";
                stanowiskoLabel.Visible = true;
                flaga = false;
            }
            else stanowiskoLabel.Visible = false;

            if (pensjaMinTextBox.Text == "")
            {
                pensjaMinLabel.Text = "Pole pensja minimalna nie może być puste.";
                pensjaMinLabel.Visible = true;
                flaga = false;
            }
            else pensjaMinLabel.Visible = false;

            if (pensjaTextBox.Text == "")
            {
                pensjaMinLabel.Text = "Pole średnia pensja zatrudnienia nie może być puste.";
                pensjaMinLabel.Visible = true;
                flaga = false;
            }
            else pensjaMinLabel.Visible = false;

            if (iloscTextBox.Text == "")
            {
                iloscLabel.Text = "Pole ilość pokojów/atrakcji nie może być puste.";
                iloscLabel.Visible = true;
                flaga = false;
            }
            else iloscLabel.Visible = false;

            return flaga;
        }
    }
}