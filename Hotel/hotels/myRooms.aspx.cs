using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel
{
    public partial class myRooms : System.Web.UI.Page
    {
        Hotel.tools.dane dane = new Hotel.tools.dane();
        Hotel.tools.tools tools = new Hotel.tools.tools();
        String idHot;
        String idPokoju;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_id_hotelu"] != null)
            {
                idHot = Session["User_id_hotelu"].ToString();
                myroomSqlDataSource.SelectParameters.Add("dzialka_user", Session["User_id_hotelu"].ToString());
                SqlDataSource1.SelectParameters.Add("dzialka_user", Session["User_id_hotelu"].ToString());
            }
            if (Session["User_pokoj_id"] != null)
            {
                idPokoju = Session["User_pokoj_id"].ToString();
              
            }
        }
        protected void OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "wybuduj")
            {
                string[] data = e.CommandArgument.ToString().Split(',');
                dane.odswiezDane();
                int konto = Int32.Parse(Session["User_konto"].ToString());
                int pokojId = Int32.Parse(data[0]);
                int koszt = Int32.Parse(data[1]);
                int zysk = Int32.Parse(data[2]);
                int userId = Int32.Parse(Session["User_id"].ToString());
                if (konto > koszt)
                {
                    tools.zbudujPokoj(idHot, pokojId, koszt, userId, zysk);
                    Response.Redirect(Request.RawUrl);
                    komunikatLabel.Visible = true;
                    komunikatLabel.Text = "Poprawnie zbudowano pokój";
                }
                else
                {
                    komunikatLabel.Visible = true;
                    komunikatLabel.Text = "Nie masz wystarczającej ilości pieniędzy.";
                }
            }

            if (e.CommandName == "cena")
            {
                Session["User_pokoj_id"] = Convert.ToInt32(e.CommandArgument);
                zmianaCeny.Visible = true;
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (checkBox() == true)
            {
                tools.zmienCenePokoju(idPokoju, TextBox1.Text);
                Response.Redirect(Request.RawUrl);
                komunikatLabel.Text = "Poprawnie zmieniono cenę pokoju.";
                komunikatLabel.Visible = true;
            }
            else
            {
                komunikatLabel.Text = "Nieprawidłowa cena! Zakres 0-2000";
                komunikatLabel.Visible = true;
            }
        }

        private Boolean checkBox()
        {
            if (TextBox1.Text == "")
            {
                return false;
            }
            if (Int32.Parse(TextBox1.Text) <= 0 || Int32.Parse(TextBox1.Text) > 2000)
            {
                return false;
            }
            return true;
        }
    }
}