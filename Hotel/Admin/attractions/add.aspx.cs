using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.Admin.attractions
{
    public partial class add : System.Web.UI.Page
    {
        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void zatwierdzLinkButton_Click(object sender, EventArgs e)
        {
            if (checkBox() == true)
            {
                tools.addAttraction(nameTextBox.Text, kosztTextBox.Text, kosztMiesiacTextBox.Text, hotelDropDownList.SelectedItem.Value, iloscTextBox.Text, procentTextBox.Text, rodzajDropDownList.SelectedItem.Value);
                komunikatLabel.Visible = true;
                komunikatLabel.Text = "Poprawnie dodano.";
            }
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

            if (kosztTextBox.Text == "")
            {
                kosztLabel.Text = "Pole koszt nie może być puste.";
                kosztLabel.Visible = true;
                flaga = false;
            }
            else kosztLabel.Visible = false;

            if (kosztMiesiacTextBox.Text == "")
            {
                kosztMiesiacLabel.Text = "Pole koszt miesięczny nie może być puste.";
                kosztMiesiacLabel.Visible = true;
                flaga = false;
            }
            else kosztMiesiacLabel.Visible = false;

            if (iloscTextBox.Text == "")
            {
                iloscLabel.Text = "Pole ilość nie może być puste.";
                iloscLabel.Visible = true;
                flaga = false;
            }
            else iloscLabel.Visible = false;

            if (procentTextBox.Text == "")
            {
                czasLabel.Text = "Pole procent nie może być puste.";
                czasLabel.Visible = true;
                flaga = false;
            }
            else czasLabel.Visible = false;

            return flaga;
        }
    }
}