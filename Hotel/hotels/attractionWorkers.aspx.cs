using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.hotels
{
    public partial class attractionWorkers : System.Web.UI.Page
    {
        int atrId;
        int pracId;
        int hotId;
        Hotel.tools.tools tools = new Hotel.tools.tools();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_id_hotelu"] != null)
            {
                atrId = Int32.Parse(Session["User_id_atr"].ToString());
                pracId = Int32.Parse(Session["User_id_prac"].ToString());
                hotId = Int32.Parse(Session["User_id_hotelu"].ToString());

                atrworkSqlDataSource1.SelectParameters.Add("dzialka_user", Session["User_id_hotelu"].ToString());
                atrworkSqlDataSource1.SelectParameters.Add("pracownikId", Session["User_id_prac"].ToString());
                SqlDataSource1.SelectParameters.Add("dzialka_user", Session["User_id_hotelu"].ToString());
                SqlDataSource1.SelectParameters.Add("pracownikId", Session["User_id_prac"].ToString());
            }
        }
        protected void OnRowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "przydziel")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                if (tools.sprawdzDostepPracownika(index) == true)
                {
                    tools.przydzielPracownika(atrId, index);
                    komunikatLabel.Text = "Poprawnie przydzieliłeś pracownika";
                    komunikatLabel.Visible = true;
                }
                else {
                    komunikatLabel.Text = "Pracownik jest już przydzielony.";
                    komunikatLabel.Visible = true;
                }
            }

            if (e.CommandName == "wypisz")
            {
                string[] data = e.CommandArgument.ToString().Split(',');
                Session["User_id_atr"] = data[0];
                Session["User_id_prac"] = data[1];
                Server.Transfer("~/hotels/attractionWorkers.aspx");
            }

        }
    }
}