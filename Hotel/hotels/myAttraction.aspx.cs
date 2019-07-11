using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.hotels
{
    public partial class myAttraction : System.Web.UI.Page
    {
        String idHot;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User_id_hotelu"] != null)
            {
                idHot = Session["User_id_hotelu"].ToString();
                myattrSqlDataSource.SelectParameters.Add("dzialka_user", Session["User_id_hotelu"].ToString());
                SqlDataSource1.SelectParameters.Add("dzialka_user", Session["User_id_hotelu"].ToString());
            }
        }

        protected void OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
           
                if (e.CommandName == "pracownicy")
                {
                    string[] data = e.CommandArgument.ToString().Split(',');
                    Session["User_id_atr"] = data[0];
                    Session["User_id_prac"] = data[1];
                    Session["User_id_hotelu"] = idHot;
                    Server.Transfer("~/hotels/attractionWorkers.aspx");
                }
        }
    }
}