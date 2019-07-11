<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="editMiasto.aspx.cs" Inherits="Hotel.Admin.region.editMiasto" %>
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
            Edycja miasta
        </div>
        <div class="panel-body">
            <table>
                <tr>
                    <td>
                        <p>Id miasta:</p>
                    </td>
                    <td>
                        <p>
                            <asp:Label ID="idLabel" runat="server" Text="Label" Visible="true"></asp:Label>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Nazwa miasta:</p>
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
                <asp:LinkButton ID="powrotLinkButton" runat="server" OnClick="powrotLinkButton_Click">Przejdź do zarządzania miastami</asp:LinkButton>&nbsp;
            </p>
        </div>
    </div>
</asp:Content>
