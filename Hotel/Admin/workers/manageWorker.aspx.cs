using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.Admin.workers
{
    public partial class manageWorker : System.Web.UI.Page
    {
        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "usun")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                tools.usunPracownika(index);
            }

            if (e.CommandName == "edytuj")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                Session["Admin_id_pracownik"] = index;
                Server.Transfer("~/Admin/workers/editWorker.aspx");
            }

            odswiezGrid();
        }

        public void odswiezGrid()
        {
            pracownikSqlDataSource.EnableCaching = false;
            GridView1.DataBind();
            pracownikSqlDataSource.EnableCaching = true;
        }
    }
}