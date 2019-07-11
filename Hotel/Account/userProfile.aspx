<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="Hotel.Account.userProfile" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="MiddleContentPlaceHolder" runat="server">
      <div class="post">
        <div class="postheader">
            <h1>Profil użytkownika</h1>
        </div>
        <div class="postcontent">
            <div id="body">
                <table>
                    <tr>
                        <td>
                            <p>Imię:</p>
                        </td>
                        <td>
                            <p>
                                <asp:TextBox ID="imieTextBox" runat="server" Width="127px"></asp:TextBox>
                            </p>
                        </td>
                        <td>
                            <p>
                                <asp:Label ID="imieLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p>Nazwisko: </p>
                        </td>
                        <td>
                            <p>
                                <asp:TextBox ID="nazwiskoTextBox" runat="server" Width="127px"></asp:TextBox>
                            </p>
                        </td>
                        <td>
                            <p>
                                <asp:Label ID="nazwiskoLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                            </p>
                        </td>
                    </tr>
                </table>
                <p>
                    <asp:LinkButton ID="ChangePassLinkButton" runat="server" OnClick="ChangePassLinkButton_Click">Zmień ustawienia</asp:LinkButton>
                    &nbsp;
                <asp:Label ID="komunikatLabel" runat="server" Text="" Visible="false"></asp:Label>
                </p>
            </div>
        </div>
        <div class="postfooter"></div>
    </div>
</asp:Content>
