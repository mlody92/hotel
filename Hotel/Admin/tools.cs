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

namespace Hotel.Admin
{
    public class tools : Page
    {

        public void sprawdzDostep()
        {
            if (Session["Admin_id"] != null)
            {

            }
            else
            {
                //Response.Redirect("login.aspx",false); 
                //Response.Redirect(ResolveUrl("http://www.google.pl"));
                Server.Transfer("~/Admin/login.aspx");
            }
        }


        public bool checkLoginAndPassword(string login, string password)
        {
            bool flagaLogin = false;
            bool flaga = false;

            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("SELECT * FROM uzytkownik WHERE login=@login AND uprawnienie='admin'", user);

            sql.Parameters.AddWithValue("@login", login);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flagaLogin = dataSet.Tables[0].Rows.Count > 0;
            if (flagaLogin.Equals(true))
            {
                if (dataSet.Tables[0].Rows[0]["password"].ToString() == new Hotel.tools.hash().CreateMD5(password))
                {
                    Session["Admin_id"] = dataSet.Tables[0].Rows[0]["id"].ToString();
                    Session["Admin_login"] = dataSet.Tables[0].Rows[0]["login"].ToString();

                    flaga = true;
                }
            }
            return flaga;
        }

        public void wylogujAdmina()
        {
            Session["Admin_login"] = null;
            Server.Transfer("~/Admin/login.aspx");
        }

        public String pobierzWszystkichUzytkownikow()
        {
            bool flaga = false;
            String ilosc = "";
            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("SELECT count(*) as ilosc FROM uzytkownik", user);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;
            if (flaga.Equals(true))
            {
                ilosc = dataSet.Tables[0].Rows[0]["ilosc"].ToString();
                flaga = true;
            }
            return ilosc;
        }


        public String pobierzUzytkownikow()
        {
            bool flaga = false;
            String ilosc = "";
            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("SELECT count(*) as ilosc FROM uzytkownik WHERE status='do akceptacji'", user);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;
            if (flaga.Equals(true))
            {
                ilosc = dataSet.Tables[0].Rows[0]["ilosc"].ToString();

                flaga = true;
            }
            return ilosc;
        }

        public void zmienStatusUzytkownika(int id, String status)
        {
            if (id != Convert.ToInt32(Session["Admin_id"]))
            {
                SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                {
                    SqlCommand xp = new SqlCommand("UPDATE uzytkownik SET status=@status WHERE id=@id", vid);
                    xp.Parameters.AddWithValue("@id", id);
                    xp.Parameters.AddWithValue("@status", status);
                    vid.Open();
                    xp.ExecuteNonQuery();
                    vid.Close();
                }
            }
        }

        public void updateUzytkownik(String id, String login, String uprawnienie, String imie, String nazwisko, String konto, String status)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE uzytkownik SET login=@login, uprawnienie=@uprawnienie, imie=@imie, nazwisko=@nazwisko, konto=@konto, status=@status WHERE id=@id", vid);
                xp.Parameters.AddWithValue("@id", id);
                xp.Parameters.AddWithValue("@login", login);
                xp.Parameters.AddWithValue("@uprawnienie", uprawnienie);
                xp.Parameters.AddWithValue("@imie", imie);
                xp.Parameters.AddWithValue("@nazwisko", nazwisko);
                xp.Parameters.AddWithValue("@konto", konto);
                xp.Parameters.AddWithValue("@status", status);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }



        public void usunUzytkownika(int id)
        {
            if (id != Convert.ToInt32(Session["Admin_id"]))
            {
                SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                {
                    SqlCommand xp = new SqlCommand("DELETE FROM atrakcja_pracownik WHERE (pracownik_id = (SELECT user_pracownik.id FROM user_pracownik JOIN dzialka_user ON user_pracownik.dzialka_id=dzialka_user.id WHERE dzialka_user.uzytkownik_id=@id)); DELETE FROM user_pokoj WHERE (dzialka_id = (SELECT id FROM dzialka_user WHERE uzytkownik_id=@id)); DELETE FROM user_pracownik WHERE (dzialka_id = (SELECT id FROM dzialka_user WHERE uzytkownik_id=@id)); DELETE FROM user_atrakcja WHERE (dzialka_id = (SELECT id FROM dzialka_user WHERE uzytkownik_id=@id)); DELETE FROM dzialka_user WHERE (uzytkownik_id = @id); DELETE FROM uzytkownik WHERE (id = @id);", vid);
                    xp.Parameters.AddWithValue("@id", id);
                    vid.Open();
                    xp.ExecuteNonQuery();
                    vid.Close();
                }
            }
        }

