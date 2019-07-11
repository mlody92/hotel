<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="manageWoj.aspx.cs" Inherits="Hotel.Admin.woj.manageWoj" %>

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
            Dodaj województwo
        </div>
        <div class="panel-body">
            <table>
                <tr>
                    <td>
                        <p>Nazwa województwa: </p>
                    </td>
                    <td>
                        <p>
                            <asp:TextBox ID="nazwaWojTextBox" runat="server" Width="127px"></asp:TextBox></p>
                    </td>
                    <td>
                        <asp:Label ID="nazwaWojLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
            </table>
            <p>
                <asp:LinkButton ID="addWojLinkButton" runat="server" OnClick="addWojLinkButton_Click">Dodaj województwo</asp:LinkButton>
                &nbsp;
                <asp:Label ID="komunikatLabel" runat="server" Text="" Visible="false"></asp:Label>
            </p>
        </div>
        <div class="panel-footer">
        </div>
    </div>


    
    <div class="box">
        <header>
            <h5>Województwa</h5>
            <div class="toolbar">
                <div class="btn-group">
                    <a href="#sortableTable" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                        <i class="icon-chevron-up"></i>
                    </a>
                </div>
            </div>
        </header>
        <p><asp:Label ID="komunikat2Label" runat="server" Text="" Visible="false"></asp:Label></p>
        <div id="sortableTable" class="body in">
            <asp:GridView Width="500px" class="table table-bordered sortableTable responsive-table" ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="wojewodztwaSqlDataSource" AllowPaging="True" Style="margin-left: 0px; margin-right: 0px; margin-top: 31px" AllowSorting="True" RowStyle-Wrap="True" OnRowCommand="OnRowCommand" DataKeyNames="id">
                <Columns>
                   <asp:BoundField DataField="nazwa" HeaderText="nazwa" SortExpression="nazwa"></asp:BoundField>
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

            <asp:SqlDataSource ID="wojewodztwaSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [wojewodztwo]" DeleteCommand="DELETE FROM wojewodztwo WHERE id = @id AND (Select count(*) from miasto where id=@id)=0"></asp:SqlDataSource>

        </div>
    </div>
</asp:Content>
