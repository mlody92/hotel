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

namespace Hotel.Admin.hotels
{
    public partial class edit : System.Web.UI.Page
    {
        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        String[] dane = new String[8];
        String miastoDane;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_id_dzialka"] != null)
            {
                miastoTr.Visible = false;
                if (getDzialka(Session["Admin_id_dzialka"].ToString()) == true)
                {

                    idLabel.Text = dane[0];
                    nameTextBox.Attributes.Add("placeholder", dane[1]);
                    cenaTextBox.Attributes.Add("placeholder", dane[3]);

                    if (!IsPostBack)
                    {
                        statusDropDownList.Text = dane[4];
                    }

                    if (wojDropDownList.SelectedItem.Value != "-1")
                    {
                        miastoTr.Visible = true;
                    }
                }
                else
                {
                    komunikatLabel.Visible = true;
                    komunikatLabel.Text = "Nie pobrano danych.";
                }
            }
            else Server.Transfer("~/Admin/dzialka/manage.aspx");
        }

        protected void zapiszButton_Click(object sender, EventArgs e)
        {
            checkBox();
            tools.updateDzialka(dane[0], nameTextBox.Text, atrakcyjnoscDropDownList.SelectedItem.Value, cenaTextBox.Text, statusDropDownList.SelectedItem.Text, miastoDane, hotelDropDownList.SelectedItem.Value);
            komunikatLabel.Visible = true;
            komunikatLabel.Text = "Poprawnie zmieniono dane.";
        }

        protected void powrotLinkButton_Click(object sender, EventArgs e)
        {
            Session["Admin_id_dzialka"] = null;
            Server.Transfer("~/Admin/dzialka/manage.aspx");
        }

        private void checkBox()
        {
            if (nameTextBox.Text == "")
            {
                nameTextBox.Text = dane[1];

            }

            if ((atrakcyjnoscDropDownList.SelectedItem.Value).ToString() == "-1")
            {
                atrakcyjnoscDropDownList.SelectedItem.Value = dane[2];
            }

            if (cenaTextBox.Text == "")
            {
                cenaTextBox.Text = dane[3];
            }

            if (miastoDropDownList.SelectedItem == null)
            {
                miastoDane = dane[5];
            }
            else miastoDane = miastoDropDownList.SelectedItem.Value;

            if ((hotelDropDownList.SelectedItem.Value).ToString() == "-1")
            {
                hotelDropDownList.SelectedItem.Value = dane[6];
            }

        }

        private bool getDzialka(string id)
        {
            bool flaga = false;

            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("SELECT * FROM dzialka WHERE id=@id", user);

            sql.Parameters.AddWithValue("@id", id);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;
            if (flaga.Equals(true))
            {
                dane[0] = dataSet.Tables[0].Rows[0]["id"].ToString();
                dane[1] = dataSet.Tables[0].Rows[0]["nazwa"].ToString();
                dane[2] = dataSet.Tables[0].Rows[0]["atrakcyjnosc_id"].ToString();
                dane[3] = dataSet.Tables[0].Rows[0]["cena"].ToString();
                dane[4] = dataSet.Tables[0].Rows[0]["status"].ToString();
                dane[5] = dataSet.Tables[0].Rows[0]["id_miasto"].ToString();
                dane[6] = dataSet.Tables[0].Rows[0]["rodzaj_hotelu"].ToString();

                flaga = true;
            }
            return flaga;
        }

    }
}