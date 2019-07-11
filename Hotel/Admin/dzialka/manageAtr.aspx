<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="manageAtr.aspx.cs" Inherits="Hotel.Admin.dzialka.manageAtr" %>
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
            Dodaj stopień atrakcyjności
        </div>
        <div class="panel-body">
            <table>
                <tr>
                    <td>
                         <p>Stopień atrakcyjności: </p>
                    </td>
                    <td>
                        <p><asp:TextBox ID="nameTextBox" runat="server" Width="127px"></asp:TextBox></p>
                    </td>
                    <td>
                        <asp:Label ID="nameLabel" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                </tr>
            </table>
            <p><asp:LinkButton ID="addLinkButton" runat="server" OnClick="addLinkButton_Click">Zapisz</asp:LinkButton>
                &nbsp;
                <asp:Label ID="komunikatLabel" runat="server" Text="" Visible="false"></asp:Label>
            </p>
           </div>
        <div class="panel-footer">
            
        </div>
    </div>


     <div class="box">
        <header>
            <h5>Stopnie atrakcyjności</h5>
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
            <asp:GridView Width="500px" class="table table-bordered sortableTable responsive-table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="atrakcyjnoscSqlDataSource" AllowPaging="True" Style="margin-left: 0px; margin-right: 0px; margin-top: 31px" AllowSorting="True" RowStyle-Wrap="True" OnRowCommand="OnRowCommand" DataKeyNames="id">
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

            <asp:SqlDataSource ID="atrakcyjnoscSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [atrakcyjnosc]"></asp:SqlDataSource>

        </div>
    </div>
</asp:Content>
