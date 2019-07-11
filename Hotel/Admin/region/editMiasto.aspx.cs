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

namespace Hotel.Admin.region
{
    public partial class editMiasto : System.Web.UI.Page
    {
        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        String[] dane = new String[2];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_id_miasto"] != null)
            {
                if (getMiasto(Session["Admin_id_miasto"].ToString()) == true)
                {
                    idLabel.Text = dane[0];
                    nazwaTextBox.Attributes.Add("placeholder", dane[1]);

                }
                else
                {
                    komunikatLabel.Visible = true;
                    komunikatLabel.Text = "Nie pobrano danych miasta.";
                }
            }
            else Server.Transfer("~/Admin/region/manageMiasto.aspx");
        }

        protected void zapiszButton_Click(object sender, EventArgs e)
        {
            checkBox();
            tools.updateMiasto(dane[0], nazwaTextBox.Text);
            komunikatLabel.Visible = true;
            komunikatLabel.Text = "Poprawnie zmieniono dane.";
        }

        protected void powrotLinkButton_Click(object sender, EventArgs e)
        {
            Session["Admin_id_miasto"] = null;
            Server.Transfer("~/Admin/region/manageMiasto.aspx");
        }

        private void checkBox()
        {
            if (nazwaTextBox.Text == "")
            {
                nazwaTextBox.Text = dane[1];
            }
        }

        private bool getMiasto(string id)
        {
            bool flaga = false;

            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("SELECT * FROM miasto WHERE id=@id", user);

            sql.Parameters.AddWithValue("@id", id);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;
            if (flaga.Equals(true))
            {
                dane[0] = dataSet.Tables[0].Rows[0]["id"].ToString();
                dane[1] = dataSet.Tables[0].Rows[0]["nazwa"].ToString();
                flaga = true;
            }
            return flaga;
        }
    }
}