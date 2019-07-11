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

namespace Hotel.Admin.workers
{
    public partial class editWorker : System.Web.UI.Page
    {
        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        String[] dane = new String[5];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_id_pracownik"] != null)
            {
                if (getPracownik(Session["Admin_id_pracownik"].ToString()) == true)
                {
                    idLabel.Text = dane[0];
                    stanowiskoTextBox.Attributes.Add("placeholder", dane[1]);
                    pensjaMinTextBox.Attributes.Add("placeholder", dane[4]);
                    pensjaTextBox.Attributes.Add("placeholder", dane[3]);
                    iloscTextBox.Attributes.Add("placeholder", dane[4]);

                }
                else
                {
                    komunikatLabel.Visible = true;
                    komunikatLabel.Text = "Nie pobrano danych.";
                }
            }
            else Server.Transfer("~/Admin/workers/manageWorker.aspx");
        }

        protected void zapiszLinkButton_Click(object sender, EventArgs e)
        {
            checkBox();
            tools.updatePracownik(dane[0], stanowiskoTextBox.Text, pensjaMinTextBox.Text, pensjaTextBox.Text, iloscTextBox.Text);
            komunikatLabel.Visible = true;
            komunikatLabel.Text = "Poprawnie zmieniono dane.";
        }

        protected void powrotLinkButton_Click(object sender, EventArgs e)
        {
            Session["Admin_id_pracownik"] = null;
            Server.Transfer("~/Admin/workers/manageWorker.aspx");
        }

        private void checkBox()
        {
           
            if (stanowiskoTextBox.Text == "")
            {
                stanowiskoTextBox.Text = dane[1];
            }
            if (pensjaMinTextBox.Text == "")
            {
                pensjaMinTextBox.Text = dane[2];
            }
            if (pensjaTextBox.Text == "")
            {
                pensjaTextBox.Text = dane[3];
            }
            if (iloscTextBox.Text == "")
            {
                iloscTextBox.Text = dane[4];
            }
        }

        private bool getPracownik(string id)
        {
            bool flaga = false;

            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("SELECT * FROM pracownik WHERE id=@id", user);

            sql.Parameters.AddWithValue("@id", id);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;
            if (flaga.Equals(true))
            {
                dane[0] = dataSet.Tables[0].Rows[0]["id"].ToString();
                dane[1] = dataSet.Tables[0].Rows[0]["stanowisko"].ToString();
                dane[2] = dataSet.Tables[0].Rows[0]["pensja_min"].ToString();
                dane[3] = dataSet.Tables[0].Rows[0]["pensja_srednia"].ToString();
                dane[4] = dataSet.Tables[0].Rows[0]["ilosc_obslugiwanych"].ToString();
                flaga = true;
            }
            return flaga;
        }
    }
}