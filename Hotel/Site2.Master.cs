using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Security.Cryptography;

namespace Hotel
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        Hotel.tools.login login = new Hotel.tools.login();
        Hotel.tools.dane dane = new Hotel.tools.dane();

        protected void Page_Load(object sender, EventArgs e)
        {
            skryptCzas.InnerHtml = "<script type=\"text/javascript\">zegar(" + (int)Application["czas"] + "," + (int)Application["jednostka_czasu"] + "," + (int)Application["status_gry"] + ");</script>";
            if ((int)Application["status_gry"] == 1)
            {

                if (Session["User_uprawnienie"] != null)
                {
                    if (Session["User_uprawnienie"].ToString() == "student" || Session["User_uprawnienie"].ToString() == "admin")
                    {
                        dane.odswiezDane();
                        Label1.Text = "Jesteś zalogowany jako: <br/><b>" + Session["User_imie"].ToString() + Session["User_nazwisko"].ToString() + " - " + Session["User_login"].ToString() + "</b>";
                        menuLogin.Visible = false;
                        menuAfterLogin.Visible = true;
                        loginHyperLink.Visible = false;
                        linkNiezalogowany.Visible = false;
                        linkZalogowany.Visible = true;
                        ustawienia.Visible = true;
                        nazwaUzytkownikaLabel.Text = Session["User_login"].ToString();
                        stanKontaLabel.Text = Session["User_konto"].ToString() + " $";
                        statystykiDiv.Visible = true;
                        middlePost.Visible = true;
                    }
                }
                else
                {

                    Label1.Text = "Zaloguj się!";
                    linkNiezalogowany.Visible = true;
                    linkZalogowany.Visible = false;
                    ustawienia.Visible = false;
                    //statystykiDiv.Visible = false;
                    menuLogin.Visible = true;
                    menuAfterLogin.Visible = false;
                    loginHyperLink.Visible = true;
                    middlePost.Visible = false;
                    //Label3.Text = "Aby zacząć grę należy się zarejestrować i poczekać, aż administrator zaakceptuje konto.";
                    Server.Transfer("~/index.aspx", true);
                }
            }
            else
            {
                Label2.Text = "Gra jest wyłączona!";
                Label2.Visible = true;
                linkNiezalogowany.Visible = true;
                linkZalogowany.Visible = false;
                ustawienia.Visible = false;
                //statystykiDiv.Visible = false;
                menuLogin.Visible = true;
                menuAfterLogin.Visible = false;
                loginHyperLink.Visible = true;
                //if (IsPostBack)
                //{
                //    if (Context.Items["Transferred"] == null)
                //    {
                //        // Initialize to prevent stackover
                //        Context.Items["Transferred"] = new object();
                //        // TransferToSelf
                //        Server.Transfer("~/index.aspx", true);
                //    }
                //}
            }
        }

        protected void zalogujButton_Click(object sender, EventArgs e)
        {
            Label1.Text = "zaloguj";
            if ((int)Application["status_gry"] == 1)
            {
                if (login.checkLoginAndPassword(loginText.Text, hasloText.Text))
                {
                    Label1.Text = "Witaj  !";
                    Response.Redirect("~/index.aspx");
                    linkNiezalogowany.Visible = false;
                    linkZalogowany.Visible = true;
                    //Server.Transfer("index.aspx");
                }
                else
                {
                    Response.Redirect("~/Home/login.aspx");
                }
            }
            //Response.Redirect("~/Home/login.aspx");
        }


        protected void wylogujButton_Click(object sender, EventArgs e)
        {
            wyloguj();
        }
        protected void wylogujLinkButton_Click(object sender, EventArgs e)
        {
            wyloguj();
        }

        private void wyloguj()
        {
            Session["User_uprawnienie"] = null;
            menuLogin.Visible = true;
            menuAfterLogin.Visible = false;
            ustawienia.Visible = false;
            Response.Redirect(Request.RawUrl);
        }

    }
}