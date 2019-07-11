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

namespace Hotel.Admin.users
{
    public partial class editUser : System.Web.UI.Page
    {
        Hotel.Admin.tools tools = new Hotel.Admin.tools();
        String[] dane = new String[10];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_id_uzytkownika"] != null)
            {
                if (getUsers(Session["Admin_id_uzytkownika"].ToString()) == true)
                {

                    idLabel.Text = dane[0];
                    loginTextBox.Attributes.Add("placeholder", dane[1]);
                    imieTextBox.Attributes.Add("placeholder", dane[3]);
                    nazwiskoTextBox.Attributes.Add("placeholder", dane[4]);
                    kontoTextBox.Attributes.Add("placeholder", dane[5]);
                    if (!IsPostBack)
                    {
                        uprawnienieDropDownList.Text = dane[2];
                        statusDropDownList.Text = dane[6];
                    }
                }
                else
                {
                    komunikatLabel.Visible = true;
                    komunikatLabel.Text = "Nie pobrano danych użytkownika.";
                }
            }
            else Server.Transfer("~/Admin/users/manageUsers.aspx");
        }

        protected void zapiszButton_Click(object sender, EventArgs e)
        {
            checkBox();
            tools.updateUzytkownik(dane[0], loginTextBox.Text, uprawnienieDropDownList.SelectedItem.Text, imieTextBox.Text, nazwiskoTextBox.Text, kontoTextBox.Text, statusDropDownList.SelectedItem.Text);
            komunikatLabel.Visible = true;
            komunikatLabel.Text = "Poprawnie zmieniono dane.";
        }

        protected void powrotLinkButton_Click(object sender, EventArgs e)
        {
            Session["Admin_id_uzytkownika"] = null;
            Server.Transfer("~/Admin/users/manageUsers.aspx");
        }

        private void checkBox()
        {
            if (loginTextBox.Text == "")
            {
                loginTextBox.Text = dane[1];
            }

            if (imieTextBox.Text == "")
            {
                imieTextBox.Text = dane[3];
            }

            if (nazwiskoTextBox.Text == "")
            {
                nazwiskoTextBox.Text = dane[4];
            }
            if (kontoTextBox.Text == "")
            {
                kontoTextBox.Text = dane[5];
            }
        }

        private bool getUsers(string id)
        {
            bool flaga = false;

            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("SELECT id,login,uprawnienie,imie,nazwisko,konto,status FROM uzytkownik WHERE id=@id", user);

            sql.Parameters.AddWithValue("@id", id);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;
            if (flaga.Equals(true))
            {
                dane[0] = dataSet.Tables[0].Rows[0]["id"].ToString();
                dane[1] = dataSet.Tables[0].Rows[0]["login"].ToString();
                dane[2] = dataSet.Tables[0].Rows[0]["uprawnienie"].ToString();
                dane[3] = dataSet.Tables[0].Rows[0]["imie"].ToString();
                dane[4] = dataSet.Tables[0].Rows[0]["nazwisko"].ToString();
                dane[5] = dataSet.Tables[0].Rows[0]["konto"].ToString();
                dane[6] = dataSet.Tables[0].Rows[0]["status"].ToString();

                flaga = true;
            }
            return flaga;
        }
    }
}