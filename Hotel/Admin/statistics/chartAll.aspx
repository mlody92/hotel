<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="chartAll.aspx.cs" Inherits="Hotel.Admin.statistics.chartAll" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="messageContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taskContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="alertsContentPlaceHolder" runat="server">
</asp:Content>--%>
<asp:Content ID="Content5" ContentPlaceHolderID="pageContentPlaceHolder" runat="server">
    
     <div class="panel panel-primary">
        <div class="panel-heading">
            Wykres
        </div>
        <div class="panel-body">

            <div class="box">
                <header>
                    <h5>Stan konta</h5>
                    <div class="toolbar">
                        <div class="btn-group">
                            <a href="#stanKontaChart" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                                <i class="icon-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                </header>
                <div id="stanKontaChart" class="body collapse">
                    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="login" YValueMembers="stan_konta"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </div>
            </div>

            
            <div class="box">
                <header>
                    <h5>Suma wydatków</h5>
                    <div class="toolbar">
                        <div class="btn-group">
                            <a href="#wydatkiChart" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                                <i class="icon-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                </header>
                <div id="wydatkiChart" class="body collapse">
                    <asp:Chart ID="Chart14" runat="server" DataSourceID="SqlDataSource1">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="login" YValueMembers="wydatki"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                 </div>
            </div>
             <div class="box">
                <header>
                    <h5>Suma zysków</h5>
                    <div class="toolbar">
                        <div class="btn-group">
                            <a href="#sumaZyskiChart" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                                <i class="icon-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                </header>
                <div id="sumaZyskiChart" class="body collapse">
                    <asp:Chart ID="Chart15" runat="server" DataSourceID="SqlDataSource1">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="login" YValueMembers="zysk"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                 </div>
            </div>
             <div class="box">
                <header>
                    <h5>Saldo</h5>
                    <div class="toolbar">
                        <div class="btn-group">
                            <a href="#saldoChart" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                                <i class="icon-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                </header>
                <div id="saldoChart" class="body collapse">
                    <asp:Chart ID="Chart16" runat="server" DataSourceID="SqlDataSource1">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="login" YValueMembers="saldo"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                 </div>
            </div>

            <div class="box">
                <header>
                    <h5>Wydatki na zakup działki</h5>
                    <div class="toolbar">
                        <div class="btn-group">
                            <a href="#dzialkaChart" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                                <i class="icon-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                </header>
                <div id="dzialkaChart" class="body collapse">
                    <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="login" YValueMembers="dzialka"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </div>
            </div>
             <div class="box">
                <header>
                    <h5>Wydatki na pensje</h5>
                    <div class="toolbar">
                        <div class="btn-group">
                            <a href="#pensjaChart" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                                <i class="icon-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                </header>
                <div id="pensjaChart" class="body collapse">
                    <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="login" YValueMembers="pensja"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </div>
            </div>
             <div class="box">
                <header>
                    <h5>Wydatki na atrakcje</h5>
                    <div class="toolbar">
                        <div class="btn-group">
                            <a href="#atrakcjeChart" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                                <i class="icon-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                </header>
                <div id="atrakcjeChart" class="body collapse">
                    <asp:Chart ID="Chart4" runat="server" DataSourceID="SqlDataSource">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="login" YValueMembers="atrakcje"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </div>
            </div>
             <div class="box">
                <header>
                    <h5>Wydatki na reklamę</h5>
                    <div class="toolbar">
                        <div class="btn-group">
                            <a href="#reklamaChart" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                                <i class="icon-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                </header>
                <div id="reklamaChart" class="body collapse">
                    <asp:Chart ID="Chart5" runat="server" DataSourceID="SqlDataSource">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="login" YValueMembers="reklama"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </div>
            </div>
            <div class="box">
                <header>
                    <h5>Wydatki na pokoje</h5>
                    <div class="toolbar">
                        <div class="btn-group">
                            <a href="#pokojChart" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                                <i class="icon-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                </header>
                <div id="pokojChart" class="body collapse">
                    <asp:Chart ID="Chart6" runat="server" DataSourceID="SqlDataSource">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="login" YValueMembers="pokoj"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                 </div>
            </div>
            <div class="box">
                <header>
                    <h5>Wydatki za kredyt</h5>
                    <div class="toolbar">
                        <div class="btn-group">
                            <a href="#kredytChart" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                                <i class="icon-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                </header>
                <div id="kredytChart" class="body collapse">
                    <asp:Chart ID="Chart7" runat="server" DataSourceID="SqlDataSource">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="login" YValueMembers="bank"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                 </div>
            </div>
            <div class="box">
                <header>
                    <h5>Zysk</h5>
                    <div class="toolbar">
                        <div class="btn-group">
                            <a href="#zyskChart" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                                <i class="icon-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                </header>
                <div id="zyskChart" class="body collapse">
                    <asp:Chart ID="Chart8" runat="server" DataSourceID="SqlDataSource">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="login" YValueMembers="zysk"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                 </div>
            </div>
            <div class="box">
                <header>
                    <h5>Ilość pracowników</h5>
                    <div class="toolbar">
                        <div class="btn-group">
                            <a href="#iloscPracChart" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                                <i class="icon-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                </header>
                <div id="iloscPracChart" class="body collapse">
                    <asp:Chart ID="Chart9" runat="server" DataSourceID="SqlDataSource">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="login" YValueMembers="ilosc_pracownikow"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                 </div>
            </div>
             <div class="box">
                <header>
                    <h5>Ilość pokoi</h5>
                    <div class="toolbar">
                        <div class="btn-group">
                            <a href="#iloscPokoiChart" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                                <i class="icon-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                </header>
                <div id="iloscPokoiChart" class="body collapse">
                    <asp:Chart ID="Chart10" runat="server" DataSourceID="SqlDataSource">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="login" YValueMembers="ilosc_pokoi"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                 </div>
            </div>
             <div class="box">
                <header>
                    <h5>Ilość atrakcji</h5>
                    <div class="toolbar">
                        <div class="btn-group">
                            <a href="#iloscAtrChart" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                                <i class="icon-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                </header>
                <div id="iloscAtrChart" class="body collapse">
                    <asp:Chart ID="Chart11" runat="server" DataSourceID="SqlDataSource">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="login" YValueMembers="ilosc_atrakcji"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                 </div>
            </div>
             <div class="box">
                <header>
                    <h5>Ilość działek</h5>
                    <div class="toolbar">
                        <div class="btn-group">
                            <a href="#iloscDzialekChart" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                                <i class="icon-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                </header>
                <div id="iloscDzialekChart" class="body collapse">
                    <asp:Chart ID="Chart12" runat="server" DataSourceID="SqlDataSource">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="login" YValueMembers="ilosc_dzialek"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                 </div>
            </div>
            <div class="box">
                <header>
                    <h5>Ilość kredytów</h5>
                    <div class="toolbar">
                        <div class="btn-group">
                            <a href="#iloscKredytowChart" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                                <i class="icon-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                </header>
                <div id="iloscKredytowChart" class="body collapse">
                    <asp:Chart ID="Chart13" runat="server" DataSourceID="SqlDataSource">
                        <Series>
                            <asp:Series Name="Series1" XValueMember="login" YValueMembers="ilosc_kredytow"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                 </div>
            </div>


             <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="select raport.*, uzytkownik.login from raport join uzytkownik on raport.id_uzytkownika=uzytkownik.id where raport.czas=(SELECT MAX(czas) from raport)"></asp:SqlDataSource>  
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT (dzialka+pensja+atrakcje+reklama+pokoj+bank) as wydatki, zysk, (zysk-(dzialka+pensja+atrakcje+reklama+pokoj+bank)) as saldo, uzytkownik.login  FROM raport join uzytkownik on uzytkownik.id=raport.id_uzytkownika where raport.czas=(SELECT MAX(czas) from raport)"></asp:SqlDataSource> 
        </div>
    <div class="panel-footer">
        <p>
            <asp:LinkButton ID="powrotLinkButton" runat="server" OnClick="powrotLinkButton_Click">Powrót</asp:LinkButton>&nbsp;
         </p>
    </div>
    </div>
</asp:Content>
