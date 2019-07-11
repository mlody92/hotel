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

namespace Hotel.Admin.advert
{
    public partial class edit : System.Web.UI.Page
    {
        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        String[] dane = new String[5];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_id_reklama"] != null)
            {
                if (getReklama(Session["Admin_id_reklama"].ToString()) == true)
                {
                    idLabel.Text = dane[0];
                    nameTextBox.Attributes.Add("placeholder", dane[1]);
                    kosztTextBox.Attributes.Add("placeholder", dane[2]);
                    dniTextBox.Attributes.Add("placeholder", dane[3]);
                    zyskTextBox.Attributes.Add("placeholder", dane[4]);
                }
                else
                {
                    komunikatLabel.Visible = true;
                    komunikatLabel.Text = "Nie pobrano danych.";
                }
            }
            else Server.Transfer("~/Admin/advert/manage.aspx");
        }

        protected void addLinkButton_Click(object sender, EventArgs e)
        {
            checkBox();
            tools.updateReklama(dane[0], nameTextBox.Text, kosztTextBox.Text, dniTextBox.Text,zyskTextBox.Text);
            komunikatLabel.Visible = true;
            komunikatLabel.Text = "Poprawnie zmieniono dane.";
        }

        protected void powrotLinkButton_Click(object sender, EventArgs e)
        {
            Session["Admin_id_reklama"] = null;
            Server.Transfer("~/Admin/advert/manage.aspx");
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
            if (dniTextBox.Text == "")
            {
                dniTextBox.Text = dane[3];
            }
            if (zyskTextBox.Text == "")
            {
                zyskTextBox.Text = dane[4];
            }
        }

        private bool getReklama(string id)
        {
            bool flaga = false;

            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("SELECT * FROM reklama WHERE id=@id", user);

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
                dane[3] = dataSet.Tables[0].Rows[0]["czas"].ToString();
                dane[4] = dataSet.Tables[0].Rows[0]["zysk"].ToString();
                flaga = true;
            }
            return flaga;
        }
    }
}