using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.hotels
{
    public partial class attraction : System.Web.UI.Page
    {
        Hotel.tools.tools tools = new Hotel.tools.tools();
        Hotel.tools.dane dane = new Hotel.tools.dane();
        int dzialkaId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_id_hotelu"] != null)
            {
                dzialkaId = Int32.Parse(Session["User_id_hotelu"].ToString());
                attrSqlDataSource.SelectParameters.Add("dzialka_user", Session["User_id_hotelu"].ToString());
            }
        }


        protected void OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "zbuduj")
            {
                string[] data = e.CommandArgument.ToString().Split(',');
                dane.odswiezDane();
                int atrakcja = Int32.Parse(data[0]);
                int konto = Int32.Parse(Session["User_konto"].ToString());
                int koszt = Int32.Parse(data[1]);
                int userId = Int32.Parse(Session["User_id"].ToString());
                if (konto > koszt)
                {
                    tools.zbuduj(dzialkaId, atrakcja, koszt, userId);
                    Response.Redirect(Request.RawUrl);
                    komunikatLabel.Visible = true;
                    komunikatLabel.Text = "Poprawnie zbudowano atrakcję";
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