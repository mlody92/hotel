<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="myAttraction.aspx.cs" Inherits="Hotel.hotels.myAttraction" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="MiddleContentPlaceHolder" runat="server">

    <div class="post">
        <div class="postheader">
            <h1>Moje atrakcje</h1>
        </div>
        <div class="postcontent">
            <div id="body">
                <div>
                    <p>
                        <asp:Label ID="komunikatLabel" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
                    </p>
                    <p>
                        <asp:GridView GridLines="None" CellSpacing="-1" class="bordered" ID="myAttrGridView" runat="server" DataSourceID="myattrSqlDataSource" AutoGenerateColumns="False" OnRowCommand="OnRowCommand">
                            <Columns>
                                <asp:BoundField DataField="nazwa" HeaderText="nazwa" SortExpression="nazwa" />
                               
                                <asp:BoundField DataField="koszt_miesieczny" HeaderText="koszt_miesieczny" SortExpression="koszt_miesieczny" />
                                <asp:BoundField DataField="koszt" HeaderText="koszt" SortExpression="koszt" />
                                <asp:BoundField DataField="procent" HeaderText="procent" SortExpression="procent" />
                                <asp:BoundField DataField="stanowisko" HeaderText="stanowisko" SortExpression="stanowisko" />
                                <asp:BoundField DataField="ilosc_prac" HeaderText="ilosc_prac" ReadOnly="True" SortExpression="ilosc_prac" />
                                <asp:TemplateField HeaderText="Przeglądaj" ItemStyle-Width="140px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="pracownicy" Text="Pracownicy" CommandArgument='<%#Eval("atrID")+","+Eval("pracID")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="myattrSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT pracownik.id as pracID,atrakcja.nazwa, atrakcja.koszt_miesieczny, atrakcja.koszt, atrakcja.procent, pracownik.stanowisko, (SELECT COUNT(*) AS Expr1 FROM atrakcja_pracownik INNER JOIN user_atrakcja ON user_atrakcja.id = atrakcja_pracownik.atrakcja_id WHERE (user_atrakcja.id = user_atrakcja_1.id)) AS ilosc_prac, user_atrakcja_1.id AS atrID FROM dzialka_user INNER JOIN user_atrakcja AS user_atrakcja_1 ON dzialka_user.id = user_atrakcja_1.dzialka_id INNER JOIN atrakcja ON user_atrakcja_1.atrakcja_id = atrakcja.id INNER JOIN pracownik ON atrakcja.id_pracownik = pracownik.id WHERE (dzialka_user.id = @dzialka_user)"></asp:SqlDataSource>
                    </p>
                </div>
                 <br />
                <br />
                 <div>
                    <p>
                        <asp:Label ID="Label1" runat="server" Text="Dostępni pracownicy" ForeColor="#009900"></asp:Label>
                    </p>
                    <p>
                        <asp:GridView GridLines="None" CellSpacing="-1" class="bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="stanowisko" HeaderText="stanowisko" SortExpression="stanowisko" />
                                <asp:BoundField DataField="Expr1" HeaderText="Expr1" ReadOnly="True" SortExpression="Expr1" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT pracownik.stanowisko, COUNT(*) AS Expr1 FROM dzialka_user INNER JOIN user_pracownik ON dzialka_user.id = user_pracownik.dzialka_id INNER JOIN pracownik ON user_pracownik.pracownik_id = pracownik.id WHERE (dzialka_user.id = @dzialka_user) AND (user_pracownik.id NOT IN (SELECT pracownik_id FROM atrakcja_pracownik)) GROUP BY user_pracownik.pracownik_id, pracownik.stanowisko"></asp:SqlDataSource>
                    </p>
                </div>
            </div>
        </div>
        <div class="postfooter"></div>

    </div>
</asp:Content>
