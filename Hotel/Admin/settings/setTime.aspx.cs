using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.Admin.settings
{
    public partial class setTime : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int czasTmp=Int32.Parse(Application["status_gry_przez"].ToString())/60;
            minutLabel.Text = "Pozostało: "+czasTmp+" minut";
        }

        protected void changeTimeLinkButton_Click(object sender, EventArgs e)
        {
            if (checkBox() == true) {
                int czasTmp = Int32.Parse(minutTextBox.Text) * 60;
                Application["status_gry_przez"] = czasTmp;
                Application["status_gry"] = 1;
                komunikatLabel.Text = "Poprawnie ustawiono czas aktywności gry!";
                komunikatLabel.Visible = true;
                minutLabel.Text = "Pozostało: " + czasTmp/60 + " minut";
            }
        }

        private Boolean checkBox() {
            int czas = Int32.Parse(minutTextBox.Text);
            if (czas < 0) {
                komunikatLabel.Text = "Nieprawidłowa wartość!";
                komunikatLabel.Visible = true;
                return false;
            }
            return true;
        }
    }
}