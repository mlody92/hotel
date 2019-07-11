using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace Hotel.tools
{
    public class dane : Page
    {
        public void odswiezDane()
        {
            bool flaga = false;

            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("SELECT * FROM uzytkownik WHERE id="+Session["User_id"].ToString(), user);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;
            if (flaga.Equals(true))
            {
                    Session["User_uprawnienie"] = dataSet.Tables[0].Rows[0]["uprawnienie"].ToString();
                    Session["User_imie"] = dataSet.Tables[0].Rows[0]["imie"].ToString();
                    Session["User_nazwisko"] = dataSet.Tables[0].Rows[0]["nazwisko"].ToString();
                    Session["User_login"] = dataSet.Tables[0].Rows[0]["login"].ToString();
                    Session["User_konto"] = dataSet.Tables[0].Rows[0]["konto"].ToString();
                    Session["User_status"] = dataSet.Tables[0].Rows[0]["status"].ToString();
            }
        }
    }
}