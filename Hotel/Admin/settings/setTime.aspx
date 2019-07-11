<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="setTime.aspx.cs" Inherits="Hotel.Admin.settings.setTime" %>
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
            Aktywność gry
        </div>
        <div class="panel-body">
            <p><asp:Label ID="Label1" runat="server" Text="Ustawiamy tutaj czas rzeczywisty." ForeColor="Red"></asp:Label></p>
            <table>
                <tr>
                    <td>
                        <p>Ile minut: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="minutTextBox" runat="server" Width="127px" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <p>
                            <asp:Label ID="minutLabel" runat="server" Text="Label" />
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
