<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="editWorker.aspx.cs" Inherits="Hotel.Admin.workers.editWorker" %>

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
            Dodaj pracownika
        </div>
        <div class="panel-body">
            <table>
                <tr>
                    <td>
                        <p>Id pracownika: </p>
                    </td>
                    <td>
                        <asp:Label ID="idLabel" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <p>Stanowisko: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="stanowiskoTextBox" runat="server"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="stanowiskoLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Pensja minimalna: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="pensjaMinTextBox" runat="server" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="pensjaMinLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Średnia pensja: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="pensjaTextBox" runat="server" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="pensjaLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <p>Ilość obslugiwanych pokojów/atrakcji: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="iloscTextBox" runat="server" ToolTip="ilosc" TextMode="Number"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="iloscLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
            </table>
            <p>
                <asp:LinkButton ID="zatwierdzLinkButton" runat="server" OnClick="zapiszLinkButton_Click">Zapisz zmiany</asp:LinkButton>
                &nbsp;
                <asp:Label ID="komunikatLabel" runat="server" Text="" Visible="false"></asp:Label>
            </p>
        </div>
        <div class="panel-footer">
            <p>
                <asp:LinkButton ID="powrotLinkButton" runat="server" OnClick="powrotLinkButton_Click">Przejdź do zarządzania</asp:LinkButton>&nbsp;
            </p>
        </div>
    </div>


</asp:Content>
