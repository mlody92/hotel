using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.Admin.users
{
    public partial class manageUsers : System.Web.UI.Page
    {
        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "zatwierdz"){
                int index = Convert.ToInt32(e.CommandArgument);
                tools.zmienStatusUzytkownika(index, "aktywny");
            }

            if (e.CommandName == "zablokuj")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                tools.zmienStatusUzytkownika(index, "zablokowany");
            }

            if (e.CommandName == "odblokuj")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                tools.zmienStatusUzytkownika(index, "aktywny");
            }

            if (e.CommandName == "usun")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                tools.usunUzytkownika(index);
            }

            if (e.CommandName == "edytuj")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                Session["Admin_id_uzytkownika"] = index;
                Server.Transfer("~/Admin/users/editUser.aspx");
            }

            odswiezGrid();
        }

        public void odswiezGrid()
        {
            GridView1.DataBind();
            GridView2.DataBind();
            GridView3.DataBind();
            GridView4.DataBind();
        }

    }

}