using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.Admin
{
    public partial class admin2 : System.Web.UI.MasterPage
    {
        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        protected void Page_Load(object sender, EventArgs e)
        {
            skryptCzasAdmin.InnerHtml = "<script type=\"text/javascript\">zegar(" + (int)Application["czas"] + "," + (int)Application["jednostka_czasu"] + "," + (int)Application["status_gry"] + ");</script>";
            // LabelLogin.Text = Session["Admin_login"].ToString();
            tools.sprawdzDostep();
            nowiUzytkownicy.Text = tools.pobierzUzytkownikow();
            aktualnieLabel.Text = Application["online"].ToString();
            zarejestrowanychLabel.Text = tools.pobierzWszystkichUzytkownikow();
        }

        protected void LinkWyloguj_Click(object sender, EventArgs e)
        {
            tools.wylogujAdmina();
        }
    }
}