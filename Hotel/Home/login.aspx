<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Hotel.Home.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MiddleContentPlaceHolder" runat="server">
    <table style="width: 50%;" runat="server" id="loginTable">
        <tr>
            <td>
                <p>
                    <asp:Label ID="login2" runat="server" Text="Nazwa użytkownika: "></asp:Label>
                </p>
            </td>
            <td>
                <p>
                    <asp:TextBox ID="loginTextBox" runat="server" MaxLength="30"></asp:TextBox>
                </p>
            </td>
        </tr>
        <tr>
            <td>
                <p>
                    <asp:Label ID="passwordLabel" runat="server" Text="Hasło: "></asp:Label>
                </p>
            </td>
            <td>
                <p>
                    <asp:TextBox ID="passwordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                </p>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <p>
                    <asp:LinkButton ID="zalogujLinkButton" runat="server" OnClick="zalogujLinkButton_Click">Zaloguj</asp:LinkButton>
                </p>
            </td>
        </tr>
    </table>
    <table style="width: 50%;">
        <tr>
            <td>
               <p> <asp:Label ID="labelText" runat="server" Text="" Visible="false"></asp:Label>
                </p>
            </td>
        </tr>
    </table>

</asp:Content>
