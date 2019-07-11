<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="rooms.aspx.cs" Inherits="Hotel.hotels.rooms" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="MiddleContentPlaceHolder" runat="server">
    
     <div class="post">
        <div class="postheader">
            <h1>Filtrowanie</h1>
        </div>
        <div class="postcontent">
            <div id="body">
                <div>
                    <p>

                        <asp:DropDownList CssClass="dropdown" ID="wojDropDownList" runat="server" DataSourceID="wojSqlDataSource" DataTextField="nazwa" DataValueField="id" AutoPostBack="True" AppendDataBoundItems="true">
                            <asp:ListItem Text="Wszystkie" Value="-1"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="wojSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [wojewodztwo]"></asp:SqlDataSource>


                        <asp:DropDownList CssClass="dropdown" ID="miastoDropDownList" runat="server" DataSourceID="miastoSqlDataSource" DataTextField="nazwa" DataValueField="id" AutoPostBack="True">
                            <%-- <asp:ListItem Text="Wszystkie" Value ="-1"></asp:ListItem>--%>
                        </asp:DropDownList>
                        <asp:LinkButton ID="filtrujButton" runat="server" >Filtruj</asp:LinkButton>
                        <asp:SqlDataSource ID="miastoSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [nazwa], [id], [id_wojewodztwo] FROM [miasto] WHERE ([id_wojewodztwo] = @id_wojewodztwo)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="wojDropDownList" DefaultValue="-1" Name="id_wojewodztwo" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </p>
                </div>
                <div>
                    <p>
                        <asp:GridView GridLines="None" CellSpacing="-1" class="bordered" ID="filterHoteleGridView" runat="server" DataSourceID="filterSqlDataSource" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="OnRowCommand">
                            <Columns>
                                <asp:BoundField DataField="nazwa" HeaderText="nazwa" InsertVisible="False" ReadOnly="True" SortExpression="nazwa" />
                                <asp:BoundField DataField="cena" HeaderText="cena" SortExpression="cena" />
                                <asp:BoundField DataField="nazwaMiasto" HeaderText="nazwaMiasto" SortExpression="nazwaMiasto" />
                                <asp:BoundField DataField="nazwaWoj" HeaderText="nazwaWoj" SortExpression="nazwaWoj" />
                                <asp:BoundField DataField="rodzaj" HeaderText="rodzaj" SortExpression="rodzaj" />
                                <asp:BoundField DataField="nazwaAtr" HeaderText="nazwaAtr" SortExpression="nazwaAtr" />
                                <asp:TemplateField ShowHeader="False" ItemStyle-Width="140px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="wybierz" Text="Wybierz" CommandArgument='<%#Eval("dzialkaID")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="filterSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT dzialka.id, dzialka.id_miasto, dzialka.nazwa, dzialka.cena, miasto.nazwa AS nazwaMiasto, wojewodztwo.nazwa AS nazwaWoj, rodzaj_hotelu.rodzaj, atrakcyjnosc.nazwa AS nazwaAtr, dzialka_user.id AS dzialkaID FROM dzialka INNER JOIN miasto ON dzialka.id_miasto = miasto.id INNER JOIN rodzaj_hotelu ON dzialka.rodzaj_hotelu = rodzaj_hotelu.id INNER JOIN atrakcyjnosc ON dzialka.rodzaj_hotelu = atrakcyjnosc.id INNER JOIN wojewodztwo ON miasto.id_wojewodztwo = wojewodztwo.id INNER JOIN dzialka_user ON dzialka.id = dzialka_user.dzialka_id WHERE (dzialka.id_miasto = @id_miasto) AND (dzialka.id IN (SELECT dzialka_id FROM dzialka_user AS dzialka_user_1 WHERE (uzytkownik_id = @uzytkownik_id))) AND (dzialka.status LIKE 'aktywny')">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="miastoDropDownList" DefaultValue="-1" Name="id_miasto" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>


                        <asp:GridView GridLines="None" CellSpacing="-1" class="bordered" ID="allhoteleGridView" runat="server" DataSourceID="allhoteleSqlDataSource" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="OnRowCommand">
                            <Columns>
                                <asp:BoundField DataField="nazwa" HeaderText="nazwa" InsertVisible="False" ReadOnly="True" SortExpression="nazwa" />
                                <asp:BoundField DataField="cena" HeaderText="cena" SortExpression="cena" />
                                <asp:BoundField DataField="nazwaMiasto" HeaderText="nazwaMiasto" SortExpression="nazwaMiasto" />
                                <asp:BoundField DataField="nazwaWoj" HeaderText="nazwaWoj" SortExpression="nazwaWoj" />
                                <asp:BoundField DataField="rodzaj" HeaderText="rodzaj" SortExpression="rodzaj" />
                                <asp:BoundField DataField="nazwaAtr" HeaderText="nazwaAtr" SortExpression="nazwaAtr" />
                                <asp:TemplateField HeaderText="Przeglądaj" ItemStyle-Width="140px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="wybierz" Text="Wybierz" CommandArgument='<%#Eval("dzialkaID")%>' />
                                   </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="allhoteleSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT dzialka.id, dzialka.id_miasto, dzialka.nazwa, dzialka.cena, miasto.nazwa AS nazwaMiasto, wojewodztwo.nazwa AS nazwaWoj, rodzaj_hotelu.rodzaj, atrakcyjnosc.nazwa AS nazwaAtr, dzialka_user.id AS dzialkaID FROM dzialka INNER JOIN miasto ON dzialka.id_miasto = miasto.id INNER JOIN rodzaj_hotelu ON dzialka.rodzaj_hotelu = rodzaj_hotelu.id INNER JOIN atrakcyjnosc ON dzialka.rodzaj_hotelu = atrakcyjnosc.id INNER JOIN wojewodztwo ON miasto.id_wojewodztwo = wojewodztwo.id INNER JOIN dzialka_user ON dzialka.id = dzialka_user.dzialka_id WHERE (dzialka.id IN (SELECT dzialka_id FROM dzialka_user AS dzialka_user_1 WHERE (uzytkownik_id = @uzytkownik_id))) AND (dzialka.status LIKE 'aktywny')"></asp:SqlDataSource>
                    </p>
                </div>

            </div>
        </div>
        <div class="postfooter"></div>

    </div>

</asp:Content>
