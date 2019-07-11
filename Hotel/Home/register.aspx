<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Hotel.Home.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MiddleContentPlaceHolder" runat="server">

    <div class="post">
        <div class="postheader">
            <h1>Rejestracja</h1>
        </div>
        <div class="postcontent">
            <div id="body">
                <div id="registerTable" runat="server">
                    <table style="width: 70%;">
                        <tr>
                            <td>
                                <p>
                                    <asp:Label ID="login" runat="server" Text="Nazwa użytkownika: "></asp:Label>
                                </p>
                            </td>
                            <td>
                                <p>
                                    <asp:TextBox ID="loginTextBox" runat="server"></asp:TextBox>
                                </p>
                            </td>
                            <td>

                                <p>
                                    <asp:Label ID="Label1" runat="server" Text="Nieprawidłowa nazwa użytkownika" Visible="false"></asp:Label>
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
                            <td>
                                <p>
                                    <asp:Label ID="Label2" runat="server" Text="Niepoprawne hasło" Visible="false"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>
                                    <asp:Label ID="repeatPasswordLabel" runat="server" Text="Powtórz hasło: "></asp:Label>
                                </p>
                            </td>
                            <td>
                                <p>
                                    <asp:TextBox ID="repeatPasswordTextBox" runat="server" TextMode="Password"></asp:TextBox>
                                </p>
                            </td>
                            <td>
                                <p>
                                    <asp:Label ID="Label3" runat="server" Text="Nieprawidłowe powtórzenie hasła" Visible="false"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>
                                    <asp:Label ID="imieLabel" runat="server" Text="Imię: "></asp:Label>
                                </p>
                            </td>
                            <td>
                                <p>
                                    <asp:TextBox ID="imieTextBox" runat="server"></asp:TextBox>
                                </p>
                            </td>
                            <td>
                                <p>
                                    <asp:Label ID="Label4" runat="server" Text="Niepoprawnie wpisane imię" Visible="false"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>
                                    <asp:Label ID="nazwiskoLabel" runat="server" Text="Nazwisko: "></asp:Label>
                                </p>
                            </td>
                            <td>
                                <p>
                                    <asp:TextBox ID="nazwiskoTextBox" runat="server"></asp:TextBox>
                                </p>
                            </td>
                            <td>
                                <p>
                                    <asp:Label ID="Label5" runat="server" Text="Niepoprawnie wpisane nazwisko" Visible="false"> </asp:Label>
                                </p>
                            </td>
                        </tr>

                    </table>


                    <table style="width: 50%;">
                        <tr>
                            <td>
                                <p>
                                    <asp:Label ID="captchaLabel" runat="server" Text="Captcha: "></asp:Label>
                                </p>
                            </td>
                            <td>
                                <p>
                                    <asp:TextBox ID="txtCaptcha" runat="server" Style="width: 100px;"></asp:TextBox>
                                </p>
                            </td>
                            <td>
                                <p>
                                    <asp:Image ID="imgCaptcha" runat="server" Style="width: 100px;" />
                                </p>
                            </td>
                            <td>
                                <p>
                                    <asp:LinkButton ID="btnRefreshLinkButton" runat="server" OnClick="btnRefresh_Click">Odśwież</asp:LinkButton>
                                </p>
                            </td>
                        </tr>
                    </table>

                    <table style="width: 50%;">
                        <tr>
                            <td>
                                <p>
                                    <asp:LinkButton ID="wyczyscLinkButton" runat="server" OnClick="wyczyscLinkButton_Click">Wyczyść</asp:LinkButton>
                                </p>
                            </td>
                            <td>
                                <p>
                                    <asp:LinkButton ID="zarejestrujLinkButton" runat="server" OnClick="zarejestrujLinkButton_Click">Zarejestruj</asp:LinkButton>
                                </p>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <p>
                <asp:Label ID="komunikatLabel" runat="server" Text="" Visible="false"></asp:Label>
            </p>
        </div>
        <div class="postfooter"></div>
    </div>
</asp:Content>
