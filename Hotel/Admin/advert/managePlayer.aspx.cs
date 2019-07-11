using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.Admin.advert
{
    public partial class managePlayer : System.Web.UI.Page
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
                tools.usunReklamaUser(index);
            }
            odswiezGrid();
        }

        public void odswiezGrid()
        {
            //nieaktywnyPokojSqlDataSource.EnableCaching = false;
            GridView1.DataBind();
            //nieaktywnyPokojSqlDataSource.EnableCaching = true;
        }
    }
}