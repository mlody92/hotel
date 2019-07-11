using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.hotels
{
    public partial class rooms : System.Web.UI.Page
    {
        Hotel.tools.tools tools = new Hotel.tools.tools();
        protected void Page_Load(object sender, EventArgs e)
        {
            filterHoteleGridView.Visible = false;
            allhoteleGridView.Visible = true;
            if (Session["User_id"] != null)
            {
                filterSqlDataSource.SelectParameters.Add("uzytkownik_id", Session["User_id"].ToString());
                allhoteleSqlDataSource.SelectParameters.Add("uzytkownik_id", Session["User_id"].ToString());
            }
        }

        protected void OnRowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "wybierz")
            {
                string[] data = e.CommandArgument.ToString().Split(',');
                Session["User_id_atr"] = data[0];
                Session["User_id_prac"] = data[1];
                Server.Transfer("~/hotels/myRooms.aspx");
            }
        }
    }
}