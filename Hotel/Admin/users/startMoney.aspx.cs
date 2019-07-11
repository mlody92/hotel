using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.Admin.users
{
    public partial class startMoney : System.Web.UI.Page
    {
        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Text = Application["ilosc_pieniedzy"].ToString();
        }

        protected void zapiszButton_Click(object sender, EventArgs e)
        {
            if (checkBox())
            {
                tools.updateMoney(iloscTextBox.Text);
                Application["ilosc_pieniedzy"] = iloscTextBox.Text;
                Label2.Text = iloscTextBox.Text;
            }
        }
        private Boolean checkBox()
        {
            Boolean flaga = true;
            if (iloscTextBox.Text == "")
            {
                iloscLabel.Text = "Niepoprawna wartość";
                iloscLabel.Visible = true;
                flaga = false;
            }
            else iloscLabel.Visible = false;
            return flaga;
        }

    }
}