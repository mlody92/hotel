using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.workers
{
    public partial class worker : System.Web.UI.Page
    {
        Hotel.tools.dane dane = new Hotel.tools.dane();
        Hotel.tools.tools tools = new Hotel.tools.tools();
        String idHot;
        String idPracownika;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_id_hotelu"] != null)
            {
                myWorkerSqlDataSource.SelectParameters.Add("dzialka_user", Session["User_id_hotelu"].ToString());
            }
            if (Session["User_prac_id"] != null)
            {
                idPracownika = Session["User_prac_id"].ToString();

            }
        }

        protected void OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "pensja")
            {
                Session["User_prac_id"] = Convert.ToInt32(e.CommandArgument);
                zmianaPensji.Visible = true;
            }

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (checkBox() == true)
            {
                tools.zmienPensjePracownika(idPracownika, TextBox1.Text);
                komunikatLabel.Text = "Poprawnie zmieniono cenę pokoju.";
                komunikatLabel.Visible = true;
            }
            else
            {
                komunikatLabel.Text = "Nieprawidłowa pensja!";
                komunikatLabel.Visible = true;
            }

            Response.Redirect(Request.RawUrl);
        }

        private Boolean checkBox()
        {
            if (TextBox1.Text == "")
            {
                return false;
            }
            if (Int32.Parse(TextBox1.Text) <= 0 )
            {
                return false;
            }
            return true;
        }
    }
}