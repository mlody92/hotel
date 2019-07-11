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

namespace Hotel.Admin.attractions
{
    public partial class edit : System.Web.UI.Page
    {
        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        String[] dane = new String[8];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_id_atrakcji"] != null)
            {
                if (getAttraction(Session["Admin_id_atrakcji"].ToString()) == true)
                {

                    idLabel.Text = dane[0];
                    nameTextBox.Attributes.Add("placeholder", dane[1]);
                    kosztTextBox.Attributes.Add("placeholder", dane[2]);
                    kosztMiesiacTextBox.Attributes.Add("placeholder", dane[3]);
                    procentTextBox.Attributes.Add("placeholder", dane[5]);
                    iloscTextBox.Attributes.Add("placeholder", dane[6]);

                }
                else
                {
                    komunikatLabel.Visible = true;
                    komunikatLabel.Text = "Nie pobrano danych.";
                }
            }
            else Server.Transfer("~/Admin/attractions/manage.aspx");
        }

        protected void zatwierdzLinkButton_Click(object sender, EventArgs e)
        {
            checkBox();
            tools.updateAttraction(dane[0], nameTextBox.Text, kosztTextBox.Text, kosztMiesiacTextBox.Text, rodzajDropDownList.SelectedItem.Value, procentTextBox.Text, iloscTextBox.Text, rodzajPracDropDownList.SelectedItem.Value);
            komunikatLabel.Visible = true;
            komunikatLabel.Text = "Poprawnie zmieniono dane.";
        }

        protected void powrotLinkButton_Click(object sender, EventArgs e)
        {
            Session["Admin_id_dzialka"] = null;
            Server.Transfer("~/Admin/attractions/manage.aspx");
        }

        private void checkBox()
        {
            if (nameTextBox.Text == "")
            {
                nameTextBox.Text = dane[1];

            }

            if (kosztTextBox.Text == "")
            {
                kosztTextBox.Text = dane[2];

            }

            if (kosztMiesiacTextBox.Text == "")
            {
                kosztMiesiacTextBox.Text = dane[3];

            }

            if ((rodzajDropDownList.SelectedItem.Value).ToString() == "-1")
            {
                rodzajDropDownList.SelectedItem.Value = dane[4];
            }

            if (procentTextBox.Text == "")
            {
                procentTextBox.Text = dane[5];

            }
            if (iloscTextBox.Text == "")
            {
                iloscTextBox.Text = dane[6];

            }
            if ((rodzajPracDropDownList.SelectedItem.Value).ToString() == "-1")
            {
                rodzajPracDropDownList.SelectedItem.Value = dane[7];
            }
        }

        private bool getAttraction(string id)
        {
            bool flaga = false;

            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("SELECT * FROM atrakcja WHERE id=@id", user);

            sql.Parameters.AddWithValue("@id", id);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;
            if (flaga.Equals(true))
            {
                dane[0] = dataSet.Tables[0].Rows[0]["id"].ToString();
                dane[1] = dataSet.Tables[0].Rows[0]["nazwa"].ToString();
                dane[2] = dataSet.Tables[0].Rows[0]["koszt"].ToString();
                dane[3] = dataSet.Tables[0].Rows[0]["koszt_miesieczny"].ToString();
                dane[4] = dataSet.Tables[0].Rows[0]["rodzaj_hotelu"].ToString();
                dane[5] = dataSet.Tables[0].Rows[0]["procent"].ToString();
                dane[6] = dataSet.Tables[0].Rows[0]["ilosc"].ToString();
                dane[7] = dataSet.Tables[0].Rows[0]["id_pracownik"].ToString();

                flaga = true;
            }
            return flaga;
        }
    }
}