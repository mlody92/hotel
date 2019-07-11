using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.Admin.advert
{
    public partial class manage : System.Web.UI.Page
    {
        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void zatwierdzLinkButton_Click(object sender, EventArgs e)
        {
            if (checkBox() == true)
            {
                tools.addReklama(nameTextBox.Text, kosztTextBox.Text, dniTextBox.Text,zyskTextBox.Text);
                komunikatLabel.Text = ("Poprawnie dodano.");
                komunikatLabel.Visible = true;
                komunikat2Label.Visible = false;
                odswiezGrid();
            }
        }

        protected void OnRowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "usun")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                tools.usunReklama(index);
            }

            if (e.CommandName == "edytuj")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                Session["Admin_id_reklama"] = index;
                Server.Transfer("~/Admin/advert/edit.aspx");
            }
            odswiezGrid();
        }

        public void odswiezGrid()
        {
            //nieaktywnyPokojSqlDataSource.EnableCaching = false;
            GridView1.DataBind();
            //nieaktywnyPokojSqlDataSource.EnableCaching = true;
            nameTextBox.Text = "";
            kosztTextBox.Text = ""; 
            dniTextBox.Text = "";
            zyskTextBox.Text = "";
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

            if (dniTextBox.Text == "")
            {
                dniLabel.Text = "Pole ilość dni nie może być puste.";
                dniLabel.Visible = true;
                flaga = false;
            }
            else dniLabel.Visible = false;

            if (zyskTextBox.Text == "")
            {
                zyskLabel.Text = "Pole zysk nie może być puste.";
                zyskLabel.Visible = true;
                flaga = false;
            }
            else zyskLabel.Visible = false;

            return flaga;
        }
    }
}