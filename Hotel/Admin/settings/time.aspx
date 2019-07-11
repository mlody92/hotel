<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="time.aspx.cs" Inherits="Hotel.Admin.settings.time" %>

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
            Edycja czasu
        </div>
        <div class="panel-body">
            <p><asp:Label ID="Label1" runat="server" Text="Proszę o rozważne ustawianie czasu" ForeColor="Red"></asp:Label></p>
            <table>
                <tr>
                    <td>
                        <p>1 dzień w grze to w rzeczywistości x sekund: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="ustawTextBox" runat="server" Width="127px" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <p>
                            <asp:Label ID="ustawLabel" runat="server" Text="Label" Visible="false" />
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Dzień: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="dzienTextBox" runat="server" Width="127px" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <p>
                            <asp:Label ID="dzienLabel" runat="server" Text="Label" Visible="false" />
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Miesiąc: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="miesiacTextBox" runat="server" Width="127px" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <p>
                            <asp:Label ID="miesiacLabel" runat="server" Text="Label" Visible="false" />
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Rok: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="rokTextBox" runat="server" Width="127px" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <p>
                            <asp:Label ID="RokLabel" runat="server" Text="Label" Visible="false" />
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Godzina: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="godzinaTextBox" runat="server" Width="127px" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <p>
                            <asp:Label ID="godzinaLabel" runat="server" Text="Label" Visible="false" />
                        </p>
                    </td>
                </tr>
            </table>
            <p>
                <asp:LinkButton ID="changeTimeLinkButton" runat="server" OnClick="changeTimeLinkButton_Click">Zapisz czas</asp:LinkButton>
                &nbsp;
                <asp:Label ID="komunikatLabel" runat="server" Text="" Visible="false"></asp:Label>
            </p>
        </div>
        <div class="panel-footer">
        </div>
    </div>

</asp:Content>