        public void zmienStatusDzialka(int id, String status)
        {

            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE dzialka SET status=@status WHERE id=@id", vid);
                xp.Parameters.AddWithValue("@id", id);
                xp.Parameters.AddWithValue("@status", status);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void usunDzialka(int id)
        {
                SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                {
                    SqlCommand xp = new SqlCommand("DELETE FROM dzialka WHERE (id = @id) AND 0=(SELECT count(*) from dzialka_user WHERE dzialka_user.dzialka_id=@id)", vid);
                    xp.Parameters.AddWithValue("@id", id);
                    vid.Open();
                    xp.ExecuteNonQuery();
                    vid.Close();
                }
        }

        public void usunDzialkaUser(int id)
        {
                SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                {
                    SqlCommand xp = new SqlCommand("DELETE FROM atrakcja_pracownik WHERE pracownik_id IN (SELECT user_pracownik.id FROM user_pracownik JOIN atrakcja_pracownik ON user_pracownik.id=atrakcja_pracownik.pracownik_id WHERE dzialka_id=@id); DELETE FROM user_pokoj WHERE (dzialka_id = @id); DELETE FROM user_pracownik WHERE (dzialka_id = @id); DELETE FROM user_atrakcja WHERE (dzialka_id = @id); DELETE FROM dzialka_user WHERE (id = @id)", vid);
                    xp.Parameters.AddWithValue("@id", id);
                    vid.Open();
                    xp.ExecuteNonQuery();
                    vid.Close();
                }
        }

        public void updateDzialka(String id, String nazwa, String atrakcyjnosc_id, String cena, String status, String id_miasto, String rodzaj_hotelu)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE dzialka SET nazwa=@nazwa, atrakcyjnosc_id=@atrakcyjnosc_id, cena=@cena, status=@status, id_miasto=@id_miasto, rodzaj_hotelu=@rodzaj_hotelu WHERE id=@id", vid);
                xp.Parameters.AddWithValue("@id", id);
                xp.Parameters.AddWithValue("@nazwa", nazwa);
                xp.Parameters.AddWithValue("@atrakcyjnosc_id", atrakcyjnosc_id);
                xp.Parameters.AddWithValue("@cena", cena);
                xp.Parameters.AddWithValue("@status", status);
                xp.Parameters.AddWithValue("@id_miasto", id_miasto);
                xp.Parameters.AddWithValue("@rodzaj_hotelu", rodzaj_hotelu);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void addDzialka(String nazwa, String atrakcyjnosc_id, String cena, String id_miasto, String rodzaj_hotelu)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("Insert into dzialka (nazwa,atrakcyjnosc_id,cena,id_miasto,rodzaj_hotelu) VALUES (@nazwa,@atrakcyjnosc_id,@cena, @id_miasto,@rodzaj_hotelu)", vid);
                xp.Parameters.AddWithValue("@nazwa", nazwa);
                xp.Parameters.AddWithValue("@atrakcyjnosc_id", atrakcyjnosc_id);
                xp.Parameters.AddWithValue("@cena", cena);
                xp.Parameters.AddWithValue("@id_miasto", id_miasto);
                xp.Parameters.AddWithValue("@rodzaj_hotelu", rodzaj_hotelu);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void addWojewodztwo(String nazwa)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("Insert into wojewodztwo (nazwa) VALUES (@nazwa)", vid);
                xp.Parameters.AddWithValue("@nazwa", nazwa);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void updateWojewodztwo(String id, String nazwa)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE wojewodztwo SET nazwa=@nazwa WHERE id=@id", vid);
                xp.Parameters.AddWithValue("@id", id);
                xp.Parameters.AddWithValue("@nazwa", nazwa);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void usunWojewodztwo(int id)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("DELETE FROM wojewodztwo WHERE id = @id AND (Select count(*) from miasto where id_wojewodztwo=@id)=0", vid);
                xp.Parameters.AddWithValue("@id", id);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public String pobierzMiastaWojewodztwa(int id)
        {
            bool flaga = false;
            String ilosc = "";
            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("Select count(*) as ilosc from miasto where id_wojewodztwo=@id", user);
            sql.Parameters.AddWithValue("@id", id);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;
            if (flaga.Equals(true))
            {
                ilosc = dataSet.Tables[0].Rows[0]["ilosc"].ToString();

                flaga = true;
            }
            return ilosc;
        }

        public void updateMiasto(String id, String nazwa)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE miasto SET nazwa=@nazwa WHERE id=@id", vid);
                xp.Parameters.AddWithValue("@id", id);
                xp.Parameters.AddWithValue("@nazwa", nazwa);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void usunMiasto(int id)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("DELETE FROM miasto WHERE id = @id AND (select count(*) from dzialka where id_miasto=@id)=0", vid);
                xp.Parameters.AddWithValue("@id", id);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public String pobierzHoteleMiasta(int id)
        {
            bool flaga = false;
            String ilosc = "";
            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("select count(*) as ilosc from dzialka where id_miasto=@id", user);
            sql.Parameters.AddWithValue("@id", id);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;
            if (flaga.Equals(true))
            {
                ilosc = dataSet.Tables[0].Rows[0]["ilosc"].ToString();

                flaga = true;
            }
            return ilosc;
        }

        public void addMiasto(String idWoj, String nazwa)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("Insert into miasto (nazwa,id_wojewodztwo) VALUES (@nazwa,@id_wojewodztwo)", vid);
                xp.Parameters.AddWithValue("@nazwa", nazwa);
                xp.Parameters.AddWithValue("@id_wojewodztwo", idWoj);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void addPracownik(String stanowisko, String pensja_min, String pensja_srednia, String ilosc_obslugiwanych)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("Insert into pracownik (stanowisko,pensja_min,pensja_srednia,ilosc_obslugiwanych) VALUES (@stanowisko,@pensja_min,@pensja_srednia,@ilosc_obslugiwanych)", vid);
                xp.Parameters.AddWithValue("@stanowisko", stanowisko);
                xp.Parameters.AddWithValue("@pensja_min", pensja_min);
                xp.Parameters.AddWithValue("@pensja_srednia", pensja_srednia);
                xp.Parameters.AddWithValue("@ilosc_obslugiwanych", ilosc_obslugiwanych);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void usunPracownika(int id)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("DELETE FROM pracownik WHERE id = @id AND 0=(select count(*) from user_pracownik where pracownik_id=@id) AND 0=(select count(*) from atrakcja where id_pracownik=@id) AND 0=(select count(*) from pokoj where id_pracownik=@id)", vid);
                xp.Parameters.AddWithValue("@id", id);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void usunPracownikaUser(int id)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("DELETE FROM atrakcja_pracownik WHERE pracownik_id=@id; DELETE FROM user_pracownik WHERE id = @id;", vid);
                xp.Parameters.AddWithValue("@id", id);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void updatePracownik(String id, String stanowisko, String pensja_min, String pensja_srednia, String ilosc_obslugiwanych)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE pracownik SET stanowisko=@stanowisko,pensja_min=@pensja_min,pensja_srednia=@pensja_srednia,ilosc_obslugiwanych=@ilosc_obslugiwanych WHERE id=@id", vid);
                xp.Parameters.AddWithValue("@id", id);
                xp.Parameters.AddWithValue("@stanowisko", stanowisko);
                xp.Parameters.AddWithValue("@pensja_min", pensja_min);
                xp.Parameters.AddWithValue("@pensja_srednia", pensja_srednia);
                xp.Parameters.AddWithValue("@ilosc_obslugiwanych", ilosc_obslugiwanych);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void zmienStatusKredyt(int id, String status)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE bank SET status=@status WHERE id=@id", vid);
                xp.Parameters.AddWithValue("@id", id);
                xp.Parameters.AddWithValue("@status", status);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void addKredyt(String nazwa, String kwota, String czas, String odsetki)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("Insert into bank (nazwa,kwota,czas,odsetki) VALUES (@nazwa,@kwota,@czas,@odsetki)", vid);
                xp.Parameters.AddWithValue("@nazwa", nazwa);
                xp.Parameters.AddWithValue("@kwota", kwota);
                xp.Parameters.AddWithValue("@czas", czas);
                xp.Parameters.AddWithValue("@odsetki", odsetki);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void usunKredyt(int id)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("DELETE FROM bank WHERE id = @id", vid);
                xp.Parameters.AddWithValue("@id", id);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void updateKredyt(String id, String nazwa, String kwota, String czas, String odsetki)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE bank SET nazwa=@nazwa,kwota=@kwota,czas=@czas,odsetki=@odsetki WHERE id=@id", vid);
                xp.Parameters.AddWithValue("@id", id);
                xp.Parameters.AddWithValue("@nazwa", nazwa);
                xp.Parameters.AddWithValue("@kwota", kwota);
                xp.Parameters.AddWithValue("@czas", czas);
                xp.Parameters.AddWithValue("@odsetki", odsetki);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void addPokoj(String rodzaj, String koszt, String zysk, String atrakcyjnosc_id, String id_pracownik)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("Insert into pokoj (rodzaj,koszt,zysk,atrakcyjnosc_id,id_pracownik) VALUES (@rodzaj,@koszt,@zysk,@atrakcyjnosc_id,@id_pracownik)", vid);
                xp.Parameters.AddWithValue("@rodzaj", rodzaj);
                xp.Parameters.AddWithValue("@koszt", koszt);
                xp.Parameters.AddWithValue("@zysk", zysk);
                xp.Parameters.AddWithValue("@atrakcyjnosc_id", atrakcyjnosc_id);
                xp.Parameters.AddWithValue("@id_pracownik", id_pracownik);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void updatePokoj(String id, String rodzaj, String koszt, String zysk, String status, String atrakcyjnosc_id, String id_pracownik)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE pokoj SET rodzaj=@rodzaj,koszt=@koszt,status=@status, zysk=@zysk, atrakcyjnosc_id=@atrakcyjnosc_id, id_pracownik=@id_pracownik WHERE id=@id", vid);
                xp.Parameters.AddWithValue("@id", id);
                xp.Parameters.AddWithValue("@rodzaj", rodzaj);
                xp.Parameters.AddWithValue("@koszt", koszt);
                xp.Parameters.AddWithValue("@status", status);
                xp.Parameters.AddWithValue("@zysk", zysk);
                xp.Parameters.AddWithValue("@atrakcyjnosc_id", atrakcyjnosc_id);
                xp.Parameters.AddWithValue("@id_pracownik", id_pracownik);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void usunPokoj(int id)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("DELETE FROM pokoj WHERE id = @id AND 0=(select count(*) from user_pokoj where pokoj_id=@id)", vid);
                xp.Parameters.AddWithValue("@id", id);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void usunPokojUser(int id)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("DELETE FROM user_pokoj WHERE id = @id", vid);
                xp.Parameters.AddWithValue("@id", id);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void usun(String tabela, int id)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("DELETE FROM " + tabela + " WHERE id = @id", vid);
                xp.Parameters.AddWithValue("@id", id);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void zmienStatus(int id, String table, String status)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE " + table + " SET status=@status WHERE id=@id", vid);
                xp.Parameters.AddWithValue("@id", id);
                xp.Parameters.AddWithValue("@status", status);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void addRodzajHotelu(String rodzaj)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("Insert into rodzaj_hotelu (rodzaj) VALUES (@rodzaj)", vid);
                xp.Parameters.AddWithValue("@rodzaj", rodzaj);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void usunRodzajHotelu(int id)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("DELETE FROM rodzaj_hotelu WHERE id = @id AND (select count(*) from dzialka where rodzaj_hotelu=@id)=0 AND (select count(*) from atrakcja where rodzaj_hotelu=@id)=0", vid);
                xp.Parameters.AddWithValue("@id", id);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void updateRodzajHotelu(String id, String rodzaj)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE rodzaj_hotelu SET rodzaj=@rodzaj WHERE id=@id", vid);
                xp.Parameters.AddWithValue("@id", id);
                xp.Parameters.AddWithValue("@rodzaj", rodzaj);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void addStopienAtr(String nazwa)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("Insert into atrakcyjnosc (nazwa) VALUES (@nazwa)", vid);
                xp.Parameters.AddWithValue("@nazwa", nazwa);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void usunStopienAtr(int id)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("DELETE FROM atrakcyjnosc WHERE id = @id AND (select count(*) from dzialka where atrakcyjnosc_id=@id)=0 AND (select count(*) from pokoj where atrakcyjnosc_id=@id)=0", vid);
                xp.Parameters.AddWithValue("@id", id);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void updateStopienAtr(String id, String nazwa)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE atrakcyjnosc SET nazwa=@nazwa WHERE id=@id", vid);
                xp.Parameters.AddWithValue("@id", id);
                xp.Parameters.AddWithValue("@nazwa", nazwa);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void updateMoney(String konto)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE uzytkownik SET konto=@konto", vid);
                xp.Parameters.AddWithValue("@konto", konto);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void addAttraction(String nazwa, String koszt, String koszt_miesieczny, String rodzaj_hotelu, String ilosc, String procent, String id_pracownik)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("Insert into atrakcja (nazwa,koszt,koszt_miesieczny,rodzaj_hotelu,procent,ilosc,id_pracownik) VALUES (@nazwa,@koszt,@koszt_miesieczny,@rodzaj_hotelu,@procent,@ilosc, @id_pracownik)", vid);
                xp.Parameters.AddWithValue("@nazwa", nazwa);
                xp.Parameters.AddWithValue("@koszt", koszt);
                xp.Parameters.AddWithValue("@koszt_miesieczny", koszt_miesieczny);
                xp.Parameters.AddWithValue("@rodzaj_hotelu", rodzaj_hotelu);
                xp.Parameters.AddWithValue("@procent", procent);
                xp.Parameters.AddWithValue("@ilosc", ilosc);
                xp.Parameters.AddWithValue("@id_pracownik", id_pracownik);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void updateAttraction(String id, String nazwa, String koszt, String koszt_miesieczny, String rodzaj_hotelu, String procent, String ilosc, String id_pracownik)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE atrakcja SET nazwa=@nazwa,koszt=@koszt,koszt_miesieczny=@koszt_miesieczny,rodzaj_hotelu=@rodzaj_hotelu,procent=@procent,ilosc=@ilosc, id_pracownik=@id_pracownik WHERE id=@id", vid);
                xp.Parameters.AddWithValue("@id", id);
                xp.Parameters.AddWithValue("@nazwa", nazwa);
                xp.Parameters.AddWithValue("@koszt", koszt);
                xp.Parameters.AddWithValue("@koszt_miesieczny", koszt_miesieczny);
                xp.Parameters.AddWithValue("@rodzaj_hotelu", rodzaj_hotelu);
                xp.Parameters.AddWithValue("@procent", procent);
                xp.Parameters.AddWithValue("@ilosc", ilosc);
                xp.Parameters.AddWithValue("@id_pracownik", id_pracownik);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void usunAttraction(int id)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("DELETE FROM atrakcja WHERE id = @id AND 0=(select count(*) from user_atrakcja where atrakcja_id=@id)", vid);
                xp.Parameters.AddWithValue("@id", id);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void usunAttractionUser(int id)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("DELETE FROM atrakcja_pracownik WHERE atrakcja_id=@id;DELETE FROM user_atrakcja WHERE id = @id", vid);
                xp.Parameters.AddWithValue("@id", id);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void addReklama(String nazwa, String koszt, String czas, String zysk)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("Insert into reklama (nazwa,koszt, czas, zysk) VALUES (@nazwa,@koszt,@czas,@zysk)", vid);
                xp.Parameters.AddWithValue("@nazwa", nazwa);
                xp.Parameters.AddWithValue("@koszt", koszt);
                xp.Parameters.AddWithValue("@czas", czas);
                xp.Parameters.AddWithValue("@zysk", zysk);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void updateReklama(String id, String nazwa, String koszt, String czas, String zysk)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE reklama SET nazwa=@nazwa,koszt=@koszt, czas=@czas,zysk=@zysk WHERE id=@id", vid);
                xp.Parameters.AddWithValue("@id", id);
                xp.Parameters.AddWithValue("@nazwa", nazwa);
                xp.Parameters.AddWithValue("@koszt", koszt);
                xp.Parameters.AddWithValue("@czas", czas);
                xp.Parameters.AddWithValue("@zysk", zysk);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void usunReklama(int id)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("DELETE FROM reklama WHERE id = @id AND (select count(*) from user_reklama where reklama_id=@id)=0", vid);
                xp.Parameters.AddWithValue("@id", id);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }
        public void usunReklamaUser(int id)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("DELETE FROM user_reklama WHERE id = @id", vid);
                xp.Parameters.AddWithValue("@id", id);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }
    }
}