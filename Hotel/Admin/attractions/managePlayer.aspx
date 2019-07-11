<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="managePlayer.aspx.cs" Inherits="Hotel.Admin.attractions.managePlayer" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="messageContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taskContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="alertsContentPlaceHolder" runat="server">
</asp:Content>--%>
<asp:Content ID="Content5" ContentPlaceHolderID="pageContentPlaceHolder" runat="server">
     <div class="box">
        <header>
            <h5>Atrakcje graczy</h5>
            <div class="toolbar">
                <div class="btn-group">
                    <a href="#sortableTable1" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                        <i class="icon-chevron-up"></i>
                    </a>
                </div>
            </div>
        </header>
        <div id="sortableTable1" class="body in">
            <asp:GridView ID="GridView1" class="table table-bordered sortableTable responsive-table" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource" OnRowCommand="OnRowCommand">
                <Columns>
                    <asp:BoundField DataField="nazwa" HeaderText="nazwa" SortExpression="nazwa" />
                    <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
                    <asp:BoundField DataField="imie" HeaderText="imie" SortExpression="imie" />
                    <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" SortExpression="nazwisko" />
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="140px">
                        <ItemTemplate>
                             <asp:LinkButton ID="LinkButton2" runat="server" CommandName="usun" Text="Usuń" CommandArgument='<%#Eval("id")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT user_atrakcja.id, atrakcja.nazwa, uzytkownik.login, uzytkownik.imie,uzytkownik.nazwisko from atrakcja join user_atrakcja on atrakcja.id=user_atrakcja.atrakcja_id join dzialka_user on dzialka_user.id=user_atrakcja.dzialka_id join uzytkownik on uzytkownik.id=dzialka_user.uzytkownik_id"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
