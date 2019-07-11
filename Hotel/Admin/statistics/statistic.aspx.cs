using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.Admin.statistics
{
    public partial class statistic : System.Web.UI.Page
    {
        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "wykres")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                Session["Admin_id_uzytkownika"] = index;
                Server.Transfer("~/Admin/statistics/chart.aspx");
            }
            Response.Redirect(Request.RawUrl);
        }
    }
}