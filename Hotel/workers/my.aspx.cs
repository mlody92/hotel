using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel.workers
{
    public partial class my : System.Web.UI.Page
    {
        Hotel.tools.tools tools = new Hotel.tools.tools();
        protected void Page_Load(object sender, EventArgs e)
        {
            filterHoteleGridView.Visible = false;
            allhoteleGridView.Visible = true;
            if (Session["User_id"] != null)
            {
                allhoteleSqlDataSource.SelectParameters.Add("uzytkownik_id", Session["User_id"].ToString());
            }
        }

        protected void filtrujButton_Click(object sender, EventArgs e)
        {
            string id = miastoDropDownList.SelectedItem.Value;
            filterSqlDataSource.SelectParameters.Clear();
            filterSqlDataSource.SelectParameters.Add("id_miasto", id);
            filterHoteleGridView.Visible = true;
            allhoteleGridView.Visible = false;
            filterSqlDataSource.SelectParameters.Add("uzytkownik_id", Session["User_id"].ToString());
            //miastoDropDownList.Items.Clear();
        }

        protected void OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "pracownicy")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                Session["User_id_hotelu"] = index;
                Server.Transfer("~/workers/worker.aspx");
            }
           
        }
    }
}