<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="worker.aspx.cs" Inherits="Hotel.workers.worker" %>

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
                    <asp:Label ID="komunikatLabel" runat="server" Text="Ustal pensję pracownikom." ForeColor="#00CC00"></asp:Label>
                </p>
                <div id="zmianaPensji" runat="server" visible="false">
                    <table>
                        <tr>
                            <td>
                                <p>Ustal nową pensję: </p>
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

                <div>
                    <p>
                        <asp:GridView GridLines="None" CellSpacing="-1" class="bordered" ID="myWorkerGridView" runat="server" DataSourceID="myWorkerSqlDataSource" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="OnRowCommand">
                            <Columns>
                                <asp:BoundField DataField="stanowisko" HeaderText="stanowisko" InsertVisible="False" ReadOnly="True" SortExpression="stanowisko" />
                                <asp:BoundField DataField="ilosc" HeaderText="ilosc" SortExpression="ilosc" />
                                <asp:BoundField DataField="pensja_user" HeaderText="pensja_user" SortExpression="pensja_user" />
                                <asp:BoundField DataField="pensjaTmp" HeaderText="pensjaTmp" SortExpression="pensjaTmp" />
                                <asp:TemplateField ItemStyle-Width="140px">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="pensja" Text="Ustal pensję" CommandArgument='<%#Eval("pracID")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="myWorkerSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT pracownik.stanowisko as stanowisko, pracownik.id, pracownik.ilosc_obslugiwanych AS ilosc, user_pracownik.pensja_user as pensja_user,user_pracownik.pensja_user_tmp AS pensjaTmp, user_pracownik.id AS pracID, user_pracownik.dzialka_id, user_pracownik.pracownik_id, dzialka_user.id AS Expr2 FROM pracownik INNER JOIN user_pracownik ON pracownik.id = user_pracownik.pracownik_id INNER JOIN dzialka_user ON user_pracownik.dzialka_id = dzialka_user.id WHERE (dzialka_user.id = @dzialka_user)"></asp:SqlDataSource>
                    </p>
                </div>

            </div>
        </div>
        <div class="postfooter"></div>
    </div>
</asp:Content>
