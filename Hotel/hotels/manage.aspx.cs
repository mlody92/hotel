using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.hotels
{
    public partial class manage : System.Web.UI.Page
    {
        Hotel.tools.tools tools = new Hotel.tools.tools();
        Hotel.tools.dane dane = new Hotel.tools.dane();
        protected void Page_Load(object sender, EventArgs e)
        {
            filterHoteleGridView.Visible = false;
            allhoteleGridView.Visible = true;
            if (Session["User_id"] != null)
            {
                allhoteleSqlDataSource.SelectParameters.Add("uzytkownik_id", Session["User_id"].ToString());
                filterSqlDataSource.SelectParameters.Add("uzytkownik_id", Session["User_id"].ToString());
            }
        }

        protected void filtrujButton_Click(object sender, EventArgs e)
        {
            string id = miastoDropDownList.SelectedItem.Value;
            filterSqlDataSource.SelectParameters.Clear();
            filterSqlDataSource.SelectParameters.Add("id_miasto", id);
            filterHoteleGridView.Visible = true;
            allhoteleGridView.Visible = false;
            filterSqlDataSource.SelectParameters.Add("uzytkownik_id", Session["User_id"].ToString());
            //miastoDropDownList.Items.Clear();
        }

        protected void OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "kup")
            {
                String[] daneDzialki = new String[3];
                int index = Convert.ToInt32(e.CommandArgument);
                dane.odswiezDane();
                daneDzialki = tools.pobierzDzialke(index);
                if (Int32.Parse(Session["User_konto"].ToString()) > Int32.Parse(daneDzialki[0]) && daneDzialki[1] == "aktywny")
                {
                    int wydatek =  Int32.Parse(daneDzialki[0]);
                    tools.kupDzialka(index, Session["User_id"].ToString(), wydatek);
                    Response.Redirect(Request.RawUrl);
                    komunikatLabel.Visible = true;
                    komunikatLabel.Text = "Poprawnie zakupiono działkę";
                }
                else {
                    komunikatLabel.Visible = true;
                    komunikatLabel.Text = "Nie masz wystarczającej ilości pieniędzy.";
                }
            }
        }
    }
}