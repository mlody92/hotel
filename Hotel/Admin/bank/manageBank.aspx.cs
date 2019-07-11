using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.bank
{
    public partial class addBank : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            aktualnieLabel.Text = Application["Max_pozyczka"].ToString();
        }

        protected void zatwierdzLinkButton_Click(object sender, EventArgs e)
        {
            if (checkBox() == true)
            {
                Application["Max_pozyczka"] = Int32.Parse(kwotaTextBox.Text);
                komunikatLabel.Text = ("Poprawnie zmieniono dane.");
                komunikatLabel.Visible = true;
                kwotaTextBox.Text = "";

            }
        }

        private Boolean checkBox()
        {
            Boolean flaga = true;
            if (kwotaTextBox.Text == "")
            {
                kwotaLabel.Text = "Pole kwota nie może być puste.";
                kwotaLabel.Visible = true;
                flaga = false;
            }
            else kwotaLabel.Visible = false;
            return flaga;
        }
    }
}