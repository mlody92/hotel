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
    public class tools : Page
    {
        public String[] pobierzDzialke(int id)
        {
            bool flaga = false;
            String[] dane = new String[3];
            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("Select * from dzialka where id=@id", user);
            sql.Parameters.AddWithValue("@id", id);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;
            if (flaga.Equals(true))
            {
                dane[0] = dataSet.Tables[0].Rows[0]["cena"].ToString();
                dane[1] = dataSet.Tables[0].Rows[0]["status"].ToString();

            }
            return dane;
        }

        public void kupDzialka(int dzialka_id, String uzytkownik_id, int konto)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("Insert into dzialka_user (dzialka_id,uzytkownik_id) VALUES (@dzialka_id,@uzytkownik_id); UPDATE uzytkownik SET konto=konto-@konto WHERE id=@uzytkownik_id; IF (NOT EXISTS(SELECT * FROM tmp_raport WHERE id_uzytkownika=@uzytkownik_id)) BEGIN INSERT INTO tmp_raport(id_uzytkownika,dzialka) VALUES(@uzytkownik_id, @konto) END ELSE BEGIN UPDATE tmp_raport SET dzialka = dzialka+@konto WHERE id_uzytkownika=@uzytkownik_id END", vid);
                xp.Parameters.AddWithValue("@dzialka_id", dzialka_id);
                xp.Parameters.AddWithValue("@uzytkownik_id", uzytkownik_id);
                xp.Parameters.AddWithValue("@konto", konto);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }

        }

        public void updateKonto(String id, String konto)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE uzytkownik SET konto=@konto WHERE id=@id", vid);
                xp.Parameters.AddWithValue("@id", id);
                xp.Parameters.AddWithValue("@konto", konto);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public String[] pobierzKredyt(int id)
        {
            bool flaga = false;
            String[] dane = new String[3];
            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("Select COALESCE(SUM(kwota),0) as suma from bank where id_uzytkownika=@id AND czas>0", user);
            sql.Parameters.AddWithValue("@id", id);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;
            if (flaga.Equals(true))
            {
                dane[0] = dataSet.Tables[0].Rows[0]["suma"].ToString();
            }
            return dane;
        }

        public void wezKredyt(int kwota, int odsetki, int czas, String id_uzytkownika)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("Insert into bank (kwota,odsetki,czas,id_uzytkownika) VALUES (@kwota,@odsetki, @czas,@id_uzytkownika); UPDATE uzytkownik SET konto=konto+@kwota WHERE id=@id_uzytkownika", vid);
                xp.Parameters.AddWithValue("@kwota", kwota);
                xp.Parameters.AddWithValue("@odsetki", odsetki);
                xp.Parameters.AddWithValue("@czas", czas);
                xp.Parameters.AddWithValue("@id_uzytkownika", id_uzytkownika);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void dodajRaport(int i)
        {
            String sql = "INSERT INTO raport (id_uzytkownika,dzialka,pensja,atrakcje,reklama,pokoj,bank,zysk, ilosc_pracownikow, ilosc_pokoi, ilosc_atrakcji, ilosc_dzialek, ilosc_kredytow,stan_konta, czas) SELECT id_uzytkownika,dzialka,pensja,atrakcje,reklama,pokoj,bank,zysk,(SELECT count(user_pracownik.id) from user_pracownik inner join dzialka_user on user_pracownik.dzialka_id=dzialka_user.id where dzialka_user.uzytkownik_id=id_uzytkownika),(SELECT count(user_pokoj.id) from user_pokoj inner join dzialka_user on user_pokoj.dzialka_id=dzialka_user.id where dzialka_user.uzytkownik_id=id_uzytkownika),(SELECT count(user_atrakcja.id) from user_atrakcja inner join dzialka_user on user_atrakcja.dzialka_id=dzialka_user.id where dzialka_user.uzytkownik_id=id_uzytkownika), (SELECT count(*) from dzialka_user where uzytkownik_id=id_uzytkownika), (SELECT count(*) from bank where id_uzytkownika=id_uzytkownika AND czas>0), (SELECT konto FROM uzytkownik WHERE id=id_uzytkownika)," + i + " FROM tmp_raport; UPDATE tmp_raport set dzialka=0,pensja=0,atrakcje=0,reklama=0,pokoj=0,bank=0,zysk=0";
            doSql(sql);
        }

        public void splacanieRat()
        {
            bool flaga = false;
            int[] dane = new int[5];
            String sqlCommand = "";
            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("SELECT * FROM bank", user);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;
            if (flaga.Equals(true))
            {
                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    dane[0] = (int)dataSet.Tables[0].Rows[i]["id"];
                    dane[1] = (int)dataSet.Tables[0].Rows[i]["kwota"];
                    dane[2] = (int)dataSet.Tables[0].Rows[i]["odsetki"];
                    dane[3] = (int)dataSet.Tables[0].Rows[i]["czas"];
                    dane[4] = (int)dataSet.Tables[0].Rows[i]["id_uzytkownika"];
                    if (dane[3] > 0)
                    {
                        sqlCommand += "UPDATE uzytkownik SET konto=konto-" + dane[2] + " WHERE id=" + dane[4] + ";";
                        sqlCommand += "UPDATE bank SET czas=czas-1 WHERE id=" + dane[0] + ";";
                        sqlCommand += "IF (NOT EXISTS(SELECT * FROM tmp_raport WHERE id_uzytkownika=" + dane[4] + ")) BEGIN INSERT INTO tmp_raport(id_uzytkownika,bank) VALUES(" + dane[4] + ", " + dane[2] + ") END ELSE BEGIN UPDATE tmp_raport SET bank = bank+" + dane[2] + " WHERE id_uzytkownika=" + dane[4] + " END;";
                    }
                }

                doSql(sqlCommand);
            }
        }

        public void zatrudnij(int dzialka_id, int pracownik_id, int pensja_user, int uzytkownik_id)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("Insert into user_pracownik (dzialka_id,pracownik_id,pensja_user, pensja_user_tmp) VALUES (@dzialka_id,@pracownik_id,@pensja_user,@pensja_user); UPDATE uzytkownik SET konto=konto-@pensja_user WHERE id=@uzytkownik_id; IF (NOT EXISTS(SELECT * FROM tmp_raport WHERE id_uzytkownika=@uzytkownik_id)) BEGIN INSERT INTO tmp_raport(id_uzytkownika,pensja) VALUES(@uzytkownik_id, @pensja_user) END ELSE BEGIN UPDATE tmp_raport SET pensja = pensja+@pensja_user WHERE id_uzytkownika=@uzytkownik_id END", vid);
                xp.Parameters.AddWithValue("@dzialka_id", dzialka_id);
                xp.Parameters.AddWithValue("@pracownik_id", pracownik_id);
                xp.Parameters.AddWithValue("@pensja_user", pensja_user);
                xp.Parameters.AddWithValue("@uzytkownik_id", uzytkownik_id);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }

        }

        public void zbuduj(int dzialka_id, int atrakcja_id, int koszt, int uzytkownik_id)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("Insert into user_atrakcja (atrakcja_id,dzialka_id) VALUES (@atrakcja_id,@dzialka_id); UPDATE uzytkownik SET konto=konto-@koszt WHERE id=@uzytkownik_id; IF (NOT EXISTS(SELECT * FROM tmp_raport WHERE id_uzytkownika=@uzytkownik_id)) BEGIN INSERT INTO tmp_raport(id_uzytkownika,atrakcje) VALUES(@uzytkownik_id, @koszt) END ELSE BEGIN UPDATE tmp_raport SET atrakcje = atrakcje+@koszt WHERE id_uzytkownika=@uzytkownik_id END", vid);
                xp.Parameters.AddWithValue("@dzialka_id", dzialka_id);
                xp.Parameters.AddWithValue("@atrakcja_id", atrakcja_id);
                xp.Parameters.AddWithValue("@koszt", koszt);
                xp.Parameters.AddWithValue("@uzytkownik_id", uzytkownik_id);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void przydzielPracownika(int atrakcja_id, int pracownik_id)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("Insert into atrakcja_pracownik (atrakcja_id,pracownik_id) VALUES (@atrakcja_id,@pracownik_id)", vid);
                xp.Parameters.AddWithValue("@atrakcja_id", atrakcja_id);
                xp.Parameters.AddWithValue("@pracownik_id", pracownik_id);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public Boolean sprawdzDostepPracownika(int id)
        {
            bool flaga = false;
            String[] dane = new String[3];
            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("select count(*) as ilosc from atrakcja_pracownik inner join user_pracownik ON atrakcja_pracownik.pracownik_id=user_pracownik.id where atrakcja_pracownik.pracownik_id=@id", user);
            sql.Parameters.AddWithValue("@id", id);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;
            if (flaga.Equals(true))
            {
                dane[0] = dataSet.Tables[0].Rows[0]["ilosc"].ToString();
            }
            if (Int32.Parse(dane[0]) == 0)
            {
                return true;
            }
            else return false;
        }

        public void zbudujPokoj(String dzialka_id, int pokoj_id, int koszt, int uzytkownik_id, int cena_user)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("Insert into user_pokoj (pokoj_id,dzialka_id,cena_user) VALUES (@pokoj_id,@dzialka_id,@cena_user); UPDATE uzytkownik SET konto=konto-@koszt WHERE id=@uzytkownik_id; IF (NOT EXISTS(SELECT * FROM tmp_raport WHERE id_uzytkownika=@uzytkownik_id)) BEGIN INSERT INTO tmp_raport(id_uzytkownika,pokoj) VALUES(@uzytkownik_id, @koszt) END ELSE BEGIN UPDATE tmp_raport SET pokoj = pokoj+@koszt WHERE id_uzytkownika=@uzytkownik_id END", vid);
                xp.Parameters.AddWithValue("@dzialka_id", dzialka_id);
                xp.Parameters.AddWithValue("@pokoj_id", pokoj_id);
                xp.Parameters.AddWithValue("@koszt", koszt);
                xp.Parameters.AddWithValue("@uzytkownik_id", uzytkownik_id);
                xp.Parameters.AddWithValue("@cena_user", cena_user);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void zmienCenePokoju(String id, String cena_user)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE user_pokoj SET cena_user=@cena_user WHERE id=@id", vid);
                xp.Parameters.AddWithValue("@id", id);
                xp.Parameters.AddWithValue("@cena_user", cena_user);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void zmienPensjePracownika(String id, String pensja_user_tmp)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE user_pracownik SET pensja_user_tmp=@pensja_user_tmp WHERE id=@id", vid);
                xp.Parameters.AddWithValue("@id", id);
                xp.Parameters.AddWithValue("@pensja_user_tmp", pensja_user_tmp);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void ustalWszystkiePensje()
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE user_pracownik SET pensja_user=pensja_user_tmp", vid);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public void kupReklama(String user_id, String reklama_id, String czas, String koszt)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("Insert into user_reklama (user_id,reklama_id,czas) VALUES (@user_id,@reklama_id,@czas); UPDATE uzytkownik SET konto=konto-@koszt WHERE id=@user_id; IF (NOT EXISTS(SELECT * FROM tmp_raport WHERE id_uzytkownika=@user_id)) BEGIN INSERT INTO tmp_raport(id_uzytkownika,reklama) VALUES(@user_id, @koszt) END ELSE BEGIN UPDATE tmp_raport SET reklama = reklama+@koszt WHERE id_uzytkownika=@user_id END", vid);
                xp.Parameters.AddWithValue("@user_id", user_id);
                xp.Parameters.AddWithValue("@reklama_id", reklama_id);
                xp.Parameters.AddWithValue("@czas", czas);
                xp.Parameters.AddWithValue("@koszt", koszt);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }


        public int[,] getDzialkaUser()
        {
            bool flaga = false;
            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("SELECT id,uzytkownik_id FROM dzialka_user", user);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;
            int[,] dane = new int[dataSet.Tables[0].Rows.Count, 2];
            if (flaga.Equals(true))
            {
                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    dane[i, 0] = Int32.Parse(dataSet.Tables[0].Rows[i]["id"].ToString());
                    dane[i, 1] = Int32.Parse(dataSet.Tables[0].Rows[i]["uzytkownik_id"].ToString());
                }
            }
            return dane;
        }

        public int getUserReklama(int user_id)
        {
            bool flaga = false;
            int dana = 0;
            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            SqlCommand sql = new SqlCommand("select COALESCE(sum(reklama.zysk),0) as zysk from user_reklama JOIN reklama ON reklama.id=user_reklama.reklama_id where user_reklama.user_id=@user_id AND user_reklama.czas>0", user);
            sql.Parameters.AddWithValue("@user_id", user_id);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;

            if (flaga.Equals(true))
            {
                dana = Int32.Parse(dataSet.Tables[0].Rows[0]["zysk"].ToString());
            }
            return dana;
        }

        public int[,] getRodzajePokoi()
        {
            bool flaga = false;
            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("SELECT id,zysk from pokoj", user);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;
            int[,] dane = new int[dataSet.Tables[0].Rows.Count, 2];
            if (flaga.Equals(true))
            {
                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    dane[i, 0] = Int32.Parse(dataSet.Tables[0].Rows[i]["id"].ToString());
                    dane[i, 1] = Int32.Parse(dataSet.Tables[0].Rows[i]["zysk"].ToString());
                }
            }

            return dane;
        }

        public void wyplacPensje()
        {
            bool flaga = false;
            String sqlText = "";
            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            SqlCommand sql = new SqlCommand("select SUM(user_pracownik.pensja_user) as kwota, dzialka_user.uzytkownik_id FROM user_pracownik INNER JOIN dzialka_user ON user_pracownik.dzialka_id=dzialka_user.id GROUP BY  dzialka_user.uzytkownik_id", user);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;
            int[,] dane = new int[dataSet.Tables[0].Rows.Count, 2];
            if (flaga.Equals(true))
            {
                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    dane[i, 0] = Int32.Parse(dataSet.Tables[0].Rows[i]["kwota"].ToString());
                    dane[i, 1] = Int32.Parse(dataSet.Tables[0].Rows[i]["uzytkownik_id"].ToString());
                    sqlText += "UPDATE uzytkownik SET konto=konto-" + dane[i, 0] + "WHERE id=" + dane[i, 1] + ";";
                    sqlText += "IF (NOT EXISTS(SELECT * FROM tmp_raport WHERE id_uzytkownika=" + dane[i, 1] + ")) BEGIN INSERT INTO tmp_raport(id_uzytkownika,pensja) VALUES(" + dane[i, 1] + ", " + dane[i, 0] + ") END ELSE BEGIN UPDATE tmp_raport SET pensja = pensja+" + dane[i, 0] + " WHERE id_uzytkownika=" + dane[i, 1] + " END;";
                }
            }
            doSql(sqlText);
        }

        //Jeśli pensja minimalna jest mniejsza od pensji ustalonej przez uzytkownika to nie zlicza procownika
        public float[] ustalProcentDzialki(int dzialka_user)
        {
            bool flaga = false;
            float[] dane = new float[3];
            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("SELECT atrakcja.koszt_miesieczny, atrakcja.procent,atrakcja.ilosc ,(SELECT COUNT(*) AS Expr1 FROM atrakcja_pracownik INNER JOIN user_atrakcja ON user_atrakcja.id = atrakcja_pracownik.atrakcja_id INNER JOIN user_pracownik ON user_pracownik.id=atrakcja_pracownik.pracownik_id INNER JOIN pracownik ON pracownik.id=user_pracownik.pracownik_id WHERE (user_atrakcja.id = user_atrakcja_1.id) AND user_pracownik.pensja_user>pracownik.pensja_min) AS ilosc_prac FROM dzialka_user INNER JOIN user_atrakcja AS user_atrakcja_1 ON dzialka_user.id = user_atrakcja_1.dzialka_id INNER JOIN atrakcja ON user_atrakcja_1.atrakcja_id = atrakcja.id INNER JOIN pracownik ON atrakcja.id_pracownik = pracownik.id WHERE (dzialka_user.id = @dzialka_user) AND atrakcja.ilosc>0;", user);
            sql.Parameters.AddWithValue("@dzialka_user", dzialka_user);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;
            if (flaga.Equals(true))
            {
                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    dane[0] += float.Parse(dataSet.Tables[0].Rows[i]["koszt_miesieczny"].ToString());
                    dane[1] += float.Parse(dataSet.Tables[0].Rows[i]["procent"].ToString()) * float.Parse(dataSet.Tables[0].Rows[i]["ilosc_prac"].ToString()) / float.Parse(dataSet.Tables[0].Rows[i]["ilosc"].ToString());

                }
            }
            return dane;
        }

        public int[] getPokojeDzialka(int dzialka_user, int pokoj_id)
        {
            bool flaga = false;
            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("select user_pokoj.id as pokId,cena_user, pokoj.zysk from user_pokoj INNER JOIN pokoj ON pokoj.id=user_pokoj.pokoj_id WHERE dzialka_id=@dzialka_user AND pokoj.id=@pokoj_id", user);
            sql.Parameters.AddWithValue("@dzialka_user", dzialka_user);
            sql.Parameters.AddWithValue("@pokoj_id", pokoj_id);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;
            int[] dane = new int[dataSet.Tables[0].Rows.Count];
            if (flaga.Equals(true))
            {
                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    if (Int32.Parse(dataSet.Tables[0].Rows[i]["zysk"].ToString()) * 1.2 > Int32.Parse(dataSet.Tables[0].Rows[i]["cena_user"].ToString()))
                    {
                        dane[i] = Int32.Parse(dataSet.Tables[0].Rows[i]["cena_user"].ToString());
                    }
                    else dane[i] = 0;
                }
            }
            return dane;
        }

        public void updateKontoZysk(int id, int zysk)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            {
                SqlCommand xp = new SqlCommand("UPDATE uzytkownik SET konto=konto+@zysk WHERE id=@id", vid);
                xp.Parameters.AddWithValue("@id", id);
                xp.Parameters.AddWithValue("@zysk", zysk);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }



        public float[] getPracPokoj(int dzialka_user)
        {
            bool flaga = false;
            float[] dane = new float[2];
            SqlConnection user = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

            SqlCommand sql = new SqlCommand("SELECT (count(distinct(user_pracownik.id))*COALESCE(SUM(DISTINCT(pracownik.ilosc_obslugiwanych)),0) )as ilosc_obslugiwanych, (Select count(*) from user_pokoj where dzialka_id=25) as ilosc_pokoi FROM pracownik JOIN user_pracownik ON pracownik.id=user_pracownik.pracownik_id JOIN pokoj ON pokoj.id_pracownik=pracownik.id JOIN user_pokoj ON user_pokoj.pokoj_id=pokoj.id WHERE user_pracownik.dzialka_id=25;", user);
            sql.Parameters.AddWithValue("@dzialka_user", dzialka_user);
            SqlDataAdapter datauser = new SqlDataAdapter(sql);
            DataSet dataSet = new DataSet();
            datauser.Fill(dataSet);
            flaga = dataSet.Tables[0].Rows.Count > 0;

            if (flaga.Equals(true))
            {
                dane[0] = float.Parse(dataSet.Tables[0].Rows[0]["ilosc_obslugiwanych"].ToString());
                dane[1] = float.Parse(dataSet.Tables[0].Rows[0]["ilosc_pokoi"].ToString());

            }
            return dane;
        }

        public void zyskDzienny()
        {
            int procent = 30;
            float[] daneProcentDzialki;
            float[] daneProcentPokoje;
            int[,] rodzajPokoi = getRodzajePokoi();
            int[,] daneDzialkaUser = getDzialkaUser();
            String sql = "";
            for (int i = 0; i < rodzajPokoi.Length / 2; i++)
            {
                int[] listaProcent = losowanie(100);
                for (int j = 0; j < daneDzialkaUser.Length / 2; j++)
                {
                    int zyskReklama = getUserReklama(daneDzialkaUser[j, 1]);
                    int zyskKoncowy = 0;
                    daneProcentPokoje = getPracPokoj(daneDzialkaUser[j, 0]);
                    float procentPokojPracownik = daneProcentPokoje[0] / daneProcentPokoje[1];
                    if (procentPokojPracownik > 1)
                    {
                        procentPokojPracownik = 1;
                    }
                    daneProcentDzialki = ustalProcentDzialki(daneDzialkaUser[j, 0]);


                    int[] zyskPokoj = getPokojeDzialka(daneDzialkaUser[j, 0], rodzajPokoi[i, 0]);
                    for (int l = 0; l < zyskPokoj.Length; l++)
                    {
                        if (procentPokojPracownik * (procent + daneProcentDzialki[1] + zyskReklama) >= listaProcent[l])
                        {
                            zyskKoncowy += zyskPokoj[l];
                        }
                    }
                    if (zyskKoncowy != 0)
                    {
                        sql += "UPDATE uzytkownik SET konto=konto+" + zyskKoncowy + " WHERE id=" + daneDzialkaUser[j, 1] + ";";
                        sql += "IF (NOT EXISTS(SELECT * FROM tmp_raport WHERE id_uzytkownika=" + daneDzialkaUser[j, 1] + ")) BEGIN INSERT INTO tmp_raport(id_uzytkownika,zysk) VALUES(" + daneDzialkaUser[j, 1] + ", " + zyskKoncowy + ") END ELSE BEGIN UPDATE tmp_raport SET zysk = zysk+" + zyskKoncowy + " WHERE id_uzytkownika=" + daneDzialkaUser[j, 1] + " END;";
                    }
                }
            }
            sql += "UPDATE user_reklama SET czas=czas-1 WHERE czas>0;";
            doSql(sql);
        }

        public void doSql(String sql)
        {
            SqlConnection vid = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            SqlCommand xp;
            if (sql != "")
            {
                xp = new SqlCommand(sql, vid);
                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
            }
        }

        public int[] losowanie(int ilosc)
        {
            int[] listaProcent = new int[ilosc];
            Random gen = new Random();
            for (int j = 0; j < 100; j++)
            {
                listaProcent[j] = gen.Next(ilosc);
            }
            return listaProcent;
        }
    }
}