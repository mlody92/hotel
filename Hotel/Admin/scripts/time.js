function zegar(time,jednostka,status) {
    var rok1 = jednostka * 30 * 12;
    var miesiac1 = jednostka * 30;
    var dzien1 = jednostka;
    var godzina1 = jednostka / 24;
    var minuta1 = jednostka / 24 / 60;

    //var rok = Math.floor(time / 518400)+1;
    //var miesiac = Math.floor((time - (Math.floor(time / 518400) * 518400)) / 43200) + 1;
    //var dzien = Math.floor((time - (Math.floor(time / 43200) * 43200)) / 1440)+1;
    //var godzina = Math.floor((time - (Math.floor(time / 1440)*1440))/60);
    //var minuta = time-Math.floor(time/60)*60;
    
    var rok = Math.floor(time / rok1) + 1;
    var miesiac = wzorData(time, rok1, miesiac1);
    var dzien = wzorData(time, miesiac1, dzien1)
    var godzina = wzorCzas(time, dzien1, godzina1);
    var minuta = wzorCzas(time, godzina1, minuta1);

    if (godzina <= 9)
        godzina = "0" + godzina

    if (minuta <= 9)
        minuta = "0" + minuta
    


    document.getElementById("pokaz").innerHTML = "Dzień: "
    + dzien + " Miesiąc: " + miesiac + " Rok: " + rok + "<br/>"
    + godzina+":"+minuta

    if (status == 1) {
        setTimeout("zegar(" + (time + 1) + "," + jednostka + "," + status + ")", 1000)
    }
}

function wzorData(czas,j_w,j){
    var wynik = Math.floor((czas - Math.floor(czas / j_w) * j_w) / j)+1;
    return wynik;
}

function wzorCzas(czas, j_w, j) {
    var wynik = Math.floor((czas - Math.floor(czas / j_w) * j_w) / j);
    return wynik;
}