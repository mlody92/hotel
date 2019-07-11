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

namespace Hotel.Admin.rooms
{
    public partial class edit : System.Web.UI.Page
    {
        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        String[] dane = new String[8];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_id_pokoj"] != null)
            {
                if (getPokoj(Session["Admin_id_pokoj"].ToString()) == true)
                {
                    idLabel.Text = dane[0];
                    nameTextBox.Attributes.Add("placeholder", dane[1]);
                    kosztTextBox.Attributes.Add("placeholder", dane[2]);
                    zyskTextBox.Attributes.Add("placeholder", dane[3]);
                    if (!IsPostBack)
                    {
                        statusDropDownList.Text = dane[5];
                    }
                }
                else
                {
                    komunikatLabel.Visible = true;
                    komunikatLabel.Text = "Nie pobrano danych.";
                }
            }
            else Server.Transfer("~/Admin/rooms/manage.aspx");
        }

        protected void addWojLinkButton_Click(object sender, EventArgs e)
        {
            checkBox();
            tools.updatePokoj(dane[0], nameTextBox.Text, kosztTextBox.Text, zyskTextBox.Text, statusDropDownList.SelectedItem.Value,stopienDropDownList.SelectedItem.Value, rodzajDropDownList.SelectedItem.Value);
            komunikatLabel.Visible = true;
            komunikatLabel.Text = "Poprawnie zmieniono dane.";
        }

        protected void powrotLinkButton_Click(object sender, EventArgs e)
        {
            Session["Admin_id_pokoj"] = null;
            Server.Transfer("~/Admin/rooms/manage.aspx");
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
            if (zyskTextBox.Text == "")
            {
                zyskTextBox.Text = dane[3];
            }
            if ((stopienDropDownList.SelectedItem.Value).ToString() == "-1")
            {
                stopienDropDownList.SelectedItem.Value = dane[6];
            }
            if ((rodzajDropDownList.SelectedItem.Value).ToString() == "-1")
            {
                rodzajDropDownList.SelectedItem.Value = dane[7];
            }
        }

        private bool getPokoj(string id)
        {
            bool flaga = false;

            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("SELECT p.id, p.rodzaj, p.koszt, p.zysk, p.status, a.nazwa, p.atrakcyjnosc_id, p.id_pracownik FROM pokoj p INNER JOIN atrakcyjnosc a ON p.atrakcyjnosc_id = a.id WHERE p.id=@id", user);
            
            sql.Parameters.AddWithValue("@id", id);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;
            if (flaga.Equals(true))
            {
                dane[0] = dataSet.Tables[0].Rows[0]["id"].ToString();
                dane[1] = dataSet.Tables[0].Rows[0]["rodzaj"].ToString();
                dane[2] = dataSet.Tables[0].Rows[0]["koszt"].ToString();
                dane[3] = dataSet.Tables[0].Rows[0]["zysk"].ToString();
                dane[4] = dataSet.Tables[0].Rows[0]["nazwa"].ToString();
                dane[5] = dataSet.Tables[0].Rows[0]["status"].ToString();
                dane[6] = dataSet.Tables[0].Rows[0]["atrakcyjnosc_id"].ToString();
                dane[7] = dataSet.Tables[0].Rows[0]["id_pracownik"].ToString();
                flaga = true;
            }
            return flaga;
        }


    }
}