<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin2.Master" AutoEventWireup="true" CodeBehind="manage.aspx.cs" Inherits="Hotel.Admin.hotels.manage" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="messageContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="taskContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="alertsContentPlaceHolder" runat="server">
</asp:Content>--%>
<asp:Content ID="Content5" ContentPlaceHolderID="pageContentPlaceHolder" runat="server">

    <div class="box">
        <header>
            <h5>Działka - nieaktywna</h5>
            <div class="toolbar">
                <div class="btn-group">
                    <a href="#sortableTable1" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                        <i class="icon-chevron-up"></i>
                    </a>
                </div>
            </div>
        </header>
        <div id="sortableTable1" class="body in">
            <asp:GridView ID="GridView1" class="table table-bordered sortableTable responsive-table" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="nieaktywnySqlDataSource" OnRowCommand="OnRowCommand">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="nazwa" HeaderText="Nazwa" SortExpression="nazwa" />
                    <asp:BoundField DataField="cena" HeaderText="Cena" SortExpression="cena" />
                    <asp:BoundField DataField="nazwa1" HeaderText="Miasto" SortExpression="nazwa1" />
                    <asp:BoundField DataField="nazwa2" HeaderText="nazwa2" SortExpression="nazwa2" />
                    <asp:BoundField DataField="nazwa3" HeaderText="nazwa3" SortExpression="nazwa3" />
                    <asp:BoundField DataField="rodzaj" HeaderText="rodzaj" SortExpression="rodzaj" />
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="140px">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="edytuj" Text="Edytuj" CommandArgument='<%#Eval("id")%>' />
                            &nbsp&nbsp/&nbsp&nbsp
                             <asp:LinkButton ID="LinkButton2" runat="server" CommandName="usun" Text="Usuń" CommandArgument='<%#Eval("id")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="aktywuj" Text="Aktywuj" CommandArgument='<%#Eval("id")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="nieaktywnySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT dzialka.id, dzialka.nazwa, dzialka.atrakcyjnosc_id, dzialka.cena, miasto.nazwa AS nazwa1, atrakcyjnosc.nazwa AS nazwa2, rodzaj_hotelu.rodzaj, wojewodztwo.nazwa AS nazwa3 FROM dzialka INNER JOIN miasto ON dzialka.id_miasto = miasto.id INNER JOIN rodzaj_hotelu ON dzialka.rodzaj_hotelu = rodzaj_hotelu.id INNER JOIN atrakcyjnosc ON dzialka.rodzaj_hotelu = atrakcyjnosc.id INNER JOIN wojewodztwo ON miasto.id_wojewodztwo = wojewodztwo.id WHERE (dzialka.status LIKE '%' + @status + '%')">
                <SelectParameters>
                    <asp:Parameter DefaultValue="nieaktywny" Name="status" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>



    <div class="box">
        <header>
            <h5>Działka - aktywna</h5>
            <div class="toolbar">
                <div class="btn-group">
                    <a href="#sortableTable2" data-toggle="collapse" class="btn btn-default btn-sm accordion-toggle minimize-box">
                        <i class="icon-chevron-up"></i>
                    </a>
                </div>
            </div>
        </header>
        <div id="sortableTable2" class="body in">
            <asp:GridView ID="GridView2" class="table table-bordered sortableTable responsive-table" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="aktywnySqlDataSource" OnRowCommand="OnRowCommand">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="nazwa" HeaderText="Nazwa" SortExpression="nazwa" />
                    <asp:BoundField DataField="cena" HeaderText="Cena" SortExpression="cena" />
                    <asp:BoundField DataField="nazwa1" HeaderText="Miasto" SortExpression="nazwa1" />
                    <asp:BoundField DataField="nazwa2" HeaderText="nazwa2" SortExpression="nazwa2" />
                    <asp:BoundField DataField="nazwa3" HeaderText="nazwa3" SortExpression="nazwa3" />
                    <asp:BoundField DataField="rodzaj" HeaderText="rodzaj" SortExpression="rodzaj" />
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="140px">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="edytuj" Text="Edytuj" CommandArgument='<%#Eval("id")%>' />
                            &nbsp&nbsp/&nbsp&nbsp
                             <asp:LinkButton ID="LinkButton2" runat="server" CommandName="usun" Text="Usuń" CommandArgument='<%#Eval("id")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="dezaktywuj" Text="Dezaktywuj" CommandArgument='<%#Eval("id")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="aktywnySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT dzialka.id, dzialka.nazwa, dzialka.atrakcyjnosc_id, dzialka.cena, miasto.nazwa AS nazwa1, atrakcyjnosc.nazwa AS nazwa2, rodzaj_hotelu.rodzaj, wojewodztwo.nazwa AS nazwa3 FROM dzialka INNER JOIN miasto ON dzialka.id_miasto = miasto.id INNER JOIN rodzaj_hotelu ON dzialka.rodzaj_hotelu = rodzaj_hotelu.id INNER JOIN atrakcyjnosc ON dzialka.rodzaj_hotelu = atrakcyjnosc.id INNER JOIN wojewodztwo ON miasto.id_wojewodztwo = wojewodztwo.id WHERE (dzialka.status LIKE @status + '%')">
                <SelectParameters>
                    <asp:Parameter DefaultValue="aktywny" Name="status" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </div>


</asp:Content>

