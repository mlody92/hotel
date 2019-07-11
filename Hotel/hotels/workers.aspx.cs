using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.hotels
{
    public partial class workers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_id"] != null)
            {
                allhoteleSqlDataSource.SelectParameters.Add("uzytkownik_id", Session["User_id"].ToString());
            }
        }

        protected void OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "wybierz")
            {

                int index = Convert.ToInt32(e.CommandArgument);
                Session["User_id_hotelu"] = index;
                Server.Transfer("~/hotels/worker.aspx");

            }
        }
    }
}