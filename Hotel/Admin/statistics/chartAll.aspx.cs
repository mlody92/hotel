using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.Admin.statistics
{
    public partial class chartAll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void powrotLinkButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("~/Admin/statistics/statistic.aspx");
        }
    }
}