using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.Admin.dzialka
{
    public partial class manageAtr : System.Web.UI.Page
    {
        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addLinkButton_Click(object sender, EventArgs e)
        {
            if (checkBox() == true)
            {
                tools.addStopienAtr(nameTextBox.Text);
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
                tools.usunStopienAtr(index);
            }

            if (e.CommandName == "edytuj")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                Session["Admin_id_stopienAtr"] = index;
                Server.Transfer("~/Admin/dzialka/editAtr.aspx");
            }
            odswiezGrid();
        }
        private Boolean checkBox()
        {
            Boolean flaga = true;
            if (nameTextBox.Text == "")
            {
                nameLabel.Text = "Pole stopień atrakcyjności nie może być puste.";
                nameLabel.Visible = true;
                flaga = false;
            }
            else nameLabel.Visible = false;

            return flaga;
        }
        public void odswiezGrid()
        {
            //nieaktywnyPokojSqlDataSource.EnableCaching = false;
            GridView1.DataBind();
            //nieaktywnyPokojSqlDataSource.EnableCaching = true;
            nameTextBox.Text = "";
        }
    }
}