using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Security.Cryptography;

namespace Hotel.tools
{
    public class uprawnienie : Page
    {
        public void sprawdzDostep()
        {
            if (Session["User_uprawnienie"] != null)
            {

            }
            else
            {
                //Response.Redirect("~/Home/login.aspx", false); 
                //Response.Redirect(ResolveUrl("http://www.google.pl"));
                Server.Transfer("~/Home/login.aspx");
            }
        }
    }
}