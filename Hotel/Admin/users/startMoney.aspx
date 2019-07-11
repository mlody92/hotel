<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="startMoney.aspx.cs" Inherits="Hotel.Admin.users.startMoney" %>
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
            Ustal ilość pieniędzy dla graczy
        </div>
        <div class="panel-body">
            <p><asp:Label ID="Label1" runat="server" Text="Pamiętaj, że po wciśnięciu przycisku 'Zapisz zmiany' wszyscy użytkownicy będą mieli ustaloną ilość pieniędzy!" Visible="true" ForeColor="Red"></asp:Label></p>
             <p><asp:Label ID="Label3" runat="server" Text="Zmiany nie da się cofnąć!" Visible="true" ForeColor="Red"></asp:Label></p>
            <table>
                <tr>
                    <td>
                        <p>Ilość pieniędzy: </p>
                    </td>
                    <td>
                        <asp:TextBox ID="iloscTextBox" runat="server" TextMode="Number"></asp:TextBox>
                    </td>
                    <td>
                        <p>
                            <asp:Label ID="iloscLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                        </p>
                    </td>
                </tr> 
                <tr>
                    <td>
                        <p>Aktualnie: </p>
                    </td>
                    <td>
                        <p>
                            <asp:Label ID="Label2" runat="server" Text="" Visible="true"></asp:Label>
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
        </div>
    </div>
</asp:Content>
