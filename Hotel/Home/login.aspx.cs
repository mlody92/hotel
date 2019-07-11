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


namespace Hotel.Home
{
    public partial class login : System.Web.UI.Page
    {

        Hotel.tools.login loginTools = new Hotel.tools.login();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["User_uprawnienie"] != null)
            {
                labelText.Visible = true;
                labelText.Text = Session["User_uprawnienie"] + " jesteś już zalogowany!";
                loginTable.Visible = false;
            }
            else 
            {
                loginTable.Visible = true;
            }
        }

        protected void zalogujLinkButton_Click(object sender, EventArgs e)
        {
            Boolean fl=true;
            
            if (loginTextBox.Text=="") {
                labelText.Visible = true;
                labelText.Text = "Pole nazwa użytkownika nie może być puste.";
                fl = false;
            } else if (passwordTextBox.Text == "")
            {
                labelText.Visible = true;
                labelText.Text = "Pole haslo nie może być puste.";
                fl = false;
            }
            if (fl == true)
            {
                if (loginTools.checkLoginAndPassword(loginTextBox.Text, passwordTextBox.Text))
                {
                    Response.Redirect("~/index.aspx");
                }
                else { 
                    //Response.Redirect(Request.RawUrl);
                    labelText.Visible = true;
                    labelText.Text = "Niepoprawny login lub hasło. Spróbuj ponownie.";
                }
            }
        }
    }
}