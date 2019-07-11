using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.Admin.hotels
{
    public partial class manage : System.Web.UI.Page
    {
        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "aktywuj")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                tools.zmienStatusDzialka(index, "aktywny");
            }

            if (e.CommandName == "dezaktywuj")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                tools.zmienStatusDzialka(index, "nieaktywny");
            }

            if (e.CommandName == "usun")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                tools.usunDzialka(index);
            }

            if (e.CommandName == "edytuj")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                Session["Admin_id_dzialka"] = index;
                Server.Transfer("~/Admin/dzialka/edit.aspx");
            } 
            odswiezGrid();
        }

        public void odswiezGrid()
        {
            //nieaktywnyPokojSqlDataSource.EnableCaching = false;
            GridView1.DataBind();
            GridView2.DataBind();
            //nieaktywnyPokojSqlDataSource.EnableCaching = true;
        }
    }
}