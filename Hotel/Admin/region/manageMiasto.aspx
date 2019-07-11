<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="manageMiasto.aspx.cs" Inherits="Hotel.Admin.region.manageMiasto" %>

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
            Dodaj miasto
        </div>
        <div class="panel-body">
            <table>
                <tr>
                    <td>
                        <p>Wybierz województwo: </p>
                    </td>
                    <td>
                        <p>
                            <asp:DropDownList ID="WojDropDownList" runat="server" DataSourceID="wojewodztwaSqlDataSource" DataTextField="nazwa" DataValueField="id"></asp:DropDownList>

                        </p>
                    </td>
                    <td>
                        <asp:Label ID="nazwaWojLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Nazwa miasta: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="miastoTextBox" runat="server"></asp:TextBox>
                        </p>
                    </td>
                    <td>
                        <asp:Label ID="miastoLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
            </table>
            <p>
                <asp:LinkButton ID="addWojLinkButton" runat="server" OnClick="addWojLinkButton_Click">Dodaj miasto</asp:LinkButton>
                &nbsp;
                <asp:Label ID="komunikatLabel" runat="server" Text="" Visible="false"></asp:Label>
            </p>
        </div>
        <div class="panel-footer">
            <asp:SqlDataSource ID="wojewodztwaSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [wojewodztwo]"></asp:SqlDataSource>

        </div>
    </div>


    <div class="box">
        <header>
            <h5>Miasto</h5>
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
            <asp:GridView Width="500px" class="table table-bordered sortableTable responsive-table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="miastoSqlDataSource" AllowPaging="True" Style="margin-left: 0px; margin-right: 0px; margin-top: 31px" AllowSorting="True" RowStyle-Wrap="True" OnRowCommand="OnRowCommand" DataKeyNames="id">
                <Columns>
                    <asp:BoundField DataField="nazwa" HeaderText="Województwo" SortExpression="nazwa" ReadOnly="True"></asp:BoundField>
                    <asp:BoundField DataField="miasto" HeaderText="Miasto" SortExpression="miasto" />
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

            <asp:SqlDataSource ID="miastoSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT miasto.id, wojewodztwo.nazwa, miasto.nazwa AS miasto FROM wojewodztwo INNER JOIN miasto ON wojewodztwo.id = miasto.id_wojewodztwo"></asp:SqlDataSource>

        </div>
    </div>


</asp:Content>
