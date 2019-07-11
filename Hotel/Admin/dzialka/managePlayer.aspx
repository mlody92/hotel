<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="managePlayer.aspx.cs" Inherits="Hotel.Admin.dzialka.managePlayer" %>
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
            <h5>Działki graczy</h5>
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
                    <asp:BoundField DataField="nazwa" HeaderText="nazwa" InsertVisible="False" ReadOnly="True" SortExpression="nazwa" />
                    <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
                    <asp:BoundField DataField="imie" HeaderText="imie" SortExpression="imie" />
                    <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" SortExpression="nazwisko" />
                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="140px">
                        <ItemTemplate>
                             <asp:LinkButton ID="LinkButton2" runat="server" CommandName="usun" Text="Usuń" CommandArgument='<%#Eval("id")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT dzialka.nazwa, uzytkownik.login, uzytkownik.imie, uzytkownik.nazwisko, dzialka_user.id FROM dzialka_user JOIN dzialka ON dzialka_user.dzialka_id=dzialka.id JOIN uzytkownik ON uzytkownik.id=dzialka_user.uzytkownik_id"></asp:SqlDataSource>
        </div>
    </div>


</asp:Content>
