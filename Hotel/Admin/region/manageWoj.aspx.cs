using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Hotel.Admin.woj
{
    public partial class manageWoj : System.Web.UI.Page
    {
        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void addWojLinkButton_Click(object sender, EventArgs e)
        {
            if (checkBox() == true)
            {
                tools.addWojewodztwo(nazwaWojTextBox.Text);
                komunikatLabel.Text = ("Poprawnie dodano województwo.");
                komunikatLabel.Visible = true;
                komunikat2Label.Visible = false;
                odswiezGrid();
                nazwaWojTextBox.Text = "";
            }
        }

        private Boolean checkBox()
        {
            Boolean flaga = true;
            if (nazwaWojTextBox.Text == "")
            {
                nazwaWojLabel.Text = "Pole nazwa województwa nie może być puste.";
                nazwaWojLabel.Visible = true;
                flaga = false;
            }
            else nazwaWojLabel.Visible = false;

            return flaga;
        }

        protected void OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "usun")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                if (Int32.Parse(tools.pobierzMiastaWojewodztwa(index)) <= 0)
                {
                    tools.usunWojewodztwo(index);
                    komunikat2Label.Text = ("Poprawnie usunięto województwo.");
                    komunikat2Label.Visible = true;
                    komunikatLabel.Visible = false;
                }
                else
                {
                    komunikat2Label.Text = ("Nie mozna usunąć województwa. Prawdopodobnie są przypisane do niego miasta.");
                }
                komunikat2Label.Visible = true;
                komunikatLabel.Visible = false;
            }

            if (e.CommandName == "edytuj")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                Session["Admin_id_woj"] = index;
                Server.Transfer("~/Admin/region/editWojewodztwo.aspx");
            }
            odswiezGrid();
        }

        public void odswiezGrid()
        {
            wojewodztwaSqlDataSource.EnableCaching = false;
            GridView3.DataBind();
            wojewodztwaSqlDataSource.EnableCaching = true;
            nazwaWojTextBox.Text = "";
        }
    }
}