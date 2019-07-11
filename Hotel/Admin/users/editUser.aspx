<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="editUser.aspx.cs" Inherits="Hotel.Admin.users.editUser" %>

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
            Edycja uzytkownika
        </div>
        <div class="panel-body">
            <table>
                <tr>
                    <td>
                        <p>Id użytkownika: </p>
                    </td>
                    <td>
                        <p>
                            <asp:Label ID="idLabel" runat="server" Text="Label" Visible="true"></asp:Label>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Login: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="loginTextBox" runat="server" Width="127px"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <p>
                            <asp:Label ID="loginLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Imię: </p>
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
                </tr>
                <tr>
                    <td>
                        <p>Konto: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="kontoTextBox" runat="server" Width="127px" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Status: </p>
                    </td>
                    <td>
                        <p>
                            <%--<asp:Label ID="statusLabel" runat="server" Text="Label" Visible="true"></asp:Label>--%>
                             <asp:DropDownList ID="statusDropDownList" runat="server" Width="127px" AutoPostBack="True">
                                <asp:ListItem Text="do akceptacji" Value="do akceptacji" />
                                <asp:ListItem Text="aktywny" Value="aktywny" />
                                <asp:ListItem Text="zablokowany" Value="zablokowany" />
                            </asp:DropDownList>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Uprawnienie: </p>
                    </td>
                    <td>
                        <p>
                           <%-- <asp:TextBox ID="uprawnienieTextBox" runat="server" Width="127px"></asp:TextBox>--%>
                            <asp:DropDownList ID="uprawnienieDropDownList" runat="server" Width="127px" AutoPostBack="True">
                                <asp:ListItem Text="student" Value="student" />
                                <asp:ListItem Text="admin" Value="admin" />
                            </asp:DropDownList>

                        </p>
                    </td>
                </tr>
            </table>
            <p>
                <asp:LinkButton ID="zapiszButton" runat="server" OnClick="zapiszButton_Click">Zapisz zmiany</asp:LinkButton>
                &nbsp;
                <asp:Label ID="komunikatLabel" runat="server" Text="" Visible="false"></asp:Label>
            </p>

        </div>
        <div class="panel-footer">
            <p>
                <asp:LinkButton ID="powrotLinkButton" runat="server" OnClick="powrotLinkButton_Click">Przejdź do zarządzania użytkownikami</asp:LinkButton>&nbsp;
            </p>
        </div>
    </div>

</asp:Content>
