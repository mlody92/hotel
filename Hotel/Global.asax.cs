using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Hotel
{
    public class Global : System.Web.HttpApplication
    {
        Hotel.tools.tools tools = new Hotel.tools.tools();
        protected void Application_Start(object sender, EventArgs e)
        {
            Application["jednostka_czasu"] = 1;
            Application["czas"] = 0;
            Application["Max_pozyczka"] = 500000;
            Application["ilosc_pieniedzy"] = 100000;
            Application["online"] = 0;
            Application["status_gry"] = 1;
            Application["status_gry_przez"] = 2022222;
            System.Threading.Thread watek = new System.Threading.Thread(Watek);
            watek.Priority = System.Threading.ThreadPriority.Lowest;
            watek.Start();

        }

        private void Watek()
        {
            int i = 1;
           
            while (true)
            {
                while ((int)Application["status_gry"] == 1 && (int)Application["status_gry_przez"]>0)
                { 
                    double dzien = wzorData((int)(Application["czas"]), (int)Application["jednostka_czasu"]);
                    double miesiac = wzorData((int)(Application["czas"]), (int)Application["jednostka_czasu"] * 30);
                    Application["czas"] = (int)Application["czas"] + 1;
                    Application["status_gry_przez"] = (int)Application["status_gry_przez"] - 1;
                    if (miesiac == 0)
                    {
                        
                        tools.splacanieRat();
                        tools.wyplacPensje();
                        tools.ustalWszystkiePensje();
                        tools.dodajRaport(i);
                        i++;
                    }
                    if (dzien == 0)
                    {
                        tools.zyskDzienny();
                    }
                    System.Threading.Thread.Sleep(1000);
                }
                Application["status_gry"] = 0;
                System.Threading.Thread.Sleep(1000);
            }
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Application["online"] = (int)Application["online"] + 1;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Application["online"] = (int)Application["online"] - 1;
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }

        private Double wzorData(int czas, int j)
        {
            Double wynik=czas - Math.Floor((double)czas / j) * j;
            return wynik;
        }

    }
}