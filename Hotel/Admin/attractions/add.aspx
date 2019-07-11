<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="Hotel.Admin.attractions.add" %>
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
            Dodaj atrakcje
        </div>
        <div class="panel-body">
            <table>
                <tr>
                    <td>
                        <p>Nazwa: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="nameTextBox" runat="server"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="nameLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Koszt: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="kosztTextBox" runat="server" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="kosztLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <p>Koszt miesięczny: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="kosztMiesiacTextBox" runat="server" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="kosztMiesiacLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <p>Rodzaj pracownika: </p>
                    </td>
                    <td>
                        <p>
                            <asp:DropDownList ID="rodzajDropDownList" runat="server" DataSourceID="rodzajSqlDataSource" DataTextField="stanowisko" DataValueField="id"></asp:DropDownList>
                            <asp:SqlDataSource ID="rodzajSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [pracownik]"></asp:SqlDataSource>
                        </p>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <p>Ilość pracowników potrzebnych do obsługi: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="iloscTextBox" runat="server" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="iloscLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <p>Wzrost procentowy: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="procentTextBox" runat="server" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="czasLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>
                         <p>Rodzaj hotelu: </p>
                    </td>
                    <td>
                        <p>
                            <asp:DropDownList ID="hotelDropDownList" runat="server" DataSourceID="hotelSqlDataSource" DataTextField="rodzaj" DataValueField="id"></asp:DropDownList>
                           <asp:SqlDataSource ID="hotelSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [rodzaj_hotelu]"></asp:SqlDataSource>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="rodzajLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
            </table>
            <p>
                <asp:LinkButton ID="zatwierdzLinkButton" runat="server" OnClick="zatwierdzLinkButton_Click">Zapisz</asp:LinkButton>
                &nbsp;
                <asp:Label ID="komunikatLabel" runat="server" Text="" Visible="false"></asp:Label>
            </p>
        </div>
    </div>
</asp:Content>
