<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="changePassword.aspx.cs" Inherits="Hotel.Admin.user_profile.changePassword" %>

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
            Zmiana hasła
        </div>
        <div class="panel-body">
            <table>
                <tr>
                    <td>
                         <p>Aktualne hasło: </p>
                    </td>
                    <td>
                        <p><asp:TextBox ID="currPassTextBox" runat="server" Width="127px" TextMode="Password"></asp:TextBox></p>
                    </td>
                    <td>
                        <asp:Label ID="currLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                         <p>Nowe hasło: </p>
                    </td>
                    <td>
                        <p><asp:TextBox ID="newTextBox" runat="server" Width="127px" TextMode="Password"></asp:TextBox></p>
                    </td>
                    <td>
                        <asp:Label ID="newLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                         <p>Powtórz nowe hasło: </p>
                    </td>
                    <td>
                        <p><asp:TextBox ID="repeatNewTextBox" runat="server" Width="127px" TextMode="Password"></asp:TextBox></p>
                    </td>
                    <td>
                        <asp:Label ID="repeatNewLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
            </table>
            <p><asp:LinkButton ID="ChangePassLinkButton" runat="server" OnClick="ChangePassLinkButton_Click">Zmień hasło</asp:LinkButton>
                &nbsp;
                <asp:Label ID="komunikatLabel" runat="server" Text="" Visible="false"></asp:Label>
            </p>
           </div>
        <div class="panel-footer">
            Panel Footer
        </div>
    </div>
</asp:Content>
