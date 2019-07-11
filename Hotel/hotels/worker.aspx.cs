using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.hotels
{
    public partial class worker : System.Web.UI.Page
    {
        Hotel.tools.tools tools = new Hotel.tools.tools();
        Hotel.tools.dane dane = new Hotel.tools.dane();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_id_hotelu"] != null)
            {
                SqlDataSource1.SelectParameters.Add("dzialka_user", Session["User_id_hotelu"].ToString());
            }
        }

         protected void OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "zatrudnij")
            {
                string[] data = e.CommandArgument.ToString().Split(',');
                dane.odswiezDane();
                int konto = Int32.Parse(Session["User_konto"].ToString());
                int dzialkaId = Int32.Parse(Session["User_id_hotelu"].ToString());
                int pracownikId = Int32.Parse(data[0]);
                int pensja = Int32.Parse(data[1]);
                int userId = Int32.Parse(Session["User_id"].ToString());
                if (konto > pensja)
                {
                    tools.zatrudnij(dzialkaId, pracownikId, pensja, userId);
                    Response.Redirect(Request.RawUrl);
                    Label3.Visible = true;
                    Label3.Text = "Poprawnie zatrudniono pracownika";
                }
                else {
                    Label3.Visible = true;
                    Label3.Text = "Nie masz wystarczającej ilości pieniędzy.";
                }

            }
        }
       
    }
}