using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Hotel.Admin.hotels
{
    public partial class add : System.Web.UI.Page
    {
        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addHotelLinkButton_Click(object sender, EventArgs e)
        {
            if (checkBox() == true)
            {
                tools.addDzialka(nameTextBox.Text, atrakcyjnoscDropDownList.SelectedItem.Value, cenaTextBox.Text, miastoDropDownList.SelectedItem.Value, hotelDropDownList.SelectedItem.Value);
                komunikatLabel.Visible = true;
                komunikatLabel.Text = "Poprawnie dodano.";
            }
        }

        protected void powrotLinkButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Admin/dzialka/manage.aspx");
        }

        private Boolean checkBox()
        {
            Boolean flaga = true;
            if (nameTextBox.Text == "")
            {
                nameLabel.Text = "Pole nazwa nie może być puste.";
                nameLabel.Visible = true;
                flaga = false;
            }
            else nameLabel.Visible = false;

            if ((atrakcyjnoscDropDownList.SelectedItem.Value).ToString() == "0")
            {
                atrLabel.Text = "Proszę wybrać wartość z listy";
                atrLabel.Visible = true;
                flaga = false;
            }
            else atrLabel.Visible = false;

            if (cenaTextBox.Text == "")
            {
                cenaLabel.Text = "Pole cena nie może być puste.";
                cenaLabel.Visible = true;
                flaga = false;
            }
            else cenaLabel.Visible = false;
          
            return flaga;
        }
    }
}