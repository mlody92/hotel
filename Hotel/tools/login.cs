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
    public class login : Page
    {
        public bool checkLoginAndPassword(string login, string password)
        {
            bool flagaLogin = false;
            bool flaga = false;

            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("SELECT * FROM uzytkownik WHERE login=@login", user);

            sql.Parameters.AddWithValue("@login", login);
            sql.Parameters.AddWithValue("@password", password);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flagaLogin = dataSet.Tables[0].Rows.Count > 0;
            if (flagaLogin.Equals(true))
            {
                if (dataSet.Tables[0].Rows[0]["password"].ToString() == new Hotel.tools.hash().CreateMD5(password))
                {
                    Session["User_uprawnienie"] = dataSet.Tables[0].Rows[0]["uprawnienie"].ToString();
                    Session["User_id"] = dataSet.Tables[0].Rows[0]["id"].ToString();
                    Session["User_imie"] = dataSet.Tables[0].Rows[0]["imie"].ToString();
                    Session["User_nazwisko"] = dataSet.Tables[0].Rows[0]["nazwisko"].ToString();
                    Session["User_login"] = dataSet.Tables[0].Rows[0]["login"].ToString();
                    Session["User_konto"] = dataSet.Tables[0].Rows[0]["konto"].ToString();
                    Session["User_status"] = dataSet.Tables[0].Rows[0]["status"].ToString();
                    flaga = true;
                }
            }
            return flaga;
        }
    }
}