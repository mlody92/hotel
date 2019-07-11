<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="manage.aspx.cs" Inherits="Hotel.Admin.attractions.manage" %>

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
            <h5>Atrakcje</h5>
            <div class="toolbar">
                <div class="btn-group">
                    <a href="#sortableTable" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                        <i class="icon-chevron-up"></i>
                    </a>
                </div>
            </div>
        </header>
        <p>
            <asp:Label ID="komunikat2Label" runat="server" Text="" Visible="false"></asp:Label>
        </p>
        <div id="sortableTable" class="body in">
            <asp:GridView class="table table-bordered sortableTable responsive-table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="atrakcjeSqlDataSource" AllowPaging="True" Style="margin-left: 0px; margin-right: 0px; margin-top: 31px" AllowSorting="True" RowStyle-Wrap="True" OnRowCommand="OnRowCommand" DataKeyNames="id">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id"></asp:BoundField>
                    <asp:BoundField DataField="nazwa" HeaderText="nazwa" SortExpression="nazwa"></asp:BoundField>
                    <asp:BoundField DataField="koszt" HeaderText="koszt" SortExpression="koszt"></asp:BoundField>
                    <asp:BoundField DataField="koszt_miesieczny" HeaderText="koszt_miesieczny" SortExpression="koszt_miesieczny"></asp:BoundField>
                    <asp:BoundField DataField="rodzaj" HeaderText="rodzaj" SortExpression="rodzaj"></asp:BoundField>
                    <asp:BoundField DataField="procent" HeaderText="procent" SortExpression="procent"></asp:BoundField>
                    <asp:BoundField DataField="ilosc" HeaderText="ilosc" SortExpression="ilosc"></asp:BoundField>
                    <asp:BoundField DataField="stanowisko" HeaderText="stanowisko" SortExpression="stanowisko"></asp:BoundField>
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="140px">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="edytuj" Text="Edytuj" CommandArgument='<%#Eval("id")%>' />
                            &nbsp&nbsp/&nbsp&nbsp
                             <asp:LinkButton ID="LinkButton2" runat="server" CommandName="usun" Text="Usuń" CommandArgument='<%#Eval("id")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle Wrap="True"></RowStyle>

            </asp:GridView>


            <asp:SqlDataSource ID="atrakcjeSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT atrakcja.id, atrakcja.nazwa, atrakcja.koszt, atrakcja.koszt_miesieczny, atrakcja.rodzaj_hotelu, atrakcja.procent, atrakcja.ilosc, rodzaj_hotelu.rodzaj, pracownik.stanowisko FROM atrakcja INNER JOIN rodzaj_hotelu ON atrakcja.rodzaj_hotelu = rodzaj_hotelu.id INNER JOIN pracownik ON pracownik.id=atrakcja.id_pracownik"></asp:SqlDataSource>

        </div>
    </div>
</asp:Content>
