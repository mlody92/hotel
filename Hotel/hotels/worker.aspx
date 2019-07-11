<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="worker.aspx.cs" Inherits="Hotel.hotels.worker" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="MiddleContentPlaceHolder" runat="server">

    <div class="post">
        <div class="postheader">
            <h1>Pracownicy</h1>
        </div>
        <div class="postcontent">
            <div id="body">
                <p>
                    <asp:Label ID="Label1" runat="server" Text="Uwaga! Przy zatrudnieniu pobierana jest miesięczna pensja (średnia)." ForeColor="Red"></asp:Label></p>
                <div>
                    <p>
                        <asp:GridView GridLines="None" CellSpacing="-1" class="bordered" ID="GridView1" runat="server" DataSourceID="zatrudnijSqlDataSource" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="OnRowCommand">
                            <Columns>
                                <asp:BoundField DataField="stanowisko" HeaderText="stanowisko" SortExpression="stanowisko" />
                                <asp:BoundField DataField="pensja_min" HeaderText="pensja_min" SortExpression="pensja_min" />
                                <asp:BoundField DataField="pensja_srednia" HeaderText="pensja_srednia" SortExpression="pensja_srednia" />
                                <asp:BoundField DataField="ilosc_obslugiwanych" HeaderText="ilosc_obslugiwanych" SortExpression="ilosc_obslugiwanych" />
                                <asp:TemplateField ShowHeader="False" ItemStyle-Width="140px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="zatrudnij" Text="Zatrudnij" CommandArgument='<%#Eval("id")+ "," +Eval("pensja_srednia")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="zatrudnijSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [pracownik]"></asp:SqlDataSource>
                    </p>
                </div>
                <p><asp:Label ID="komunikatLabel" runat="server" Text="Label" Visible="false" ForeColor="#00CC00"></asp:Label></p>
                <div>
                     <p>
                        <asp:Label ID="Label3" runat="server" ForeColor="Yellow" Visible="false"></asp:Label>
                    </p>
                    <p>
                        <asp:Label ID="Label2" runat="server" Text="Dostępni pracownicy" ForeColor="#009900"></asp:Label>
                    </p>
                    <p>
                        <asp:GridView GridLines="None" CellSpacing="-1" class="bordered" ID="GridView2" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
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
