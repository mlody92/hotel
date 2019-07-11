<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="Hotel.Admin.advert.edit" %>
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
            Edytuj reklamę
        </div>
        <div class="panel-body">
            <table>
                <tr>
                    <td>
                        <p>Id:</p>
                    </td>
                    <td>
                        <p>
                            <asp:Label ID="idLabel" runat="server" Text="Label" Visible="true"></asp:Label>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Nazwa: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="nameTextBox" runat="server"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="nameLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Koszt: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="kosztTextBox" runat="server" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="kosztLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <p>Czas (dni): </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="dniTextBox" runat="server" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="dniLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <p>Zysk (w %): </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="zyskTextBox" runat="server" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="zyskLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
            </table>
            <p>
                <asp:LinkButton ID="addLinkButton" runat="server" OnClick="addLinkButton_Click">Zapisz</asp:LinkButton>
                &nbsp;
                <asp:Label ID="komunikatLabel" runat="server" Text="" Visible="false"></asp:Label>
            </p>
        </div>
        <div class="panel-footer">
        <p>
                <asp:LinkButton ID="powrotLinkButton" runat="server" OnClick="powrotLinkButton_Click">Przejdź do zarządzania.</asp:LinkButton>&nbsp;
            </p>
        </div>
    </div>

</asp:Content>
