<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="manageBank.aspx.cs" Inherits="Hotel.bank.addBank" %>

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
            Maksymalna pożyczka
        </div>
        <div class="panel-body">
            <table>
                <tr>
                    <td>
                        <p>Maksymalna kwota kredytu: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="kwotaTextBox" runat="server" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="kwotaLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <p>Aktualnie (w zł): </p>
                    </td>
                    <td>
                        <asp:Label ID="aktualnieLabel" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
            <p>
                <asp:LinkButton ID="zatwierdzLinkButton" runat="server" OnClick="zatwierdzLinkButton_Click">Zapisz zmiany</asp:LinkButton>
                &nbsp;
                <asp:Label ID="komunikatLabel" runat="server" Text="" Visible="false"></asp:Label>
            </p>
        </div>
        <div class="panel-footer">
        </div>
    </div>
</asp:Content>
