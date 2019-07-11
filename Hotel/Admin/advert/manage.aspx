<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="manage.aspx.cs" Inherits="Hotel.Admin.advert.manage" %>
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
            Dodaj reklamę
        </div>
        <div class="panel-body">
            <table>
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
                <asp:LinkButton ID="zatwierdzLinkButton" runat="server" OnClick="zatwierdzLinkButton_Click">Dodaj reklamę</asp:LinkButton>
                &nbsp;
                <asp:Label ID="komunikatLabel" runat="server" Text="" Visible="false"></asp:Label>
            </p>
        </div>
    </div>


    <div class="box">
        <header>
            <h5>Reklama</h5>
            <div class="toolbar">
                <div class="btn-group">
                    <a href="#sortableTable" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                        <i class="icon-chevron-up"></i>
                    </a>
                </div>
            </div>
        </header>
        <p>
            <asp:Label ID="komunikat2Label" runat="server" Text="" Visible="false"></asp:Label></p>
        <div id="sortableTable" class="body in">
            <asp:GridView class="table table-bordered sortableTable responsive-table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="reklamaSqlDataSource" AllowPaging="True" Style="margin-left: 0px; margin-right: 0px; margin-top: 31px" AllowSorting="True" RowStyle-Wrap="True" OnRowCommand="OnRowCommand" DataKeyNames="id">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" ReadOnly="True"></asp:BoundField>
                    <asp:BoundField DataField="nazwa" HeaderText="nazwa" SortExpression="nazwa"></asp:BoundField>
                    <asp:BoundField DataField="koszt" HeaderText="koszt" SortExpression="koszt"></asp:BoundField>
                    <asp:BoundField DataField="czas" HeaderText="czas" SortExpression="czas"></asp:BoundField>
                    <asp:BoundField DataField="zysk" HeaderText="zysk" SortExpression="zysk"></asp:BoundField>
                      <asp:TemplateField ShowHeader="False" ItemStyle-Width="140px">
                       <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="edytuj" Text="Edytuj" CommandArgument='<%#Eval("id")%>' />
                            &nbsp&nbsp/&nbsp&nbsp
                             <asp:LinkButton ID="LinkButton2" runat="server" CommandName="usun" Text="Usuń" CommandArgument='<%#Eval("id")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <RowStyle Wrap="True"></RowStyle>

            </asp:GridView>

            <asp:SqlDataSource ID="reklamaSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [reklama]"></asp:SqlDataSource>

        </div>
    </div>
</asp:Content>
