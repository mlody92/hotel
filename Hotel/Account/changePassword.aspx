<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="changePassword.aspx.cs" Inherits="Hotel.Account.changePassword" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="MiddleContentPlaceHolder" runat="server">
    <div class="post">
        <div class="postheader">
            <h1>Zmiana hasła</h1>
        </div>
        <div class="postcontent">
            <div id="body">
                <table>
                    <tr>
                        <td>
                            <p>Aktualne hasło: </p>
                        </td>
                        <td>
                            <p>
                                <asp:TextBox ID="currPassTextBox" runat="server" Width="127px" TextMode="Password"></asp:TextBox>
                            </p>
                        </td>
                        <td>
                            <p>
                                <asp:Label ID="currLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>Nowe hasło: </p>
                        </td>
                        <td>
                            <p>
                                <asp:TextBox ID="newTextBox" runat="server" Width="127px" TextMode="Password"></asp:TextBox>
                            </p>
                        </td>
                        <td>
                            <p>
                                <asp:Label ID="newLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>Powtórz nowe hasło: </p>
                        </td>
                        <td>
                            <p>
                                <asp:TextBox ID="repeatNewTextBox" runat="server" Width="127px" TextMode="Password"></asp:TextBox>
                            </p>
                        </td>
                        <td>
                            <p>
                                <asp:Label ID="repeatNewLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                            </p>
                        </td>
                    </tr>
                </table>
                <p>
                    <asp:LinkButton ID="ChangePassLinkButton" runat="server" OnClick="ChangePassLinkButton_Click">Zmień hasło</asp:LinkButton>
                    &nbsp;
                <asp:Label ID="komunikatLabel" runat="server" Text="" Visible="false"></asp:Label>
                </p>
            </div>
        </div>
        <div class="postfooter"></div>
    </div>
</asp:Content>
