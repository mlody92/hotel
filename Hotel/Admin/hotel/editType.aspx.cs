﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Hotel.Admin.dzialka
{
    public partial class editType : System.Web.UI.Page
    {
        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        String[] dane = new String[2];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_id_rodzajHotelu"] != null)
            {
                if (getRodzajHotelu(Session["Admin_id_rodzajHotelu"].ToString()) == true)
                {
                    idLabel.Text = dane[0];
                    nameTextBox.Attributes.Add("placeholder", dane[1]);
                }
                else
                {
                    komunikatLabel.Visible = true;
                    komunikatLabel.Text = "Nie pobrano danych.";
                }
            }
            else Server.Transfer("~/Admin/hotel/manageType.aspx");
        }

        protected void addLinkButton_Click(object sender, EventArgs e)
        {
            checkBox();
            tools.updateRodzajHotelu(dane[0], nameTextBox.Text);
            komunikatLabel.Visible = true;
            komunikatLabel.Text = "Poprawnie zmieniono dane.";
        }

        protected void powrotLinkButton_Click(object sender, EventArgs e)
        {
            Session["Admin_id_pokoj"] = null;
            Server.Transfer("~/Admin/hotel/manageType.aspx");
        }

        private void checkBox()
        {
            if (nameTextBox.Text == "")
            {
                nameTextBox.Text = dane[1];
            }
        }

        private bool getRodzajHotelu(string id)
        {
            bool flaga = false;

            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("SELECT * FROM rodzaj_hotelu WHERE id=@id", user);

            sql.Parameters.AddWithValue("@id", id);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;
            if (flaga.Equals(true))
            {
                dane[0] = dataSet.Tables[0].Rows[0]["id"].ToString();
                dane[1] = dataSet.Tables[0].Rows[0]["rodzaj"].ToString();
                flaga = true;
            }
            return flaga;
        }
    }
}