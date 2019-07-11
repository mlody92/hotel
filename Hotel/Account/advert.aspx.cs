using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.Account
{
    public partial class advert : System.Web.UI.Page
    {
        Hotel.tools.tools tools = new Hotel.tools.tools();
        Hotel.tools.dane dane = new Hotel.tools.dane();
        String userId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_id"] != null)
            {
                userId = Session["User_id"].ToString();
                allSqlDataSource.SelectParameters.Add("user_id", Session["User_id"].ToString());
            }
        }

        protected void OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "reklama")
            {
                string[] data = e.CommandArgument.ToString().Split(',');
                string reklamaId = data[0];
                string koszt = data[1];
                string czas = data[2];
                dane.odswiezDane();
                int konto = Int32.Parse(Session["User_konto"].ToString());
                if (konto > Int32.Parse(koszt))
                {
                    tools.kupReklama(userId, reklamaId, czas, koszt); 
                    komunikatLabel.Visible = true;
                    komunikatLabel.Text = "Poprawnie wykupiono reklamę.";
                }
                else
                {
                    komunikatLabel.Visible = true;
                    komunikatLabel.Text = "Nie masz wystarczającej ilości pieniędzy.";
                }
            }

        }
    }
}