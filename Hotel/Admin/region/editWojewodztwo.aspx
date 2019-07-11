<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="editWojewodztwo.aspx.cs" Inherits="Hotel.Admin.region.editWojewodztwo" %>

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
            Edycja województwa
        </div>
        <div class="panel-body">
            <table>
                <tr>
                    <td>
                        <p>Id województwa:</p>
                    </td>
                    <td>
                        <p>
                            <asp:Label ID="idLabel" runat="server" Text="Label" Visible="true"></asp:Label>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Nazwa województwa:</p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="nazwaTextBox" runat="server" Width="127px"></asp:TextBox>
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
                <asp:LinkButton ID="powrotLinkButton" runat="server" OnClick="powrotLinkButton_Click">Przejdź do zarządzania województwami</asp:LinkButton>&nbsp;
            </p>
        </div>
    </div>
</asp:Content>
