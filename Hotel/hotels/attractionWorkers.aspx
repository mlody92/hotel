<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="attractionWorkers.aspx.cs" Inherits="Hotel.hotels.attractionWorkers" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="MiddleContentPlaceHolder" runat="server">
     <div class="post">
        <div class="postheader">
            <h1>Atrakcja - pracownicy</h1>
        </div>
        <div class="postcontent">
            <div id="body">
                <div>
                    <p>
                        <asp:Label ID="komunikatLabel" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
                    </p> <p>
                        <asp:Label ID="Label1" runat="server" Text="Pracownicy do przydzielenia" ForeColor="#009900"></asp:Label>
                    </p>
                    <p>
                        <asp:GridView GridLines="None" CellSpacing="-1" class="bordered" ID="GridView1" runat="server" DataSourceID="atrworkSqlDataSource1" AutoGenerateColumns="False" OnRowCommand="OnRowCommand">
                            <Columns>
                                <asp:BoundField DataField="stanowisko" HeaderText="stanowisko" SortExpression="stanowisko" />
                                <asp:BoundField DataField="pensja_user" HeaderText="pensja_user" SortExpression="pensja_user" />
                                <asp:BoundField DataField="ilosc_obslugiwanych" HeaderText="ilosc_obslugiwanych" SortExpression="ilosc_obslugiwanych" />
                           <asp:TemplateField ShowHeader="False" ItemStyle-Width="140px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="przydziel" Text="Przydziel" CommandArgument='<%#Eval("PracId")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="atrworkSqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT user_pracownik.id AS PracId, pracownik.stanowisko, user_pracownik.pensja_user, pracownik.ilosc_obslugiwanych, user_pracownik.pracownik_id FROM dzialka_user INNER JOIN user_pracownik ON dzialka_user.id = user_pracownik.dzialka_id INNER JOIN pracownik ON user_pracownik.pracownik_id = pracownik.id WHERE (dzialka_user.id = @dzialka_user) AND (user_pracownik.id NOT IN (SELECT pracownik_id FROM atrakcja_pracownik)) AND (user_pracownik.pracownik_id = @pracownikId)"></asp:SqlDataSource>
                    </p>
                    <br />
                    <br />
                    <br />
                     <p>
                        <asp:GridView GridLines="None" CellSpacing="-1" class="bordered" ID="GridView2" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" OnRowCommand="OnRowCommand">
                            <Columns>
                                <asp:BoundField DataField="stanowisko" HeaderText="stanowisko" SortExpression="stanowisko" />
                                <asp:BoundField DataField="pensja_user" HeaderText="pensja_user" SortExpression="pensja_user" />
                                <asp:BoundField DataField="ilosc_obslugiwanych" HeaderText="ilosc_obslugiwanych" SortExpression="ilosc_obslugiwanych" />
                           <asp:TemplateField ShowHeader="False" ItemStyle-Width="140px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="przydziel" Text="Przydziel" CommandArgument='<%#Eval("PracId")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT user_pracownik.id AS PracId, pracownik.stanowisko, user_pracownik.pensja_user, pracownik.ilosc_obslugiwanych, user_pracownik.pracownik_id FROM dzialka_user INNER JOIN user_pracownik ON dzialka_user.id = user_pracownik.dzialka_id INNER JOIN pracownik ON user_pracownik.pracownik_id = pracownik.id WHERE (dzialka_user.id = @dzialka_user) AND (user_pracownik.id IN (SELECT pracownik_id FROM atrakcja_pracownik)) AND (user_pracownik.pracownik_id = @pracownikId)"></asp:SqlDataSource>
                    </p>
                </div>
            </div>
        </div>
        <div class="postfooter"></div>

    </div>
</asp:Content>
