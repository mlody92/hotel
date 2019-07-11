using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Hotel.Admin.region
{
    public partial class manageMiasto : System.Web.UI.Page
    {
        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addWojLinkButton_Click(object sender, EventArgs e)
        {
            
            if (checkBox() == true)
            {
                tools.addMiasto(WojDropDownList.SelectedValue, miastoTextBox.Text);
                komunikatLabel.Text = ("Poprawnie dodano województwo.");
                komunikatLabel.Visible = true;
                komunikat2Label.Visible = false;
                odswiezGrid();
                miastoTextBox.Text = "";
            }
        }

        protected void OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "usun")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                if (Int32.Parse(tools.pobierzHoteleMiasta(index)) <= 0)
                {
                    tools.usunMiasto(index);
                    komunikat2Label.Text = ("Poprawnie usunięto miasto.");
                    komunikat2Label.Visible = true;
                    komunikatLabel.Visible = false;
                }
                else
                {
                    komunikat2Label.Text = ("Nie mozna usunąć miasta. Prawdopodobnie są przypisane do niego hotele.");
                }
                komunikat2Label.Visible = true;
                komunikatLabel.Visible = false;
            }

            if (e.CommandName == "edytuj")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                Session["Admin_id_miasto"] = index;
                Server.Transfer("~/Admin/region/editMiasto.aspx");
            }
            odswiezGrid();
        }

        private Boolean checkBox()
        {
            Boolean flaga = true;
            if (miastoTextBox.Text == "")
            {
                miastoLabel.Text = "Pole nazwa miasta nie może być puste.";
                miastoLabel.Visible = true;
                flaga = false;
            }
            else miastoLabel.Visible = false;

           
            return flaga;
        }

        public void odswiezGrid()
        {
            miastoSqlDataSource.EnableCaching = false;
            GridView1.DataBind();
            miastoSqlDataSource.EnableCaching = true;
            miastoTextBox.Text = "";
        }
    }
}