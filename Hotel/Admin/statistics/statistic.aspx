<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="statistic.aspx.cs" Inherits="Hotel.Admin.statistics.statistic" %>

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
            <h5>Statystyki</h5>
            <div class="toolbar">
                <div class="btn-group">
                    <a href="#statystyki" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                        <i class="icon-chevron-up"></i>
                    </a>
                </div>
            </div>
        </header>
        <div id="statystyki" class="body in">
            <table class="table table-bordered sortableTable responsive-table">
                <tr>
                    <td>
                        <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Admin/statistics/chartAll.aspx" runat="server">Przejdź do wykresów dla wszystkich użytkowników</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>

    </div>

    <div class="box">

        <header>
            <h5>Statystyki - dla wybranego użytkownika</h5>
            <div class="toolbar">
                <div class="btn-group">
                    <a href="#sortableTable2" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                        <i class="icon-chevron-up"></i>
                    </a>
                </div>
            </div>
        </header>
        <div id="sortableTable2" class="body in">
            <asp:GridView class="table table-bordered sortableTable responsive-table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" Style="margin-left: 0px; margin-right: 0px; margin-top: 31px" AllowSorting="True" RowStyle-Wrap="True" OnRowCommand="OnRowCommand" DataSourceID="uzytkownicySqlDataSource">
                <Columns>
                    <asp:BoundField DataField="login" HeaderText="login" SortExpression="login">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="imie" HeaderText="imie" SortExpression="imie">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" SortExpression="nazwisko">
                        <ControlStyle Width="100px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Wykres" ItemStyle-Width="140px">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="wykres" Text="Wybierz" CommandArgument='<%#Eval("id")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <RowStyle Wrap="True"></RowStyle>

            </asp:GridView>

            <asp:SqlDataSource ID="uzytkownicySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [id], [login], [uprawnienie], [imie], [nazwisko], [konto], [status] FROM [uzytkownik] ORDER BY [id]"></asp:SqlDataSource>

        </div>

    </div>
</asp:Content>
