using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.Admin.statistics
{
    public partial class chart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_id_uzytkownika"] != null)
            {
                SqlDataSource.SelectParameters.Add("id_uzytkownika", Session["Admin_id_uzytkownika"].ToString());
                SqlDataSource1.SelectParameters.Add("id_uzytkownika", Session["Admin_id_uzytkownika"].ToString());
            }
        }

        protected void powrotLinkButton_Click(object sender, EventArgs e)
        {
            Session["Admin_id_uzytkownika"] = null;
            Server.Transfer("~/Admin/statistics/statistic.aspx");
        }
    }
}