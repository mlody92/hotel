<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="myRooms.aspx.cs" Inherits="Hotel.myRooms" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="RightContentPlaceHolder" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="MiddleContentPlaceHolder" runat="server">
    <div class="post">
        <div class="postheader">
            <h1>Moje pokoje</h1>
        </div>
        <div class="postcontent">
            <div id="body">
                <div>
                    <p>
                        <asp:Label ID="komunikatLabel" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
                    </p>
                    <p>
                        <asp:Label ID="Label2" runat="server" Text="Budowa pokoju" ForeColor="#009900"></asp:Label>
                    </p>
                    <p>
                        <asp:GridView GridLines="None" CellSpacing="-1" class="bordered" ID="myroomGridView" runat="server" DataSourceID="myroomSqlDataSource" AutoGenerateColumns="False" OnRowCommand="OnRowCommand">
                            <Columns>
                                <asp:BoundField DataField="rodzaj" HeaderText="rodzaj" SortExpression="rodzaj" />
                                <asp:BoundField DataField="koszt" HeaderText="koszt" SortExpression="koszt" />
                                <asp:BoundField DataField="zysk" HeaderText="zysk" SortExpression="zysk" />
                                <asp:BoundField DataField="stanowisko" HeaderText="stanowisko" SortExpression="stanowisko" />
                                <asp:TemplateField ItemStyle-Width="140px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="wybuduj" Text="Wybuduj" CommandArgument='<%#Eval("id")+","+Eval("koszt")+","+Eval("zysk")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="myroomSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT pokoj.id,pokoj.rodzaj, pokoj.koszt, pokoj.zysk, pracownik.stanowisko FROM pokoj INNER JOIN pracownik ON pokoj.id_pracownik = pracownik.id INNER JOIN atrakcyjnosc ON pokoj.atrakcyjnosc_id = atrakcyjnosc.id INNER JOIN dzialka ON atrakcyjnosc.id = dzialka.rodzaj_hotelu INNER JOIN dzialka_user ON dzialka.id = dzialka_user.dzialka_id WHERE (dzialka_user.id = @dzialka_user) AND pokoj.status='aktywny';"></asp:SqlDataSource>
                    </p>
                </div>
                <br />
                <br />
                <div>
                    <p>
                        <asp:Label ID="Label1" runat="server" Text="Twoje pokoje" ForeColor="#009900"></asp:Label>
                    </p>
                    <div id="zmianaCeny" runat="server" visible="false">
                        <table>
                            <tr>
                                <td>
                                    <p>Wpisz nową cenę: </p>
                                     <p><asp:Label ID="Label3" runat="server" Text="Uwaga. Jeśli cena będzie za duża to nikt nie wynajmie pokoju." ForeColor="#CC9900"></asp:Label></p>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" TextMode="Number"></asp:TextBox>
                                </td>
                                <td>
                                    <p>
                                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Zatwierdź</asp:LinkButton>
                                    </p>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <p>
                        <asp:GridView GridLines="None" CellSpacing="-1" class="bordered" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" OnRowCommand="OnRowCommand">
                            <Columns>
                                <asp:BoundField DataField="rodzaj" HeaderText="rodzaj" SortExpression="rodzaj" />
                                <asp:BoundField DataField="zysk" HeaderText="zysk" SortExpression="zysk" />
                                <asp:BoundField DataField="stanowisko" HeaderText="stanowisko" SortExpression="stanowisko" />
                                <asp:BoundField DataField="cena_user" HeaderText="cena_user" SortExpression="cena_user" />
                                <asp:TemplateField ItemStyle-Width="140px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="cena" Text="Ustal cenę" CommandArgument='<%#Eval("id")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT user_pokoj.id,user_pokoj.cena_user,pokoj.rodzaj, pokoj.zysk, pracownik.stanowisko FROM user_pokoj INNER JOIN pokoj ON user_pokoj.pokoj_id = pokoj.id INNER JOIN pracownik ON pokoj.id_pracownik = pracownik.id WHERE (user_pokoj.dzialka_id = @dzialka_user)"></asp:SqlDataSource>
                    </p>
                </div>
            </div>
        </div>
        <div class="postfooter"></div>

    </div>

</asp:Content>
