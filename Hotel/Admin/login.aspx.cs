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

namespace Hotel.Admin
{
    public partial class login : System.Web.UI.Page
    {

        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void zalogujButton_Click(object sender, EventArgs e)
        {
            Boolean fl = true;

            if (loginTextBox.Text == "")
            {
                komunikatLabel.Visible = true;
                komunikatLabel.Text = "Pole nazwa użytkownika nie może być puste.";
                fl = false;
            }
            else if (passwordTextBox.Text == "")
            {
                komunikatLabel.Visible = true;
                komunikatLabel.Text = "Pole haslo nie może być puste.";
                fl = false;
            }
            if (fl == true)
            {
                if (tools.checkLoginAndPassword(loginTextBox.Text, passwordTextBox.Text))
                {
                    Response.Redirect("~/Admin/index.aspx");
                }
                else
                {
                    //Response.Redirect(Request.RawUrl);
                    komunikatLabel.Visible = true;
                    komunikatLabel.Text = "Niepoprawny login lub hasło. Spróbuj ponownie.";
                }
            }
        }
    }
}