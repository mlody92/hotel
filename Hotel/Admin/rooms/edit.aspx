<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="Hotel.Admin.rooms.edit" %>

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
            Edytuj pokój
        </div>
        <div class="panel-body">
            <table>
                <tr>
                    <td>
                        <p>Id:</p>
                    </td>
                    <td>
                        <p>
                            <asp:Label ID="idLabel" runat="server" Text="Label" Visible="true"></asp:Label>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Rodzaj pokoju: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="nameTextBox" runat="server" Width="127px"></asp:TextBox>
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
                            <asp:TextBox ID="kosztTextBox" runat="server" Width="127px" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="kosztLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Zysk za nocleg/dzień: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="zyskTextBox" runat="server" Width="127px" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="zyskLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Stopien atrakcyjnosci: </p>
                    </td>
                    <td>
                        <p>
                            <asp:DropDownList ID="stopienDropDownList" runat="server" DataSourceID="stopienSqlDataSource" DataTextField="nazwa" DataValueField="id" AppendDataBoundItems="true">
                                <asp:ListItem Text="Wybierz" Value="-1"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="stopienSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [atrakcyjnosc]"></asp:SqlDataSource>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Rodzaj pracownika: </p>
                    </td>
                    <td>
                        <p>
                            <asp:DropDownList ID="rodzajDropDownList" runat="server" DataSourceID="rodzajSqlDataSource" DataTextField="stanowisko" DataValueField="id" AppendDataBoundItems="true">
                                <asp:ListItem Text="Wybierz" Value="-1"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="rodzajSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [pracownik]"></asp:SqlDataSource>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Status: </p>
                    </td>
                    <td>
                        <p>
                            <asp:DropDownList ID="statusDropDownList" runat="server" Width="127px">
                                <asp:ListItem Text="aktywny" Value="aktywny" />
                                <asp:ListItem Text="nieaktywny" Value="nieaktywny" />
                            </asp:DropDownList>
                        </p>
                    </td>
                </tr>
            </table>
            <p>
                <asp:LinkButton ID="addLinkButton" runat="server" OnClick="addWojLinkButton_Click">Zapisz</asp:LinkButton>
                &nbsp;
                <asp:Label ID="komunikatLabel" runat="server" Text="" Visible="false"></asp:Label>
            </p>
        </div>
        <div class="panel-footer">
            <p>
                <asp:LinkButton ID="powrotLinkButton" runat="server" OnClick="powrotLinkButton_Click">Przejdź do zarządzania.</asp:LinkButton>&nbsp;
            </p>
        </div>
    </div>

</asp:Content>
